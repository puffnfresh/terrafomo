-- This module is auto-generated.

{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE NoImplicitPrelude      #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE RankNTypes             #-}
{-# LANGUAGE UndecidableInstances   #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- |
-- Module      : Terrafomo.GitHub.Lens
-- Copyright   : (c) 2017-2018 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+terrafomo@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Terrafomo.GitHub.Lens
    (
    -- * Overloaded Fields
    -- ** Arguments
      HasActive (..)
    , HasAllowMergeCommit (..)
    , HasAllowRebaseMerge (..)
    , HasAllowSquashMerge (..)
    , HasAutoInit (..)
    , HasBranch (..)
    , HasColor (..)
    , HasConfiguration (..)
    , HasDefaultBranch (..)
    , HasDescription (..)
    , HasEnforceAdmins (..)
    , HasEvents (..)
    , HasGitignoreTemplate (..)
    , HasHasDownloads (..)
    , HasHasIssues (..)
    , HasHasWiki (..)
    , HasHomepageUrl (..)
    , HasKey (..)
    , HasLdapDn (..)
    , HasLicenseTemplate (..)
    , HasName (..)
    , HasPermission (..)
    , HasPrivacy (..)
    , HasPrivate (..)
    , HasReadOnly (..)
    , HasRepository (..)
    , HasRequiredPullRequestReviews (..)
    , HasRequiredStatusChecks (..)
    , HasRestrictions (..)
    , HasRole (..)
    , HasSlug (..)
    , HasTeamId (..)
    , HasTitle (..)
    , HasUrl (..)
    , HasUsername (..)

    -- ** Computed Attributes
    , HasComputedAvatarUrl (..)
    , HasComputedBio (..)
    , HasComputedBlog (..)
    , HasComputedCompany (..)
    , HasComputedCreatedAt (..)
    , HasComputedDescription (..)
    , HasComputedEmail (..)
    , HasComputedFollowers (..)
    , HasComputedFollowing (..)
    , HasComputedFullName (..)
    , HasComputedGitCloneUrl (..)
    , HasComputedGpgKeys (..)
    , HasComputedGravatarId (..)
    , HasComputedHttpCloneUrl (..)
    , HasComputedId (..)
    , HasComputedLocation (..)
    , HasComputedLogin (..)
    , HasComputedMembers (..)
    , HasComputedName (..)
    , HasComputedPermission (..)
    , HasComputedPrivacy (..)
    , HasComputedPublicGists (..)
    , HasComputedPublicRepos (..)
    , HasComputedSiteAdmin (..)
    , HasComputedSshCloneUrl (..)
    , HasComputedSshKeys (..)
    , HasComputedSvnUrl (..)
    , HasComputedUpdatedAt (..)
    , HasComputedUrl (..)
    ) where

import GHC.Base ((.))

import Lens.Micro (Getting, Lens', to)

import qualified Terrafomo.Attribute as TF
import qualified Terrafomo.Lifecycle as TF
import qualified Terrafomo.Name      as TF
import qualified Terrafomo.Source    as TF

class HasActive a s b | a -> s b where
    active :: Lens' a (TF.Attribute s b)

instance HasActive a s b => HasActive (TF.Source l p a) s b where
    active = TF.configuration . active

class HasAllowMergeCommit a s b | a -> s b where
    allowMergeCommit :: Lens' a (TF.Attribute s b)

instance HasAllowMergeCommit a s b => HasAllowMergeCommit (TF.Source l p a) s b where
    allowMergeCommit = TF.configuration . allowMergeCommit

class HasAllowRebaseMerge a s b | a -> s b where
    allowRebaseMerge :: Lens' a (TF.Attribute s b)

instance HasAllowRebaseMerge a s b => HasAllowRebaseMerge (TF.Source l p a) s b where
    allowRebaseMerge = TF.configuration . allowRebaseMerge

class HasAllowSquashMerge a s b | a -> s b where
    allowSquashMerge :: Lens' a (TF.Attribute s b)

instance HasAllowSquashMerge a s b => HasAllowSquashMerge (TF.Source l p a) s b where
    allowSquashMerge = TF.configuration . allowSquashMerge

class HasAutoInit a s b | a -> s b where
    autoInit :: Lens' a (TF.Attribute s b)

instance HasAutoInit a s b => HasAutoInit (TF.Source l p a) s b where
    autoInit = TF.configuration . autoInit

class HasBranch a s b | a -> s b where
    branch :: Lens' a (TF.Attribute s b)

instance HasBranch a s b => HasBranch (TF.Source l p a) s b where
    branch = TF.configuration . branch

class HasColor a s b | a -> s b where
    color :: Lens' a (TF.Attribute s b)

instance HasColor a s b => HasColor (TF.Source l p a) s b where
    color = TF.configuration . color

class HasConfiguration a s b | a -> s b where
    configuration :: Lens' a (TF.Attribute s b)

instance HasConfiguration a s b => HasConfiguration (TF.Source l p a) s b where
    configuration = TF.configuration . configuration

class HasDefaultBranch a s b | a -> s b where
    defaultBranch :: Lens' a (TF.Attribute s b)

instance HasDefaultBranch a s b => HasDefaultBranch (TF.Source l p a) s b where
    defaultBranch = TF.configuration . defaultBranch

class HasDescription a s b | a -> s b where
    description :: Lens' a (TF.Attribute s b)

instance HasDescription a s b => HasDescription (TF.Source l p a) s b where
    description = TF.configuration . description

class HasEnforceAdmins a s b | a -> s b where
    enforceAdmins :: Lens' a (TF.Attribute s b)

instance HasEnforceAdmins a s b => HasEnforceAdmins (TF.Source l p a) s b where
    enforceAdmins = TF.configuration . enforceAdmins

class HasEvents a s b | a -> s b where
    events :: Lens' a (TF.Attribute s b)

instance HasEvents a s b => HasEvents (TF.Source l p a) s b where
    events = TF.configuration . events

class HasGitignoreTemplate a s b | a -> s b where
    gitignoreTemplate :: Lens' a (TF.Attribute s b)

instance HasGitignoreTemplate a s b => HasGitignoreTemplate (TF.Source l p a) s b where
    gitignoreTemplate = TF.configuration . gitignoreTemplate

class HasHasDownloads a s b | a -> s b where
    hasDownloads :: Lens' a (TF.Attribute s b)

instance HasHasDownloads a s b => HasHasDownloads (TF.Source l p a) s b where
    hasDownloads = TF.configuration . hasDownloads

class HasHasIssues a s b | a -> s b where
    hasIssues :: Lens' a (TF.Attribute s b)

instance HasHasIssues a s b => HasHasIssues (TF.Source l p a) s b where
    hasIssues = TF.configuration . hasIssues

class HasHasWiki a s b | a -> s b where
    hasWiki :: Lens' a (TF.Attribute s b)

instance HasHasWiki a s b => HasHasWiki (TF.Source l p a) s b where
    hasWiki = TF.configuration . hasWiki

class HasHomepageUrl a s b | a -> s b where
    homepageUrl :: Lens' a (TF.Attribute s b)

instance HasHomepageUrl a s b => HasHomepageUrl (TF.Source l p a) s b where
    homepageUrl = TF.configuration . homepageUrl

class HasKey a s b | a -> s b where
    key :: Lens' a (TF.Attribute s b)

instance HasKey a s b => HasKey (TF.Source l p a) s b where
    key = TF.configuration . key

class HasLdapDn a s b | a -> s b where
    ldapDn :: Lens' a (TF.Attribute s b)

instance HasLdapDn a s b => HasLdapDn (TF.Source l p a) s b where
    ldapDn = TF.configuration . ldapDn

class HasLicenseTemplate a s b | a -> s b where
    licenseTemplate :: Lens' a (TF.Attribute s b)

instance HasLicenseTemplate a s b => HasLicenseTemplate (TF.Source l p a) s b where
    licenseTemplate = TF.configuration . licenseTemplate

class HasName a s b | a -> s b where
    name :: Lens' a (TF.Attribute s b)

instance HasName a s b => HasName (TF.Source l p a) s b where
    name = TF.configuration . name

class HasPermission a s b | a -> s b where
    permission :: Lens' a (TF.Attribute s b)

instance HasPermission a s b => HasPermission (TF.Source l p a) s b where
    permission = TF.configuration . permission

class HasPrivacy a s b | a -> s b where
    privacy :: Lens' a (TF.Attribute s b)

instance HasPrivacy a s b => HasPrivacy (TF.Source l p a) s b where
    privacy = TF.configuration . privacy

class HasPrivate a s b | a -> s b where
    private :: Lens' a (TF.Attribute s b)

instance HasPrivate a s b => HasPrivate (TF.Source l p a) s b where
    private = TF.configuration . private

class HasReadOnly a s b | a -> s b where
    readOnly :: Lens' a (TF.Attribute s b)

instance HasReadOnly a s b => HasReadOnly (TF.Source l p a) s b where
    readOnly = TF.configuration . readOnly

class HasRepository a s b | a -> s b where
    repository :: Lens' a (TF.Attribute s b)

instance HasRepository a s b => HasRepository (TF.Source l p a) s b where
    repository = TF.configuration . repository

class HasRequiredPullRequestReviews a s b | a -> s b where
    requiredPullRequestReviews :: Lens' a (TF.Attribute s b)

instance HasRequiredPullRequestReviews a s b => HasRequiredPullRequestReviews (TF.Source l p a) s b where
    requiredPullRequestReviews = TF.configuration . requiredPullRequestReviews

class HasRequiredStatusChecks a s b | a -> s b where
    requiredStatusChecks :: Lens' a (TF.Attribute s b)

instance HasRequiredStatusChecks a s b => HasRequiredStatusChecks (TF.Source l p a) s b where
    requiredStatusChecks = TF.configuration . requiredStatusChecks

class HasRestrictions a s b | a -> s b where
    restrictions :: Lens' a (TF.Attribute s b)

instance HasRestrictions a s b => HasRestrictions (TF.Source l p a) s b where
    restrictions = TF.configuration . restrictions

class HasRole a s b | a -> s b where
    role :: Lens' a (TF.Attribute s b)

instance HasRole a s b => HasRole (TF.Source l p a) s b where
    role = TF.configuration . role

class HasSlug a s b | a -> s b where
    slug :: Lens' a (TF.Attribute s b)

instance HasSlug a s b => HasSlug (TF.Source l p a) s b where
    slug = TF.configuration . slug

class HasTeamId a s b | a -> s b where
    teamId :: Lens' a (TF.Attribute s b)

instance HasTeamId a s b => HasTeamId (TF.Source l p a) s b where
    teamId = TF.configuration . teamId

class HasTitle a s b | a -> s b where
    title :: Lens' a (TF.Attribute s b)

instance HasTitle a s b => HasTitle (TF.Source l p a) s b where
    title = TF.configuration . title

class HasUrl a s b | a -> s b where
    url :: Lens' a (TF.Attribute s b)

instance HasUrl a s b => HasUrl (TF.Source l p a) s b where
    url = TF.configuration . url

class HasUsername a s b | a -> s b where
    username :: Lens' a (TF.Attribute s b)

instance HasUsername a s b => HasUsername (TF.Source l p a) s b where
    username = TF.configuration . username

class HasComputedAvatarUrl a b | a -> b where
    computedAvatarUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedAvatarUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "avatar_url")

class HasComputedBio a b | a -> b where
    computedBio
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedBio =
        to (\x -> TF.Computed (TF.referenceKey x) "bio")

class HasComputedBlog a b | a -> b where
    computedBlog
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedBlog =
        to (\x -> TF.Computed (TF.referenceKey x) "blog")

class HasComputedCompany a b | a -> b where
    computedCompany
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedCompany =
        to (\x -> TF.Computed (TF.referenceKey x) "company")

class HasComputedCreatedAt a b | a -> b where
    computedCreatedAt
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedCreatedAt =
        to (\x -> TF.Computed (TF.referenceKey x) "created_at")

class HasComputedDescription a b | a -> b where
    computedDescription
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedDescription =
        to (\x -> TF.Computed (TF.referenceKey x) "description")

class HasComputedEmail a b | a -> b where
    computedEmail
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedEmail =
        to (\x -> TF.Computed (TF.referenceKey x) "email")

class HasComputedFollowers a b | a -> b where
    computedFollowers
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedFollowers =
        to (\x -> TF.Computed (TF.referenceKey x) "followers")

class HasComputedFollowing a b | a -> b where
    computedFollowing
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedFollowing =
        to (\x -> TF.Computed (TF.referenceKey x) "following")

class HasComputedFullName a b | a -> b where
    computedFullName
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedFullName =
        to (\x -> TF.Computed (TF.referenceKey x) "full_name")

class HasComputedGitCloneUrl a b | a -> b where
    computedGitCloneUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedGitCloneUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "git_clone_url")

class HasComputedGpgKeys a b | a -> b where
    computedGpgKeys
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedGpgKeys =
        to (\x -> TF.Computed (TF.referenceKey x) "gpg_keys")

class HasComputedGravatarId a b | a -> b where
    computedGravatarId
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedGravatarId =
        to (\x -> TF.Computed (TF.referenceKey x) "gravatar_id")

class HasComputedHttpCloneUrl a b | a -> b where
    computedHttpCloneUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedHttpCloneUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "http_clone_url")

