-- This module is auto-generated.

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE StrictData        #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Template.Provider
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Template.Provider
    (
    -- * Template Provider Datatype
      Template (..)
    , newProvider
    , defaultProvider

    -- * Template Specific Aliases
    , DataSource
    , Resource
    ) where

import Data.Function ((&))
import Data.Functor  ((<$>))
import Data.Proxy    (Proxy (Proxy))

import GHC.Base (($))

import Terrafomo.Template.Settings

import qualified Data.Hashable            as P
import qualified Data.HashMap.Strict      as P
import qualified Data.List.NonEmpty       as P
import qualified Data.Maybe               as P
import qualified Data.Text.Lazy           as P
import qualified GHC.Generics             as P
import qualified Lens.Micro               as P
import qualified Prelude                  as P
import qualified Terrafomo.HCL            as TF
import qualified Terrafomo.Schema         as TF
import qualified Terrafomo.Template.Lens  as P
import qualified Terrafomo.Template.Types as P

type DataSource a = TF.Resource Template ()               a
type Resource   a = TF.Resource Template (TF.Lifecycle a) a

-- | The @template@ Terraform provider configuration.
--
-- See the <https://www.terraform.io/docs/providers/template/index.html terraform documentation>
-- for more information.
data Template = Template'
    deriving (P.Show, P.Eq, P.Generic)

instance P.Hashable (Template)

-- | Specify a new Template provider configuration.
newProvider
    :: Template
newProvider =
    Template'

{- | The 'Template' provider with absent configuration that is used
to instantiate new 'Resource's and 'DataSource's. Provider configuration can be
overridden on a per-resource basis by using the 'Terrafomo.provider' lens, the
'newProvider' constructor, and any of the applicable lenses.

For example:

@
import qualified Terrafomo as TF
import qualified Terrafomo.Template.Provider as Template

TF.newExampleResource "foo"
    & TF.provider ?~
          Template.(newProvider
@
-}
defaultProvider :: TF.Provider Template
defaultProvider =
    TF.defaultProvider "template" (P.Just "~> 1.0")
        P.mempty
