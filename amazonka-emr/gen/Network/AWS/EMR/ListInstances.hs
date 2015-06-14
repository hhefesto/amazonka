{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EMR.ListInstances
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

-- | Provides information about the cluster instances that Amazon EMR
-- provisions on behalf of a user when it creates the cluster. For example,
-- this operation indicates when the EC2 instances reach the Ready state,
-- when instances become available to Amazon EMR to use for jobs, and the
-- IP addresses for cluster instances, etc.
--
-- <http://docs.aws.amazon.com/ElasticMapReduce/latest/API/API_ListInstances.html>
module Network.AWS.EMR.ListInstances
    (
    -- * Request
      ListInstances
    -- ** Request constructor
    , listInstances
    -- ** Request lenses
    , liInstanceGroupTypes
    , liMarker
    , liInstanceGroupId
    , liClusterId

    -- * Response
    , ListInstancesResponse
    -- ** Response constructor
    , listInstancesResponse
    -- ** Response lenses
    , lirInstances
    , lirMarker
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.EMR.Types

-- | /See:/ 'listInstances' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'liInstanceGroupTypes'
--
-- * 'liMarker'
--
-- * 'liInstanceGroupId'
--
-- * 'liClusterId'
data ListInstances = ListInstances'{_liInstanceGroupTypes :: [InstanceGroupType], _liMarker :: Maybe Text, _liInstanceGroupId :: Maybe Text, _liClusterId :: Text} deriving (Eq, Read, Show)

-- | 'ListInstances' smart constructor.
listInstances :: Text -> ListInstances
listInstances pClusterId = ListInstances'{_liInstanceGroupTypes = mempty, _liMarker = Nothing, _liInstanceGroupId = Nothing, _liClusterId = pClusterId};

-- | The type of instance group for which to list the instances.
liInstanceGroupTypes :: Lens' ListInstances [InstanceGroupType]
liInstanceGroupTypes = lens _liInstanceGroupTypes (\ s a -> s{_liInstanceGroupTypes = a});

-- | The pagination token that indicates the next set of results to retrieve.
liMarker :: Lens' ListInstances (Maybe Text)
liMarker = lens _liMarker (\ s a -> s{_liMarker = a});

-- | The identifier of the instance group for which to list the instances.
liInstanceGroupId :: Lens' ListInstances (Maybe Text)
liInstanceGroupId = lens _liInstanceGroupId (\ s a -> s{_liInstanceGroupId = a});

-- | The identifier of the cluster for which to list the instances.
liClusterId :: Lens' ListInstances Text
liClusterId = lens _liClusterId (\ s a -> s{_liClusterId = a});

instance AWSRequest ListInstances where
        type Sv ListInstances = EMR
        type Rs ListInstances = ListInstancesResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListInstancesResponse' <$>
                   x .?> "Instances" .!@ mempty <*> x .?> "Marker")

instance ToHeaders ListInstances where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("ElasticMapReduce.ListInstances" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListInstances where
        toJSON ListInstances'{..}
          = object
              ["InstanceGroupTypes" .= _liInstanceGroupTypes,
               "Marker" .= _liMarker,
               "InstanceGroupId" .= _liInstanceGroupId,
               "ClusterId" .= _liClusterId]

instance ToPath ListInstances where
        toPath = const "/"

instance ToQuery ListInstances where
        toQuery = const mempty

-- | /See:/ 'listInstancesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lirInstances'
--
-- * 'lirMarker'
data ListInstancesResponse = ListInstancesResponse'{_lirInstances :: [Instance], _lirMarker :: Maybe Text} deriving (Eq, Read, Show)

-- | 'ListInstancesResponse' smart constructor.
listInstancesResponse :: ListInstancesResponse
listInstancesResponse = ListInstancesResponse'{_lirInstances = mempty, _lirMarker = Nothing};

-- | The list of instances for the cluster and given filters.
lirInstances :: Lens' ListInstancesResponse [Instance]
lirInstances = lens _lirInstances (\ s a -> s{_lirInstances = a});

-- | The pagination token that indicates the next set of results to retrieve.
lirMarker :: Lens' ListInstancesResponse (Maybe Text)
lirMarker = lens _lirMarker (\ s a -> s{_lirMarker = a});