class HasComputedId a b | a -> b where
    computedId
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedId =
        to (\x -> TF.Computed (TF.referenceKey x) "id")

class HasComputedLocation a b | a -> b where
    computedLocation
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedLocation =
        to (\x -> TF.Computed (TF.referenceKey x) "location")

class HasComputedLogin a b | a -> b where
    computedLogin
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedLogin =
        to (\x -> TF.Computed (TF.referenceKey x) "login")

class HasComputedMembers a b | a -> b where
    computedMembers
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedMembers =
        to (\x -> TF.Computed (TF.referenceKey x) "members")

class HasComputedName a b | a -> b where
    computedName
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedName =
        to (\x -> TF.Computed (TF.referenceKey x) "name")

class HasComputedPermission a b | a -> b where
    computedPermission
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPermission =
        to (\x -> TF.Computed (TF.referenceKey x) "permission")

class HasComputedPrivacy a b | a -> b where
    computedPrivacy
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPrivacy =
        to (\x -> TF.Computed (TF.referenceKey x) "privacy")

class HasComputedPublicGists a b | a -> b where
    computedPublicGists
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPublicGists =
        to (\x -> TF.Computed (TF.referenceKey x) "public_gists")

class HasComputedPublicRepos a b | a -> b where
    computedPublicRepos
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedPublicRepos =
        to (\x -> TF.Computed (TF.referenceKey x) "public_repos")

class HasComputedSiteAdmin a b | a -> b where
    computedSiteAdmin
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSiteAdmin =
        to (\x -> TF.Computed (TF.referenceKey x) "site_admin")

class HasComputedSshCloneUrl a b | a -> b where
    computedSshCloneUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSshCloneUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "ssh_clone_url")

class HasComputedSshKeys a b | a -> b where
    computedSshKeys
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSshKeys =
        to (\x -> TF.Computed (TF.referenceKey x) "ssh_keys")

class HasComputedSvnUrl a b | a -> b where
    computedSvnUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedSvnUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "svn_url")

class HasComputedUpdatedAt a b | a -> b where
    computedUpdatedAt
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedUpdatedAt =
        to (\x -> TF.Computed (TF.referenceKey x) "updated_at")

class HasComputedUrl a b | a -> b where
    computedUrl
        :: forall r s. Getting r (TF.Reference s a) (TF.Attribute s b)
    computedUrl =
        to (\x -> TF.Computed (TF.referenceKey x) "url")
