-- This module is auto-generated.

{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Google.Provider
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Google.Provider
    ( Google   (..)
    , HasGoogle (..)
    , defaultGoogle
    ) where

import Data.Hashable      (Hashable)
import Data.List.NonEmpty (NonEmpty ((:|)))
import Data.Maybe         (catMaybes)
import Data.Text          (Text)

import GHC.Generics (Generic)

import qualified Terrafomo.Google.Types as TF
import qualified Terrafomo.Syntax.HCL      as TF
import qualified Terrafomo.Syntax.Name     as TF
import qualified Terrafomo.Syntax.Provider as TF
import qualified Terrafomo.Syntax.Variable as TF
import qualified Terrafomo.TH              as TF

{- | Google Terraform provider.

The Google Cloud provider is used to interact with
<https://cloud.google.com/> . The provider needs to be configured with the
proper credentials before it can be used. Use the navigation to the left to
read about the available resources.
-}
data Google = Google {
    } deriving (Show, Eq, Generic)

instance Hashable Google

instance TF.ToHCL Google where
    toHCL x = TF.block $ catMaybes [
        ]

$(TF.makeClassyProvider ''Google)

defaultGoogle :: TF.Provider Google
defaultGoogle =
    TF.Provider "google" Nothing

