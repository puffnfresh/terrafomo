-- This module is auto-generated.

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE StrictData        #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Rundeck.Resource
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Rundeck.Resource
    (
    -- * Resource Datatypes
    -- ** rundeck_job
      JobResource (..)
    , jobResource

    -- ** rundeck_private_key
    , PrivateKeyResource (..)
    , privateKeyResource

    -- ** rundeck_project
    , ProjectResource (..)
    , projectResource

    -- ** rundeck_public_key
    , PublicKeyResource (..)
    , publicKeyResource

    ) where

import Data.Functor ((<$>))
import Data.Maybe   (catMaybes)

import GHC.Base (($))

import Terrafomo.Rundeck.Settings

import qualified Data.Hashable              as P
import qualified Data.HashMap.Strict        as P
import qualified Data.List.NonEmpty         as P
import qualified Data.Text                  as P
import qualified GHC.Generics               as P
import qualified Lens.Micro                 as P
import qualified Prelude                    as P
import qualified Terrafomo.Attribute        as TF
import qualified Terrafomo.HCL              as TF
import qualified Terrafomo.Name             as TF
import qualified Terrafomo.Rundeck.Lens     as P
import qualified Terrafomo.Rundeck.Provider as P
import qualified Terrafomo.Rundeck.Types    as P
import qualified Terrafomo.Schema           as TF

-- | @rundeck_job@ Resource.
--
-- See the <https://www.terraform.io/docs/providers/Rundeck/rundeck_job terraform documentation>
-- for more information.
data JobResource s = JobResource'
    { _allowConcurrentExecutions   :: TF.Attr s P.Bool
    -- ^ @allow_concurrent_executions@ - (Optional)
    --
    , _command                     :: TF.Attr s [Command s]
    -- ^ @command@ - (Required)
    --
    , _commandOrderingStrategy     :: TF.Attr s P.Text
    -- ^ @command_ordering_strategy@ - (Optional)
    --
    , _continueOnError             :: TF.Attr s P.Bool
    -- ^ @continue_on_error@ - (Optional)
    --
    , _description                 :: TF.Attr s P.Text
    -- ^ @description@ - (Required)
    --
    , _groupName                   :: TF.Attr s P.Text
    -- ^ @group_name@ - (Optional)
    --
    , _logLevel                    :: TF.Attr s P.Text
    -- ^ @log_level@ - (Optional)
    --
    , _maxThreadCount              :: TF.Attr s P.Integer
    -- ^ @max_thread_count@ - (Optional)
    --
    , _name                        :: TF.Attr s P.Text
    -- ^ @name@ - (Required)
    --
    , _nodeFilterExcludePrecedence :: TF.Attr s P.Bool
    -- ^ @node_filter_exclude_precedence@ - (Optional)
    --
    , _nodeFilterQuery             :: TF.Attr s P.Text
    -- ^ @node_filter_query@ - (Optional)
    --
    , _option                      :: TF.Attr s [Option s]
    -- ^ @option@ - (Optional)
    --
    , _projectName                 :: TF.Attr s P.Text
    -- ^ @project_name@ - (Required)
    --
    , _rankAttribute               :: TF.Attr s P.Text
    -- ^ @rank_attribute@ - (Optional)
    --
    , _rankOrder                   :: TF.Attr s P.Text
    -- ^ @rank_order@ - (Optional)
    --
    , _schedule                    :: TF.Attr s P.Text
    -- ^ @schedule@ - (Optional)
    --
    } deriving (P.Show, P.Eq, P.Generic)

