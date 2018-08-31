-- This module is auto-generated.

{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE StrictData        #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.TLS.DataSource01
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.TLS.DataSource01
    (
    -- ** tls_public_key
      PublicKeyData (..)
    , publicKeyData

    ) where

import Data.Functor ((<$>))

import GHC.Base (($))

import Terrafomo.TLS.Settings

import qualified Data.Hashable          as P
import qualified Data.HashMap.Strict    as P
import qualified Data.HashMap.Strict    as HashMap
import qualified Data.List.NonEmpty     as P
import qualified Data.Maybe             as P
import qualified Data.Text.Lazy         as P
import qualified GHC.Generics           as P
import qualified Lens.Micro             as P
import qualified Prelude                as P
import qualified Terrafomo.Encode       as TF
import qualified Terrafomo.HCL          as TF
import qualified Terrafomo.HIL          as TF
import qualified Terrafomo.Schema       as TF
import qualified Terrafomo.TLS.Lens     as P
import qualified Terrafomo.TLS.Provider as P
import qualified Terrafomo.TLS.Types    as P
import qualified Terrafomo.Validate     as TF

-- | @tls_public_key@ DataSource.
--
-- See the <https://www.terraform.io/docs/providers/tls/d/public_key.html terraform documentation>
-- for more information.
data PublicKeyData s = PublicKeyData'
    { _privateKeyPem :: TF.Expr s P.Text
    -- ^ @private_key_pem@ - (Required)
    -- PEM formatted string to use as the private key
    --
    } deriving (P.Show, P.Eq, P.Generic)

-- | Define a new @tls_public_key@ datasource value.
publicKeyData
    :: TF.Expr s P.Text -- ^ Lens: 'P.privateKeyPem', Field: '_privateKeyPem', HCL: @private_key_pem@
    -> P.DataSource (PublicKeyData s)
publicKeyData _privateKeyPem =
    TF.unsafeDataSource "tls_public_key" P.defaultProvider
        (\PublicKeyData'{..} -> P.mconcat
            [ TF.pair "private_key_pem" _privateKeyPem
            ])
        (PublicKeyData'
            { _privateKeyPem = _privateKeyPem
            })

instance P.Hashable (PublicKeyData s)

instance TF.HasValidator (PublicKeyData s) where
    validator = P.mempty

instance P.HasPrivateKeyPem (PublicKeyData s) (TF.Expr s P.Text) where
    privateKeyPem =
        P.lens (_privateKeyPem :: PublicKeyData s -> TF.Expr s P.Text)
            (\s a -> s { _privateKeyPem = a } :: PublicKeyData s)

instance s ~ s' => P.HasComputedId (TF.Ref s' (PublicKeyData s)) (TF.Expr s P.Text) where
    computedId x =
        TF.unsafeCompute TF.encodeAttr x "id"

instance s ~ s' => P.HasComputedAlgorithm (TF.Ref s' (PublicKeyData s)) (TF.Expr s P.Text) where
    computedAlgorithm x =
        TF.unsafeCompute TF.encodeAttr x "algorithm"

instance s ~ s' => P.HasComputedPublicKeyOpenssh (TF.Ref s' (PublicKeyData s)) (TF.Expr s P.Text) where
    computedPublicKeyOpenssh x =
        TF.unsafeCompute TF.encodeAttr x "public_key_openssh"

instance s ~ s' => P.HasComputedPublicKeyPem (TF.Ref s' (PublicKeyData s)) (TF.Expr s P.Text) where
    computedPublicKeyPem x =
        TF.unsafeCompute TF.encodeAttr x "public_key_pem"
