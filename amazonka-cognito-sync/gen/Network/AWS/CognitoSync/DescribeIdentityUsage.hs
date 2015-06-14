{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CognitoSync.DescribeIdentityUsage
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

-- | Gets usage information for an identity, including number of datasets and
-- data usage.
--
-- DescribeIdentityUsage can be called with temporary user credentials
-- provided by Cognito Identity or with developer credentials.
--
-- <http://docs.aws.amazon.com/cognitosync/latest/APIReference/API_DescribeIdentityUsage.html>
module Network.AWS.CognitoSync.DescribeIdentityUsage
    (
    -- * Request
      DescribeIdentityUsage
    -- ** Request constructor
    , describeIdentityUsage
    -- ** Request lenses
    , diuIdentityPoolId
    , diuIdentityId

    -- * Response
    , DescribeIdentityUsageResponse
    -- ** Response constructor
    , describeIdentityUsageResponse
    -- ** Response lenses
    , diurIdentityUsage
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.CognitoSync.Types

-- | /See:/ 'describeIdentityUsage' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'diuIdentityPoolId'
--
-- * 'diuIdentityId'
data DescribeIdentityUsage = DescribeIdentityUsage'{_diuIdentityPoolId :: Text, _diuIdentityId :: Text} deriving (Eq, Read, Show)

-- | 'DescribeIdentityUsage' smart constructor.
describeIdentityUsage :: Text -> Text -> DescribeIdentityUsage
describeIdentityUsage pIdentityPoolId pIdentityId = DescribeIdentityUsage'{_diuIdentityPoolId = pIdentityPoolId, _diuIdentityId = pIdentityId};

-- | A name-spaced GUID (for example,
-- us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
-- Cognito. GUID generation is unique within a region.
diuIdentityPoolId :: Lens' DescribeIdentityUsage Text
diuIdentityPoolId = lens _diuIdentityPoolId (\ s a -> s{_diuIdentityPoolId = a});

-- | A name-spaced GUID (for example,
-- us-east-1:23EC4050-6AEA-7089-A2DD-08002EXAMPLE) created by Amazon
-- Cognito. GUID generation is unique within a region.
diuIdentityId :: Lens' DescribeIdentityUsage Text
diuIdentityId = lens _diuIdentityId (\ s a -> s{_diuIdentityId = a});

instance AWSRequest DescribeIdentityUsage where
        type Sv DescribeIdentityUsage = CognitoSync
        type Rs DescribeIdentityUsage =
             DescribeIdentityUsageResponse
        request = get
        response
          = receiveJSON
              (\ s h x ->
                 DescribeIdentityUsageResponse' <$>
                   x .?> "IdentityUsage")

instance ToHeaders DescribeIdentityUsage where
        toHeaders
          = const
              (mconcat
                 ["Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToPath DescribeIdentityUsage where
        toPath DescribeIdentityUsage'{..}
          = mconcat
              ["/identitypools/", toText _diuIdentityPoolId,
               "/identities/", toText _diuIdentityId]

instance ToQuery DescribeIdentityUsage where
        toQuery = const mempty

-- | /See:/ 'describeIdentityUsageResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'diurIdentityUsage'
newtype DescribeIdentityUsageResponse = DescribeIdentityUsageResponse'{_diurIdentityUsage :: Maybe IdentityUsage} deriving (Eq, Read, Show)

-- | 'DescribeIdentityUsageResponse' smart constructor.
describeIdentityUsageResponse :: DescribeIdentityUsageResponse
describeIdentityUsageResponse = DescribeIdentityUsageResponse'{_diurIdentityUsage = Nothing};

-- | Usage information for the identity.
diurIdentityUsage :: Lens' DescribeIdentityUsageResponse (Maybe IdentityUsage)
diurIdentityUsage = lens _diurIdentityUsage (\ s a -> s{_diurIdentityUsage = a});