instance TF.IsObject (JobResource s) where
    toObject JobResource'{..} = catMaybes
        [ TF.assign "allow_concurrent_executions" <$> TF.attribute _allowConcurrentExecutions
        , TF.assign "command" <$> TF.attribute _command
        , TF.assign "command_ordering_strategy" <$> TF.attribute _commandOrderingStrategy
        , TF.assign "continue_on_error" <$> TF.attribute _continueOnError
        , TF.assign "description" <$> TF.attribute _description
        , TF.assign "group_name" <$> TF.attribute _groupName
        , TF.assign "log_level" <$> TF.attribute _logLevel
        , TF.assign "max_thread_count" <$> TF.attribute _maxThreadCount
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "node_filter_exclude_precedence" <$> TF.attribute _nodeFilterExcludePrecedence
        , TF.assign "node_filter_query" <$> TF.attribute _nodeFilterQuery
        , TF.assign "option" <$> TF.attribute _option
        , TF.assign "project_name" <$> TF.attribute _projectName
        , TF.assign "rank_attribute" <$> TF.attribute _rankAttribute
        , TF.assign "rank_order" <$> TF.attribute _rankOrder
        , TF.assign "schedule" <$> TF.attribute _schedule
        ]

jobResource
    :: TF.Attr s [Command s] -- ^ @command@ - 'P.command'
    -> TF.Attr s P.Text -- ^ @description@ - 'P.description'
    -> TF.Attr s P.Text -- ^ @name@ - 'P.name'
    -> TF.Attr s P.Text -- ^ @project_name@ - 'P.projectName'
    -> TF.Resource P.Provider (JobResource s)
jobResource _command _description _name _projectName =
    TF.newResource "rundeck_job" $
        JobResource'
            { _allowConcurrentExecutions = TF.Nil
            , _command = _command
            , _commandOrderingStrategy = TF.value "node-first"
            , _continueOnError = TF.Nil
            , _description = _description
            , _groupName = TF.Nil
            , _logLevel = TF.value "INFO"
            , _maxThreadCount = TF.value 1
            , _name = _name
            , _nodeFilterExcludePrecedence = TF.Nil
            , _nodeFilterQuery = TF.Nil
            , _option = TF.Nil
            , _projectName = _projectName
            , _rankAttribute = TF.Nil
            , _rankOrder = TF.value "ascending"
            , _schedule = TF.Nil
            }

instance P.HasAllowConcurrentExecutions (JobResource s) (TF.Attr s P.Bool) where
    allowConcurrentExecutions =
        P.lens (_allowConcurrentExecutions :: JobResource s -> TF.Attr s P.Bool)
               (\s a -> s { _allowConcurrentExecutions = a
                          } :: JobResource s)

instance P.HasCommand (JobResource s) (TF.Attr s [Command s]) where
    command =
        P.lens (_command :: JobResource s -> TF.Attr s [Command s])
               (\s a -> s { _command = a
                          } :: JobResource s)

instance P.HasCommandOrderingStrategy (JobResource s) (TF.Attr s P.Text) where
    commandOrderingStrategy =
        P.lens (_commandOrderingStrategy :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _commandOrderingStrategy = a
                          } :: JobResource s)

instance P.HasContinueOnError (JobResource s) (TF.Attr s P.Bool) where
    continueOnError =
        P.lens (_continueOnError :: JobResource s -> TF.Attr s P.Bool)
               (\s a -> s { _continueOnError = a
                          } :: JobResource s)

instance P.HasDescription (JobResource s) (TF.Attr s P.Text) where
    description =
        P.lens (_description :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _description = a
                          } :: JobResource s)

instance P.HasGroupName (JobResource s) (TF.Attr s P.Text) where
    groupName =
        P.lens (_groupName :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _groupName = a
                          } :: JobResource s)

instance P.HasLogLevel (JobResource s) (TF.Attr s P.Text) where
    logLevel =
        P.lens (_logLevel :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _logLevel = a
                          } :: JobResource s)

instance P.HasMaxThreadCount (JobResource s) (TF.Attr s P.Integer) where
    maxThreadCount =
        P.lens (_maxThreadCount :: JobResource s -> TF.Attr s P.Integer)
               (\s a -> s { _maxThreadCount = a
                          } :: JobResource s)

instance P.HasName (JobResource s) (TF.Attr s P.Text) where
    name =
        P.lens (_name :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _name = a
                          } :: JobResource s)

