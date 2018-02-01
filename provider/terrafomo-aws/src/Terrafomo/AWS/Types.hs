-- This module was auto-generated. If it is modified, it will not be overwritten.

{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE FunctionalDependencies     #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase                 #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE UndecidableInstances       #-}

{-# OPTIONS_GHC -fno-warn-orphans #-}

-- |
-- Module      : Terrafomo.AWS.Types
-- Copyright   : (c) 2017 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.AWS.Types
    (
    -- * General
      Tags                  (..)
    , Region                (..)
    , Zone                  (..)

    -- * S3
    , S3BucketVersioning    (..)
    , s3BucketVersioning

    -- * DynamoDB
    , DynamoAttributeType   (..)
    , DynamoTableAttributes (..)

    -- * Classy Fields
    , HasEnabled            (..)
    , HasMfaDelete          (..)

    -- * Formatters
    , fregion
    , fzone
    , fzonesuf

    -- * Re-exported Types
    , Bool
    , Natural
    , Word16
    ) where

import Data.Map.Strict (Map)
import Data.Maybe      (catMaybes)
import Data.Text       (Text)
import Data.Word       (Word16)

import GHC.Base (Bool)
import GHC.Exts (IsList (..))

import Lens.Micro (Lens', lens)

import Network.AWS.Types (Region (..))

import Numeric.Natural (Natural)

import Terrafomo

import Formatting (Format, (%))

import qualified Data.Text.Lazy.Builder as Build
import qualified Formatting             as Format
import qualified Network.AWS.Data.Text  as AWS
import qualified Terrafomo.Syntax.HCL   as HCL

newtype Tags = Tags { fromTags :: Map Text Text }
    deriving (Show, Eq)

instance HCL.ToHCL Tags where
    toHCL = HCL.pairs . fromTags

instance IsList Tags where
    type Item Tags = (Text, Text)

    toList   = toList . fromTags
    fromList = Tags   . fromList

-- | A specific AWS availability zone.
data Zone = Zone !Region !Char
    deriving (Show, Eq)

instance HCL.ToHCL Zone where
    toHCL = HCL.toHCL . Format.bprint fzone

-- | Format an AWS region name.
fregion :: Format r (Region -> r)
fregion = Format.later (Build.fromText . AWS.toText)

-- Orphan instance for amazonka types.
instance HCL.ToHCL Region where
    toHCL = HCL.toHCL . Format.bprint fregion

-- | Format an AWS availability zone name.
fzone :: Format r (Zone -> r)
fzone =
    Format.later $ \(Zone reg suf) ->
        Format.bprint (fregion % Format.char) reg suf

-- | Format an AWS availability zone suffix.
fzonesuf :: Format r (Zone -> r)
fzonesuf =
    Format.later $ \(Zone _ suf) ->
        Format.bprint Format.char suf

-- S3

data S3BucketVersioning s = S3BucketVersioning
    { _enabled    :: !(Attribute s "enabled" Bool)
    -- ^ Enable versioning. Once you version-enable a bucket, it can never
    -- return to an unversioned state. You can, however, suspend versioning on
    -- that bucket.
    , _mfa_delete :: !(Attribute s "mfa_delete" Bool)
    -- ^ Enable MFA delete for either Change the versioning state of your
    -- bucket or Permanently delete an object version. Default is false.
    } deriving (Show, Eq)

s3BucketVersioning :: S3BucketVersioning s
s3BucketVersioning = S3BucketVersioning
    { _enabled    = constant False
    , _mfa_delete = constant False
    }

instance HCL.ToHCL (S3BucketVersioning s) where
    toHCL S3BucketVersioning{..} = HCL.block $ catMaybes
        [ HCL.attribute _enabled
        , HCL.attribute _mfa_delete
        ]

instance HasEnabled (S3BucketVersioning s) s Bool where
    enabled = lens _enabled (\s a -> s { _enabled = a })

instance HasMfaDelete (S3BucketVersioning s) s Bool where
    mfaDelete = lens _mfa_delete (\s a -> s { _mfa_delete = a })

-- DynamoDB

-- | One of: S, N, or B for (S)tring, (N)umber or (B)inary data.
data DynamoAttributeType
    = DynamoString
    | DynamoNumber
    | DynamoBinary
      deriving (Show, Eq)

instance HCL.ToHCL DynamoAttributeType where
    toHCL = HCL.string . \case
        DynamoString -> "S"
        DynamoNumber -> "N"
        DynamoBinary -> "B"

-- | Multiple pairings of attribute names to their types.
newtype DynamoTableAttributes = DynamoTableAttributes
    { fromDynamoTableAttributes :: Map Text DynamoAttributeType
    } deriving (Show, Eq)

instance IsList DynamoTableAttributes where
    type Item DynamoTableAttributes = (Text, DynamoAttributeType)

    toList   = toList . fromDynamoTableAttributes
    fromList = DynamoTableAttributes . fromList

instance HCL.ToHCL DynamoTableAttributes where
    toHCL = HCL.block . map (uncurry go) . toList
      where
        go k v =
            HCL.block
                [ HCL.assign "name" k
                , HCL.assign "type" v
                ]

-- Field Classes

-- FIXME: This is not observed by the actual generated classes so duplicates
-- currently exist - additionally these should be re-exported by the schema.ede
-- template, possible along with smart constructors for the above types.

class HasEnabled a s b | a -> s b where
    enabled :: Lens' a (Attribute s "enabled" b)

instance HasEnabled a s b => HasEnabled (Resource p a) s b where
    enabled = configuration . enabled

class HasMfaDelete a s b | a -> s b where
    mfaDelete :: Lens' a (Attribute s "mfa_delete" b)

instance HasMfaDelete a s b => HasMfaDelete (Resource p a) s b where
    mfaDelete = configuration . mfaDelete
