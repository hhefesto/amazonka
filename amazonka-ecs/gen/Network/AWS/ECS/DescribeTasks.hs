{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.ECS.DescribeTasks
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

-- | Describes a specified task or tasks.
--
-- <http://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_DescribeTasks.html>
module Network.AWS.ECS.DescribeTasks
    (
    -- * Request
      DescribeTasks
    -- ** Request constructor
    , describeTasks
    -- ** Request lenses
    , dtCluster
    , dtTasks

    -- * Response
    , DescribeTasksResponse
    -- ** Response constructor
    , describeTasksResponse
    -- ** Response lenses
    , dtrFailures
    , dtrTasks
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.ECS.Types

-- | /See:/ 'describeTasks' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dtCluster'
--
-- * 'dtTasks'
data DescribeTasks = DescribeTasks'{_dtCluster :: Maybe Text, _dtTasks :: [Text]} deriving (Eq, Read, Show)

-- | 'DescribeTasks' smart constructor.
describeTasks :: [Text] -> DescribeTasks
describeTasks pTasks = DescribeTasks'{_dtCluster = Nothing, _dtTasks = pTasks};

-- | The short name or full Amazon Resource Name (ARN) of the cluster that
-- hosts the task you want to describe. If you do not specify a cluster,
-- the default cluster is assumed.
dtCluster :: Lens' DescribeTasks (Maybe Text)
dtCluster = lens _dtCluster (\ s a -> s{_dtCluster = a});

-- | A space-separated list of task UUIDs or full Amazon Resource Name (ARN)
-- entries.
dtTasks :: Lens' DescribeTasks [Text]
dtTasks = lens _dtTasks (\ s a -> s{_dtTasks = a});

instance AWSRequest DescribeTasks where
        type Sv DescribeTasks = ECS
        type Rs DescribeTasks = DescribeTasksResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeTasksResponse' <$>
                   x .?> "failures" .!@ mempty <*>
                     x .?> "tasks" .!@ mempty)

instance ToHeaders DescribeTasks where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonEC2ContainerServiceV20141113.DescribeTasks"
                       :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeTasks where
        toJSON DescribeTasks'{..}
          = object
              ["cluster" .= _dtCluster, "tasks" .= _dtTasks]

instance ToPath DescribeTasks where
        toPath = const "/"

instance ToQuery DescribeTasks where
        toQuery = const mempty

-- | /See:/ 'describeTasksResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dtrFailures'
--
-- * 'dtrTasks'
data DescribeTasksResponse = DescribeTasksResponse'{_dtrFailures :: [Failure], _dtrTasks :: [Task]} deriving (Eq, Read, Show)

-- | 'DescribeTasksResponse' smart constructor.
describeTasksResponse :: DescribeTasksResponse
describeTasksResponse = DescribeTasksResponse'{_dtrFailures = mempty, _dtrTasks = mempty};

-- | FIXME: Undocumented member.
dtrFailures :: Lens' DescribeTasksResponse [Failure]
dtrFailures = lens _dtrFailures (\ s a -> s{_dtrFailures = a});

-- | The list of tasks.
dtrTasks :: Lens' DescribeTasksResponse [Task]
dtrTasks = lens _dtrTasks (\ s a -> s{_dtrTasks = a});