instance P.HasNodeFilterExcludePrecedence (JobResource s) (TF.Attr s P.Bool) where
    nodeFilterExcludePrecedence =
        P.lens (_nodeFilterExcludePrecedence :: JobResource s -> TF.Attr s P.Bool)
               (\s a -> s { _nodeFilterExcludePrecedence = a
                          } :: JobResource s)

instance P.HasNodeFilterQuery (JobResource s) (TF.Attr s P.Text) where
    nodeFilterQuery =
        P.lens (_nodeFilterQuery :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _nodeFilterQuery = a
                          } :: JobResource s)

instance P.HasOption (JobResource s) (TF.Attr s [Option s]) where
    option =
        P.lens (_option :: JobResource s -> TF.Attr s [Option s])
               (\s a -> s { _option = a
                          } :: JobResource s)

instance P.HasProjectName (JobResource s) (TF.Attr s P.Text) where
    projectName =
        P.lens (_projectName :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _projectName = a
                          } :: JobResource s)

instance P.HasRankAttribute (JobResource s) (TF.Attr s P.Text) where
    rankAttribute =
        P.lens (_rankAttribute :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _rankAttribute = a
                          } :: JobResource s)

instance P.HasRankOrder (JobResource s) (TF.Attr s P.Text) where
    rankOrder =
        P.lens (_rankOrder :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _rankOrder = a
                          } :: JobResource s)

instance P.HasSchedule (JobResource s) (TF.Attr s P.Text) where
    schedule =
        P.lens (_schedule :: JobResource s -> TF.Attr s P.Text)
               (\s a -> s { _schedule = a
                          } :: JobResource s)

instance s ~ s' => P.HasComputedId (TF.Ref s' (JobResource s)) (TF.Attr s P.Text) where
    computedId x = TF.compute (TF.refKey x) "_computedId"

instance s ~ s' => P.HasComputedPreserveOptionsOrder (TF.Ref s' (JobResource s)) (TF.Attr s P.Bool) where
    computedPreserveOptionsOrder x = TF.compute (TF.refKey x) "_computedPreserveOptionsOrder"

-- | @rundeck_private_key@ Resource.
--
-- See the <https://www.terraform.io/docs/providers/Rundeck/rundeck_private_key terraform documentation>
-- for more information.
data PrivateKeyResource s = PrivateKeyResource'
    { _keyMaterial :: TF.Attr s P.Text
    -- ^ @key_material@ - (Required)
    -- The private key material to store, in PEM format
    --
    , _path        :: TF.Attr s P.Text
    -- ^ @path@ - (Required)
    -- Path to the key within the key store
    --
    } deriving (P.Show, P.Eq, P.Generic)

instance TF.IsObject (PrivateKeyResource s) where
    toObject PrivateKeyResource'{..} = catMaybes
        [ TF.assign "key_material" <$> TF.attribute _keyMaterial
        , TF.assign "path" <$> TF.attribute _path
        ]

privateKeyResource
    :: TF.Attr s P.Text -- ^ @key_material@ - 'P.keyMaterial'
    -> TF.Attr s P.Text -- ^ @path@ - 'P.path'
    -> TF.Resource P.Provider (PrivateKeyResource s)
privateKeyResource _keyMaterial _path =
    TF.newResource "rundeck_private_key" $
        PrivateKeyResource'
            { _keyMaterial = _keyMaterial
            , _path = _path
            }

instance P.HasKeyMaterial (PrivateKeyResource s) (TF.Attr s P.Text) where
    keyMaterial =
        P.lens (_keyMaterial :: PrivateKeyResource s -> TF.Attr s P.Text)
               (\s a -> s { _keyMaterial = a
                          } :: PrivateKeyResource s)

instance P.HasPath (PrivateKeyResource s) (TF.Attr s P.Text) where
    path =
        P.lens (_path :: PrivateKeyResource s -> TF.Attr s P.Text)
               (\s a -> s { _path = a
                          } :: PrivateKeyResource s)

