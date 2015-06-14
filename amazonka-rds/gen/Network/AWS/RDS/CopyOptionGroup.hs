{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.RDS.CopyOptionGroup
-- Copyright   : (c) 2013-2015 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- | Copies the specified option group.
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CopyOptionGroup.html>
module Network.AWS.RDS.CopyOptionGroup
    (
    -- * Request
      CopyOptionGroup
    -- ** Request constructor
    , copyOptionGroup
    -- ** Request lenses
    , copTags
    , copSourceOptionGroupIdentifier
    , copTargetOptionGroupIdentifier
    , copTargetOptionGroupDescription

    -- * Response
    , CopyOptionGroupResponse
    -- ** Response constructor
    , copyOptionGroupResponse
    -- ** Response lenses
    , cogrOptionGroup
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.RDS.Types

-- | /See:/ 'copyOptionGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'copTags'
--
-- * 'copSourceOptionGroupIdentifier'
--
-- * 'copTargetOptionGroupIdentifier'
--
-- * 'copTargetOptionGroupDescription'
data CopyOptionGroup = CopyOptionGroup'{_copTags :: [Tag], _copSourceOptionGroupIdentifier :: Text, _copTargetOptionGroupIdentifier :: Text, _copTargetOptionGroupDescription :: Text} deriving (Eq, Read, Show)

-- | 'CopyOptionGroup' smart constructor.
copyOptionGroup :: Text -> Text -> Text -> CopyOptionGroup
copyOptionGroup pSourceOptionGroupIdentifier pTargetOptionGroupIdentifier pTargetOptionGroupDescription = CopyOptionGroup'{_copTags = mempty, _copSourceOptionGroupIdentifier = pSourceOptionGroupIdentifier, _copTargetOptionGroupIdentifier = pTargetOptionGroupIdentifier, _copTargetOptionGroupDescription = pTargetOptionGroupDescription};

-- | FIXME: Undocumented member.
copTags :: Lens' CopyOptionGroup [Tag]
copTags = lens _copTags (\ s a -> s{_copTags = a});

-- | The identifier or ARN for the source option group.
--
-- Constraints:
--
-- -   Must specify a valid option group.
-- -   If the source option group is in the same region as the copy,
--     specify a valid option group identifier, for example
--     @my-option-group@, or a valid ARN.
-- -   If the source option group is in a different region than the copy,
--     specify a valid option group ARN, for example
--     @arn:aws:rds:us-west-2:123456789012:og:special-options@.
copSourceOptionGroupIdentifier :: Lens' CopyOptionGroup Text
copSourceOptionGroupIdentifier = lens _copSourceOptionGroupIdentifier (\ s a -> s{_copSourceOptionGroupIdentifier = a});

-- | The identifier for the copied option group.
--
-- Constraints:
--
-- -   Cannot be null, empty, or blank
-- -   Must contain from 1 to 255 alphanumeric characters or hyphens
-- -   First character must be a letter
-- -   Cannot end with a hyphen or contain two consecutive hyphens
--
-- Example: @my-option-group@
copTargetOptionGroupIdentifier :: Lens' CopyOptionGroup Text
copTargetOptionGroupIdentifier = lens _copTargetOptionGroupIdentifier (\ s a -> s{_copTargetOptionGroupIdentifier = a});

-- | The description for the copied option group.
copTargetOptionGroupDescription :: Lens' CopyOptionGroup Text
copTargetOptionGroupDescription = lens _copTargetOptionGroupDescription (\ s a -> s{_copTargetOptionGroupDescription = a});

instance AWSRequest CopyOptionGroup where
        type Sv CopyOptionGroup = RDS
        type Rs CopyOptionGroup = CopyOptionGroupResponse
        request = post
        response
          = receiveXMLWrapper "CopyOptionGroupResult"
              (\ s h x ->
                 CopyOptionGroupResponse' <$> x .@? "OptionGroup")

instance ToHeaders CopyOptionGroup where
        toHeaders = const mempty

instance ToPath CopyOptionGroup where
        toPath = const "/"

instance ToQuery CopyOptionGroup where
        toQuery CopyOptionGroup'{..}
          = mconcat
              ["Action" =: ("CopyOptionGroup" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "Tags" =: "Tag" =: _copTags,
               "SourceOptionGroupIdentifier" =:
                 _copSourceOptionGroupIdentifier,
               "TargetOptionGroupIdentifier" =:
                 _copTargetOptionGroupIdentifier,
               "TargetOptionGroupDescription" =:
                 _copTargetOptionGroupDescription]

-- | /See:/ 'copyOptionGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cogrOptionGroup'
newtype CopyOptionGroupResponse = CopyOptionGroupResponse'{_cogrOptionGroup :: Maybe OptionGroup} deriving (Eq, Read, Show)

-- | 'CopyOptionGroupResponse' smart constructor.
copyOptionGroupResponse :: CopyOptionGroupResponse
copyOptionGroupResponse = CopyOptionGroupResponse'{_cogrOptionGroup = Nothing};

-- | FIXME: Undocumented member.
cogrOptionGroup :: Lens' CopyOptionGroupResponse (Maybe OptionGroup)
cogrOptionGroup = lens _cogrOptionGroup (\ s a -> s{_cogrOptionGroup = a});
