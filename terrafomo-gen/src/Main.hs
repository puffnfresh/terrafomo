{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE NamedFieldPuns    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TupleSections     #-}

module Main (main) where

import Control.Applicative (many)
import Control.Error       (Script, hoistEither, runScript, scriptIO)
import Control.Monad       (unless, when)

import Data.Aeson     (FromJSON, ToJSON)
import Data.Bifunctor (first)
import Data.Function  ((&))
import Data.Maybe     (isJust)
import Data.Semigroup (Semigroup ((<>)))

import System.FilePath ((<.>), (</>))

import Terrafomo.Gen.Parser   (Parser)
import Terrafomo.Gen.Provider
import Terrafomo.Gen.Render   (Templates (Templates))
import Terrafomo.Gen.Schema

import qualified Data.Char            as Char
import qualified Data.Foldable        as Fold
import qualified Data.Text            as Text
import qualified Data.Text.IO         as Text
import qualified Data.Text.Lazy       as LText
import qualified Data.Text.Lazy.IO    as LText
import qualified Data.Yaml            as YAML
import qualified Options.Applicative  as Option
import qualified System.Directory     as Dir
import qualified System.Exit          as Exit
import qualified System.FilePath      as Path
import qualified System.IO            as IO
import qualified System.Process       as Process
import qualified Terrafomo.Gen.Parser as Parser
import qualified Terrafomo.Gen.Render as Render
import qualified Text.EDE             as EDE

-- TODO: FIXME:
--
-- * Removing the following providers and expose Haskell functionality to replace:
--     - * template
--     - * random
--     - * local
--     - * archive?
--
-- * Continue investigating having a Dhall frontend
-- * Provide an 'Unsafe' constructor/lens for 'Attr' which allows arbitrary
--   insertion of HCL as 'Text'.
-- * Re-enable usage example parser.

-- Options Parsing

data Options = Options
    { configDir       :: !FilePath
    , schemaDir       :: !FilePath
    , patchDir        :: !FilePath
    , templateDir     :: !FilePath
    , providerAlias   :: !String
    , providerFile    :: !FilePath
    , resourceFiles   :: ![FilePath]
    , dataSourceFiles :: ![FilePath]
    } deriving (Show)

optionsParser :: Option.Parser Options
optionsParser = Options
    <$> Option.strOption
         ( Option.long "config-dir"
        <> Option.help "The directory to read provider configuration."
        <> Option.metavar "DIR"
         )

    <*> Option.strOption
         ( Option.long "schema-dir"
        <> Option.help "The directory to read/write user modifiable schemas."
        <> Option.metavar "DIR"
         )

    <*> Option.strOption
         ( Option.long "patch-dir"
        <> Option.help "The directory containing files generated by 'diff -u'."
        <> Option.metavar "DIR"
         )

    <*> Option.strOption
         ( Option.long "template-dir"
        <> Option.help "The directory containing EDE templates for rendering."
        <> Option.metavar "DIR"
         )

    <*> Option.strOption
         ( Option.long "provider-name"
        <> Option.help "The Terraform provider name."
        <> Option.metavar "NAME"
         )

    <*> Option.strOption
         ( Option.long "provider-file"
        <> Option.help "The markdown file containing provider information."
        <> Option.metavar "FILE"
         )

    <*> many (Option.strOption
         ( Option.long "resource-file"
        <> Option.help "A markdown file containing resource information."
        <> Option.metavar "FILE"
         ))

    <*> many (Option.strOption
         ( Option.long "datasource-file"
        <> Option.help "A markdown file containing datasource information."
        <> Option.metavar "FILE"
         ))

parserInfo :: Option.ParserInfo Options
parserInfo =
     ( Option.header "Terrafomo Haskell Types Generator"
    <> Option.fullDesc
          & Option.info
              ( Option.helper
            <*> optionsParser
              )
     )

-- Main

main :: IO ()
main = do
    let prefs = Option.prefs Option.showHelpOnError

    opts <- Option.customExecParser prefs parserInfo

    runScript $ do
        echo "Starting ..."

        tmpls    <- loadTemplates opts
        provider <- loadProvider opts
        dir      <- renderProvider tmpls provider

        renderSchemas tmpls dir provider Resource
            =<< loadResources opts

        renderSchemas tmpls dir provider DataSource
            =<< loadDataSources opts

        echo "Done."

-- Provider

loadProvider :: Options -> Script (Provider (Maybe Schema))
loadProvider opts = do
    let path@Path{markdownFile} = providerPath opts
        configFile              = configDir opts </> providerAlias opts <.> "yaml"

    provider <- parseYAML configFile

    if not (providerDatatype provider)
        then pure (Nothing <$ provider)
        else do
            exists <- scriptIO (Dir.doesFileExist markdownFile)
            echo ("Provider " ++ markdownFile ++ " == " ++ show exists)

            schema <- loadSchema Parser.providerParser path
            pure (Just schema <$ provider)

loadResources :: Options -> Script [Schema]
loadResources = traverse (loadSchema Parser.schemaParser) . resourcePaths

loadDataSources :: Options -> Script [Schema]
loadDataSources = traverse (loadSchema Parser.schemaParser) . dataSourcePaths

-- Schema

loadSchema :: (ToJSON a, FromJSON a, Semigroup a) => Parser a -> Path -> Script a
loadSchema parser path =
    patchSchema path
        >> parseSchema parser path
            >>= updateSchema path

updateSchema :: (ToJSON a, FromJSON a, Semigroup a) => Path -> a -> Script a
updateSchema Path{schemaFile} input = do
    exists <- scriptIO (Dir.doesFileExist schemaFile)
    echo ("Schema " ++ schemaFile ++ " == " ++ show exists)

    output <-
        if not exists
            then pure input
            else do
                echo ("Reading " ++ schemaFile)
                (input <>) <$> parseYAML schemaFile

    echo ("Writing " ++ schemaFile)
    createDirectory (Path.takeDirectory schemaFile)
    scriptIO (YAML.encodeFile schemaFile output)

    pure output

patchSchema :: Path -> Script ()
patchSchema Path{markdownFile, patchFile} = do
    exists <- scriptIO (Dir.doesFileExist patchFile)
    echo ("Patch " ++ patchFile ++ " == " ++ show exists)

    when exists $ do
        echo ("Patching " ++ markdownFile)
        code <- scriptIO . Process.system $
            unwords [ "patch -N -r"
                    , patchFile <.> "rej"
                    , markdownFile
                    , patchFile
                    , "1>&2"
                    ]

        when (code /= Exit.ExitSuccess) $
            echo ("Failure applying patch " ++ patchFile)

parseSchema :: Parser a -> Path -> Script a
parseSchema parser Path{markdownFile} = do
    echo ("Parsing " ++ markdownFile)
    scriptIO (Text.readFile markdownFile)
        >>= hoistEither . Parser.runParser parser markdownFile

-- Rendering

renderProvider
    :: Templates EDE.Template
    -> Provider (Maybe Schema)
    -> Script FilePath
renderProvider tmpls p@Provider{providerPackage, providerDatatype} = do
    let dir = maybe "terrafomo" (Path.combine "provider" . Text.unpack)
                    providerPackage

    Fold.for_ providerPackage $
        const (renderPackage tmpls dir p)

    when (isJust providerDatatype) $
        hoistEither (Render.provider tmpls p)
            >>= writeNS (dir </> "gen")

    pure dir

renderPackage
    :: Templates EDE.Template
    -> FilePath
    -> Provider (Maybe Schema)
    -> Script ()
renderPackage tmpls dir p = do
    let packageFile = dir    </> "package" <.> "yaml"
        srcDir      = dir    </> "src"
        mainFile    = srcDir </> pathNS (mainNS  p)
        typesFile   = srcDir </> pathNS (typesNS p)

    createDirectory dir

    echo ("Writing " ++ packageFile)
    hoistEither (Render.package tmpls p)
        >>= scriptIO . LText.writeFile packageFile

    mainExists <- scriptIO (Dir.doesFileExist mainFile)
    echo ("Main " ++ mainFile ++ " == " ++ show mainExists)
    unless mainExists $
        hoistEither (Render.main tmpls p)
            >>= writeNS srcDir

    typesExists <- scriptIO (Dir.doesFileExist typesFile)
    echo ("Types " ++ typesFile ++ " == " ++ show typesExists)
    unless typesExists $
        hoistEither (Render.types tmpls p)
            >>= writeNS srcDir

renderSchemas
    :: Templates EDE.Template
    -> FilePath
    -> Provider (Maybe a)
    -> SchemaType
    -> [Schema]
    -> Script ()
renderSchemas tmpls dir p typ xs
    | null xs   = pure ()
    | otherwise = do
        let writeModule = writeNS (dir </> "gen")
        hoistEither (Render.schemas tmpls p typ xs)
            >>= writeModule

writeNS :: FilePath -> (NS, LText.Text) -> Script ()
writeNS dir (ns, text) = do
    let moduleFile = dir </> pathNS ns <.> "hs"
    echo ("Writing " ++ moduleFile)
    createDirectory (Path.takeDirectory moduleFile)
    scriptIO (LText.writeFile moduleFile text)

-- Paths

data Path = Path
    { markdownFile :: !FilePath
    , schemaFile   :: !FilePath
    , patchFile    :: !FilePath
    }

providerPath :: Options -> Path
providerPath Options{..} =
    let markdownFile = providerFile
        schemaFile   = schemaDir </> providerAlias <.> "yaml"
        patchFile    = patchDir  </> providerAlias <.> "patch"
     in Path{..}

resourcePaths :: Options -> [Path]
resourcePaths opts = map (schemaPath opts Resource) (resourceFiles opts)

dataSourcePaths :: Options -> [Path]
dataSourcePaths opts = map (schemaPath opts DataSource) (dataSourceFiles opts)

schemaPath :: Options -> SchemaType -> FilePath -> Path
schemaPath Options{providerAlias, schemaDir, patchDir} typ file =
    let name         = Path.dropExtensions (Path.takeBaseName file)
        prefix       = [Char.toLower (head (show typ))]
        markdownFile = file
        schemaFile   = schemaDir </> providerAlias </> prefix </> name <.> "yaml"
        patchFile    = patchDir  </> providerAlias </> prefix </> name <.> "patch"
     in Path{..}

-- EDE Templating

loadTemplates :: Options -> Script (Templates EDE.Template)
loadTemplates Options{templateDir} =
    traverse (parseEDE . Path.combine templateDir) $
        Templates
            { packageTemplate  = "package.ede"
            , providerTemplate = "provider.ede"
            , schemaTemplate   = "schema.ede"
            , mainTemplate     = "main.ede"
            , typesTemplate    = "types.ede"
            }

parseEDE :: FilePath -> Script EDE.Template
parseEDE file = do
    echo ("Parsing EDE from " ++ file)
    first Text.pack
        <$> scriptIO (EDE.eitherParseFile file)
        >>= hoistEither

-- YAML

parseYAML :: FromJSON a => FilePath -> Script a
parseYAML file = do
    echo ("Parsing YAML from " ++ file)
    first (Text.pack . YAML.prettyPrintParseException)
        <$> scriptIO (YAML.decodeFileEither file)
        >>= hoistEither

-- Standard IO

echo :: String -> Script ()
echo = scriptIO . IO.putStrLn

createDirectory :: FilePath -> Script ()
createDirectory = scriptIO . Dir.createDirectoryIfMissing True