-- | @rundeck_project@ Resource.
--
-- See the <https://www.terraform.io/docs/providers/Rundeck/rundeck_project terraform documentation>
-- for more information.
data ProjectResource s = ProjectResource'
    { _defaultNodeExecutorPlugin :: TF.Attr s P.Text
    -- ^ @default_node_executor_plugin@ - (Optional)
    --
    , _defaultNodeFileCopierPlugin :: TF.Attr s P.Text
    -- ^ @default_node_file_copier_plugin@ - (Optional)
    --
    , _description :: TF.Attr s P.Text
    -- ^ @description@ - (Optional)
    -- Description of the project to be shown in the Rundeck UI
    --
    , _extraConfig :: TF.Attr s (P.HashMap P.Text (TF.Attr s P.Text))
    -- ^ @extra_config@ - (Optional)
    -- Additional raw configuration parameters to include in the project
    -- configuration, with dots replaced with slashes in the key names due to
    -- limitations in Terraform's config language.
    --
    , _name :: TF.Attr s P.Text
    -- ^ @name@ - (Required)
    -- Unique name for the project
    --
    , _resourceModelSource :: TF.Attr s [ResourceModelSource s]
    -- ^ @resource_model_source@ - (Required)
    --
    , _sshAuthenticationType :: TF.Attr s P.Text
    -- ^ @ssh_authentication_type@ - (Optional)
    --
    , _sshKeyFilePath :: TF.Attr s P.Text
    -- ^ @ssh_key_file_path@ - (Optional)
    --
    , _sshKeyStoragePath :: TF.Attr s P.Text
    -- ^ @ssh_key_storage_path@ - (Optional)
    --
    } deriving (P.Show, P.Eq, P.Generic)

instance TF.IsObject (ProjectResource s) where
    toObject ProjectResource'{..} = catMaybes
        [ TF.assign "default_node_executor_plugin" <$> TF.attribute _defaultNodeExecutorPlugin
        , TF.assign "default_node_file_copier_plugin" <$> TF.attribute _defaultNodeFileCopierPlugin
        , TF.assign "description" <$> TF.attribute _description
        , TF.assign "extra_config" <$> TF.attribute _extraConfig
        , TF.assign "name" <$> TF.attribute _name
        , TF.assign "resource_model_source" <$> TF.attribute _resourceModelSource
        , TF.assign "ssh_authentication_type" <$> TF.attribute _sshAuthenticationType
        , TF.assign "ssh_key_file_path" <$> TF.attribute _sshKeyFilePath
        , TF.assign "ssh_key_storage_path" <$> TF.attribute _sshKeyStoragePath
        ]

projectResource
    :: TF.Attr s P.Text -- ^ @name@ - 'P.name'
    -> TF.Attr s [ResourceModelSource s] -- ^ @resource_model_source@ - 'P.resourceModelSource'
    -> TF.Resource P.Provider (ProjectResource s)
projectResource _name _resourceModelSource =
    TF.newResource "rundeck_project" $
        ProjectResource'
            { _defaultNodeExecutorPlugin = TF.value "jsch-ssh"
            , _defaultNodeFileCopierPlugin = TF.value "jsch-scp"
            , _description = TF.value "Managed by Terraform"
            , _extraConfig = TF.Nil
            , _name = _name
            , _resourceModelSource = _resourceModelSource
            , _sshAuthenticationType = TF.value "privateKey"
            , _sshKeyFilePath = TF.Nil
            , _sshKeyStoragePath = TF.Nil
            }

instance P.HasDefaultNodeExecutorPlugin (ProjectResource s) (TF.Attr s P.Text) where
    defaultNodeExecutorPlugin =
        P.lens (_defaultNodeExecutorPlugin :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _defaultNodeExecutorPlugin = a
                          } :: ProjectResource s)

instance P.HasDefaultNodeFileCopierPlugin (ProjectResource s) (TF.Attr s P.Text) where
    defaultNodeFileCopierPlugin =
        P.lens (_defaultNodeFileCopierPlugin :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _defaultNodeFileCopierPlugin = a
                          } :: ProjectResource s)

