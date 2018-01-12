{-# LANGUAGE DeriveGeneric       #-}
{-# LANGUAGE LambdaCase          #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE RecordWildCards     #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Terraform.Gen.Example
    ( Example (..)
    , renderHCL
    ) where

import Data.Aeson         (FromJSON, ToJSON)
import Data.Bifunctor     (first)
import Data.Function      (on)
import Data.List.NonEmpty (NonEmpty ((:|)))
import Data.Map.Strict    (Map)
import Data.Monoid        ((<>))
import Data.Text          (Text)
import Data.Void          (Void)

import GHC.Generics (Generic)

import Terraform.Gen.Text
import Terraform.Syntax.HCL

import Text.Megaparsec              ((<?>))
import Text.PrettyPrint.Leijen.Text (Doc, Pretty (pretty, prettyList), (<$$>),
                                     (<$$>), (<+>))

import qualified Data.Aeson                   as JSON
import qualified Data.Foldable                as Fold
import qualified Data.List                    as List
import qualified Data.Map.Strict              as Map
import qualified Data.Text                    as Text
import qualified Terraform.Gen.JSON           as JSON
import qualified Terraform.Syntax.Parser      as HCL
import qualified Text.Megaparsec              as P
import qualified Text.Megaparsec.Char         as P
import qualified Text.PrettyPrint.Leijen.Text as PP

data Example = Example
    { exampleName :: !(Maybe Text)
    , exampleCode :: ![Text]
    } deriving (Show, Generic)

instance ToJSON Example where
    toJSON = JSON.genericToJSON (JSON.options "example")

instance FromJSON Example where
    parseJSON = JSON.genericParseJSON (JSON.options "example")

renderHCL :: Text -> Either String [Text]
renderHCL = fmap render . HCL.runParser HCL.statementsParser "<renderHCL>"
  where
    render =
          Text.lines
        . Text.pack
        . show
        . PP.vcat
        . List.intersperse " "
        . map value

    resource   = pretty . Text.toLower . resourceName
    datasource = pretty . Text.toLower . dataSourceName

    value = \case
        Object (Ident "resource" :| [Quoted r, Quoted n]) vs ->
            let name = Text.toLower n
             in pretty name <+> "<-" <+> "resource" <+> PP.dquotes (pretty (name)) <+> PP.nest 4
                ( "$" <$$> PP.nest 4
                    ( resource r <$$> PP.vcat (map value vs)
                    )
                )

        Object (Ident "data" :| [Quoted d, Quoted n]) vs ->
            let name = Text.toLower n
             in pretty name <+> "<-" <+> "datasource" <+> PP.dquotes (pretty (name)) <+> PP.nest 4
                ( "$" <$$> PP.nest 4
                    ( datasource d <$$> PP.vcat (map value vs)
                    )
                )

        Object (Ident "output" :| [Quoted n]) [Assign (Ident "value") v] ->
            "output" <+> PP.dquotes (pretty n) <+> PP.nest 4
                ( "$" <$$> pretty v
                )

        Assign k v -> "& " <> key k <+> ".~" <+> value v

        Block  _  -> "<block>"
        List   vs -> PP.list (map value vs)
        Bool   b  -> pretty b
        Number n  -> pretty n
        Float  d  -> pretty d
        String x  -> interpolate x

        _         -> mempty

    key = \case
        Ident  k -> pretty k
        Quoted k -> PP.dquotes (pretty k)

type Parser = P.Parsec Void String

interpolate :: Interpolate -> Doc
interpolate = \case
    Chunks   xs -> PP.hcat . List.intersperse "<>" $ map interpolate xs
    Chunk    s  -> PP.dquotes (pretty s)
    Template s  -> stringParse computeParser s

stringParse :: Parser Doc -> String -> Doc
stringParse p s =
    case P.runParser p "" s of
        Left  _ -> pretty s
        Right x -> x

computeParser :: Parser Doc
computeParser = do
    let sep  = '.'
        path = P.takeWhile1P Nothing (/= sep)

    _    <- path <* P.char sep <?> "type"
    name <- path <* P.char sep <?> "name"
    attr <- path <* P.eof      <?> "attribute"

    pure $! "compute"
        <+> pretty name
        <+> "@" <> PP.dquotes (pretty attr)