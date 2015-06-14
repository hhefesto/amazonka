{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DataPipeline.ListPipelines
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

-- | Lists the pipeline identifiers for all active pipelines that you have
-- permission to access.
--
-- <http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_ListPipelines.html>
module Network.AWS.DataPipeline.ListPipelines
    (
    -- * Request
      ListPipelines
    -- ** Request constructor
    , listPipelines
    -- ** Request lenses
    , lpMarker

    -- * Response
    , ListPipelinesResponse
    -- ** Response constructor
    , listPipelinesResponse
    -- ** Response lenses
    , lprHasMoreResults
    , lprMarker
    , lprPipelineIdList
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DataPipeline.Types

-- | /See:/ 'listPipelines' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lpMarker'
newtype ListPipelines = ListPipelines'{_lpMarker :: Maybe Text} deriving (Eq, Read, Show)

-- | 'ListPipelines' smart constructor.
listPipelines :: ListPipelines
listPipelines = ListPipelines'{_lpMarker = Nothing};

-- | The starting point for the results to be returned. For the first call,
-- this value should be empty. As long as there are more results, continue
-- to call @ListPipelines@ with the marker value from the previous call to
-- retrieve the next set of results.
lpMarker :: Lens' ListPipelines (Maybe Text)
lpMarker = lens _lpMarker (\ s a -> s{_lpMarker = a});

instance AWSRequest ListPipelines where
        type Sv ListPipelines = DataPipeline
        type Rs ListPipelines = ListPipelinesResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListPipelinesResponse' <$>
                   x .?> "hasMoreResults" <*> x .?> "marker" <*>
                     x .?> "pipelineIdList" .!@ mempty)

instance ToHeaders ListPipelines where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DataPipeline.ListPipelines" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ListPipelines where
        toJSON ListPipelines'{..}
          = object ["marker" .= _lpMarker]

instance ToPath ListPipelines where
        toPath = const "/"

instance ToQuery ListPipelines where
        toQuery = const mempty

-- | /See:/ 'listPipelinesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'lprHasMoreResults'
--
-- * 'lprMarker'
--
-- * 'lprPipelineIdList'
data ListPipelinesResponse = ListPipelinesResponse'{_lprHasMoreResults :: Maybe Bool, _lprMarker :: Maybe Text, _lprPipelineIdList :: [PipelineIdName]} deriving (Eq, Read, Show)

-- | 'ListPipelinesResponse' smart constructor.
listPipelinesResponse :: [PipelineIdName] -> ListPipelinesResponse
listPipelinesResponse pPipelineIdList = ListPipelinesResponse'{_lprHasMoreResults = Nothing, _lprMarker = Nothing, _lprPipelineIdList = pPipelineIdList};

-- | Indicates whether there are more results that can be obtained by a
-- subsequent call.
lprHasMoreResults :: Lens' ListPipelinesResponse (Maybe Bool)
lprHasMoreResults = lens _lprHasMoreResults (\ s a -> s{_lprHasMoreResults = a});

-- | The starting point for the next page of results. To view the next page
-- of results, call @ListPipelinesOutput@ again with this marker value. If
-- the value is null, there are no more results.
lprMarker :: Lens' ListPipelinesResponse (Maybe Text)
lprMarker = lens _lprMarker (\ s a -> s{_lprMarker = a});

-- | The pipeline identifiers. If you require additional information about
-- the pipelines, you can use these identifiers to call DescribePipelines
-- and GetPipelineDefinition.
lprPipelineIdList :: Lens' ListPipelinesResponse [PipelineIdName]
lprPipelineIdList = lens _lprPipelineIdList (\ s a -> s{_lprPipelineIdList = a});