instance P.HasDescription (ProjectResource s) (TF.Attr s P.Text) where
    description =
        P.lens (_description :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _description = a
                          } :: ProjectResource s)

instance P.HasExtraConfig (ProjectResource s) (TF.Attr s (P.HashMap P.Text (TF.Attr s P.Text))) where
    extraConfig =
        P.lens (_extraConfig :: ProjectResource s -> TF.Attr s (P.HashMap P.Text (TF.Attr s P.Text)))
               (\s a -> s { _extraConfig = a
                          } :: ProjectResource s)

instance P.HasName (ProjectResource s) (TF.Attr s P.Text) where
    name =
        P.lens (_name :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _name = a
                          } :: ProjectResource s)

instance P.HasResourceModelSource (ProjectResource s) (TF.Attr s [ResourceModelSource s]) where
    resourceModelSource =
        P.lens (_resourceModelSource :: ProjectResource s -> TF.Attr s [ResourceModelSource s])
               (\s a -> s { _resourceModelSource = a
                          } :: ProjectResource s)

instance P.HasSshAuthenticationType (ProjectResource s) (TF.Attr s P.Text) where
    sshAuthenticationType =
        P.lens (_sshAuthenticationType :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _sshAuthenticationType = a
                          } :: ProjectResource s)

instance P.HasSshKeyFilePath (ProjectResource s) (TF.Attr s P.Text) where
    sshKeyFilePath =
        P.lens (_sshKeyFilePath :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _sshKeyFilePath = a
                          } :: ProjectResource s)

instance P.HasSshKeyStoragePath (ProjectResource s) (TF.Attr s P.Text) where
    sshKeyStoragePath =
        P.lens (_sshKeyStoragePath :: ProjectResource s -> TF.Attr s P.Text)
               (\s a -> s { _sshKeyStoragePath = a
                          } :: ProjectResource s)

instance s ~ s' => P.HasComputedUiUrl (TF.Ref s' (ProjectResource s)) (TF.Attr s P.Text) where
    computedUiUrl x = TF.compute (TF.refKey x) "_computedUiUrl"

-- | @rundeck_public_key@ Resource.
--
-- See the <https://www.terraform.io/docs/providers/Rundeck/rundeck_public_key terraform documentation>
-- for more information.
data PublicKeyResource s = PublicKeyResource'
    { _path :: TF.Attr s P.Text
    -- ^ @path@ - (Required)
    -- Path to the key within the key store
    --
    } deriving (P.Show, P.Eq, P.Generic)

instance TF.IsObject (PublicKeyResource s) where
    toObject PublicKeyResource'{..} = catMaybes
        [ TF.assign "path" <$> TF.attribute _path
        ]

publicKeyResource
    :: TF.Attr s P.Text -- ^ @path@ - 'P.path'
    -> TF.Resource P.Provider (PublicKeyResource s)
publicKeyResource _path =
    TF.newResource "rundeck_public_key" $
        PublicKeyResource'
            { _path = _path
            }

instance P.HasPath (PublicKeyResource s) (TF.Attr s P.Text) where
    path =
        P.lens (_path :: PublicKeyResource s -> TF.Attr s P.Text)
               (\s a -> s { _path = a
                          } :: PublicKeyResource s)

instance s ~ s' => P.HasComputedDelete (TF.Ref s' (PublicKeyResource s)) (TF.Attr s P.Bool) where
    computedDelete x = TF.compute (TF.refKey x) "_computedDelete"

instance s ~ s' => P.HasComputedKeyMaterial (TF.Ref s' (PublicKeyResource s)) (TF.Attr s P.Text) where
    computedKeyMaterial x = TF.compute (TF.refKey x) "_computedKeyMaterial"

instance s ~ s' => P.HasComputedUrl (TF.Ref s' (PublicKeyResource s)) (TF.Attr s P.Text) where
    computedUrl x = TF.compute (TF.refKey x) "_computedUrl"
