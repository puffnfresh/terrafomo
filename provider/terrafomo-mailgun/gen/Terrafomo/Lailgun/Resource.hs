-- This module is auto-generated.

{-# LANGUAGE DuplicateRecordFields  #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RecordWildCards        #-}
{-# LANGUAGE ScopedTypeVariables    #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.Lailgun.Resource
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.Lailgun.Resource
    (
    -- * Types
      DomainResource (..)
    , domainResource

    -- * Overloaded Fields
    -- ** Arguments
    , P.HasName (..)
    , P.HasSmtpPassword (..)
    , P.HasSpamAction (..)
    , P.HasWildcard (..)

    -- ** Computed Attributes
    , P.HasComputedName (..)
    , P.HasComputedReceivingRecords (..)
    , P.HasComputedSendingRecords (..)
    , P.HasComputedSmtpLogin (..)
    , P.HasComputedSmtpPassword (..)
    , P.HasComputedSpamAction (..)
    , P.HasComputedWildcard (..)

    -- * Re-exported Types
    , module P
    ) where

import Data.Maybe (catMaybes)
import Data.Text  (Text)

import GHC.Base (Eq, ($))
import GHC.Show (Show)

import Lens.Micro (lens)

import qualified Data.Word                  as P
import qualified GHC.Base                   as P
import qualified Numeric.Natural            as P
import qualified Terrafomo.IP               as P
import qualified Terrafomo.Lailgun.Lens     as P
import qualified Terrafomo.Lailgun.Provider as P
import           Terrafomo.Lailgun.Types    as P

import qualified Terrafomo.Attribute as TF
import qualified Terrafomo.HCL       as TF
import qualified Terrafomo.Source    as TF

{- | The @mailgun_domain@ Lailgun resource.

Provides a Mailgun App resource. This can be used to create and manage
applications on Mailgun.
-}
data DomainResource s = DomainResource {
      _name          :: !(TF.Attribute s Text)
    {- ^ (Required) The domain to add to Mailgun -}
    , _smtp_password :: !(TF.Attribute s Text)
    {- ^ (Required) Password for SMTP authentication -}
    , _spam_action   :: !(TF.Attribute s Text)
    {- ^ (Optional) @disabled@ or @tag@ Disable, no spam filtering will occur for inbound messages. Tag, messages will be tagged with a spam header. -}
    , _wildcard      :: !(TF.Attribute s Text)
    {- ^ (Optional) Boolean that determines whether the domain will accept email for sub-domains. -}
    } deriving (Show, Eq)

instance TF.ToHCL (DomainResource s) where
    toHCL DomainResource{..} = TF.block $ catMaybes
        [ TF.attribute "name" _name
        , TF.attribute "smtp_password" _smtp_password
        , TF.attribute "spam_action" _spam_action
        , TF.attribute "wildcard" _wildcard
        ]

instance P.HasName (DomainResource s) s Text where
    name =
        lens (_name :: DomainResource s -> TF.Attribute s Text)
            (\s a -> s { _name = a } :: DomainResource s)

instance P.HasSmtpPassword (DomainResource s) s Text where
    smtpPassword =
        lens (_smtp_password :: DomainResource s -> TF.Attribute s Text)
            (\s a -> s { _smtp_password = a } :: DomainResource s)

instance P.HasSpamAction (DomainResource s) s Text where
    spamAction =
        lens (_spam_action :: DomainResource s -> TF.Attribute s Text)
            (\s a -> s { _spam_action = a } :: DomainResource s)

instance P.HasWildcard (DomainResource s) s Text where
    wildcard =
        lens (_wildcard :: DomainResource s -> TF.Attribute s Text)
            (\s a -> s { _wildcard = a } :: DomainResource s)

instance P.HasComputedName (DomainResource s) Text

instance P.HasComputedReceivingRecords (DomainResource s) Text

instance P.HasComputedSendingRecords (DomainResource s) Text

instance P.HasComputedSmtpLogin (DomainResource s) Text

instance P.HasComputedSmtpPassword (DomainResource s) Text

instance P.HasComputedSpamAction (DomainResource s) Text

instance P.HasComputedWildcard (DomainResource s) Text

domainResource :: TF.Resource P.Lailgun (DomainResource s)
domainResource =
    TF.newResource "mailgun_domain" $
        DomainResource {
              _name = TF.Nil
            , _smtp_password = TF.Nil
            , _spam_action = TF.Nil
            , _wildcard = TF.Nil
            }
