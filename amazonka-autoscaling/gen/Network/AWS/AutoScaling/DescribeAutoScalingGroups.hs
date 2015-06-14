{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.AutoScaling.DescribeAutoScalingGroups
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

-- | Describes one or more Auto Scaling groups. If a list of names is not
-- provided, the call describes all Auto Scaling groups.
--
-- You can specify a maximum number of items to be returned with a single
-- call. If there are more items to return, the call returns a token. To
-- get the next set of items, repeat the call with the returned token in
-- the @NextToken@ parameter.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_DescribeAutoScalingGroups.html>
module Network.AWS.AutoScaling.DescribeAutoScalingGroups
    (
    -- * Request
      DescribeAutoScalingGroups
    -- ** Request constructor
    , describeAutoScalingGroups
    -- ** Request lenses
    , dasgAutoScalingGroupNames
    , dasgNextToken
    , dasgMaxRecords

    -- * Response
    , DescribeAutoScalingGroupsResponse
    -- ** Response constructor
    , describeAutoScalingGroupsResponse
    -- ** Response lenses
    , dasgrNextToken
    , dasgrAutoScalingGroups
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.AutoScaling.Types

-- | /See:/ 'describeAutoScalingGroups' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dasgAutoScalingGroupNames'
--
-- * 'dasgNextToken'
--
-- * 'dasgMaxRecords'
data DescribeAutoScalingGroups = DescribeAutoScalingGroups'{_dasgAutoScalingGroupNames :: [Text], _dasgNextToken :: Maybe Text, _dasgMaxRecords :: Maybe Int} deriving (Eq, Read, Show)

-- | 'DescribeAutoScalingGroups' smart constructor.
describeAutoScalingGroups :: DescribeAutoScalingGroups
describeAutoScalingGroups = DescribeAutoScalingGroups'{_dasgAutoScalingGroupNames = mempty, _dasgNextToken = Nothing, _dasgMaxRecords = Nothing};

-- | The group names.
dasgAutoScalingGroupNames :: Lens' DescribeAutoScalingGroups [Text]
dasgAutoScalingGroupNames = lens _dasgAutoScalingGroupNames (\ s a -> s{_dasgAutoScalingGroupNames = a});

-- | The token for the next set of items to return. (You received this token
-- from a previous call.)
dasgNextToken :: Lens' DescribeAutoScalingGroups (Maybe Text)
dasgNextToken = lens _dasgNextToken (\ s a -> s{_dasgNextToken = a});

-- | The maximum number of items to return with this call.
dasgMaxRecords :: Lens' DescribeAutoScalingGroups (Maybe Int)
dasgMaxRecords = lens _dasgMaxRecords (\ s a -> s{_dasgMaxRecords = a});

instance AWSRequest DescribeAutoScalingGroups where
        type Sv DescribeAutoScalingGroups = AutoScaling
        type Rs DescribeAutoScalingGroups =
             DescribeAutoScalingGroupsResponse
        request = post
        response
          = receiveXMLWrapper "DescribeAutoScalingGroupsResult"
              (\ s h x ->
                 DescribeAutoScalingGroupsResponse' <$>
                   x .@? "NextToken" <*>
                     (x .@? "AutoScalingGroups" .!@ mempty >>=
                        parseXMLList "member"))

instance ToHeaders DescribeAutoScalingGroups where
        toHeaders = const mempty

instance ToPath DescribeAutoScalingGroups where
        toPath = const "/"

instance ToQuery DescribeAutoScalingGroups where
        toQuery DescribeAutoScalingGroups'{..}
          = mconcat
              ["Action" =:
                 ("DescribeAutoScalingGroups" :: ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "AutoScalingGroupNames" =:
                 "member" =: _dasgAutoScalingGroupNames,
               "NextToken" =: _dasgNextToken,
               "MaxRecords" =: _dasgMaxRecords]

-- | /See:/ 'describeAutoScalingGroupsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dasgrNextToken'
--
-- * 'dasgrAutoScalingGroups'
data DescribeAutoScalingGroupsResponse = DescribeAutoScalingGroupsResponse'{_dasgrNextToken :: Maybe Text, _dasgrAutoScalingGroups :: [AutoScalingGroup]} deriving (Eq, Read, Show)

-- | 'DescribeAutoScalingGroupsResponse' smart constructor.
describeAutoScalingGroupsResponse :: [AutoScalingGroup] -> DescribeAutoScalingGroupsResponse
describeAutoScalingGroupsResponse pAutoScalingGroups = DescribeAutoScalingGroupsResponse'{_dasgrNextToken = Nothing, _dasgrAutoScalingGroups = pAutoScalingGroups};

-- | The token to use when requesting the next set of items. If there are no
-- additional items to return, the string is empty.
dasgrNextToken :: Lens' DescribeAutoScalingGroupsResponse (Maybe Text)
dasgrNextToken = lens _dasgrNextToken (\ s a -> s{_dasgrNextToken = a});

-- | The groups.
dasgrAutoScalingGroups :: Lens' DescribeAutoScalingGroupsResponse [AutoScalingGroup]
dasgrAutoScalingGroups = lens _dasgrAutoScalingGroups (\ s a -> s{_dasgrAutoScalingGroups = a});
