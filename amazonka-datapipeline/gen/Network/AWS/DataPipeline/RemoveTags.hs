{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DataPipeline.RemoveTags
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

-- | Removes existing tags from the specified pipeline.
--
-- <http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_RemoveTags.html>
module Network.AWS.DataPipeline.RemoveTags
    (
    -- * Request
      RemoveTags
    -- ** Request constructor
    , removeTags
    -- ** Request lenses
    , rtPipelineId
    , rtTagKeys

    -- * Response
    , RemoveTagsResponse
    -- ** Response constructor
    , removeTagsResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DataPipeline.Types

-- | /See:/ 'removeTags' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtPipelineId'
--
-- * 'rtTagKeys'
data RemoveTags = RemoveTags'{_rtPipelineId :: Text, _rtTagKeys :: [Text]} deriving (Eq, Read, Show)

-- | 'RemoveTags' smart constructor.
removeTags :: Text -> [Text] -> RemoveTags
removeTags pPipelineId pTagKeys = RemoveTags'{_rtPipelineId = pPipelineId, _rtTagKeys = pTagKeys};

-- | The ID of the pipeline.
rtPipelineId :: Lens' RemoveTags Text
rtPipelineId = lens _rtPipelineId (\ s a -> s{_rtPipelineId = a});

-- | The keys of the tags to remove.
rtTagKeys :: Lens' RemoveTags [Text]
rtTagKeys = lens _rtTagKeys (\ s a -> s{_rtTagKeys = a});

instance AWSRequest RemoveTags where
        type Sv RemoveTags = DataPipeline
        type Rs RemoveTags = RemoveTagsResponse
        request = postJSON
        response = receiveNull RemoveTagsResponse'

instance ToHeaders RemoveTags where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DataPipeline.RemoveTags" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON RemoveTags where
        toJSON RemoveTags'{..}
          = object
              ["pipelineId" .= _rtPipelineId,
               "tagKeys" .= _rtTagKeys]

instance ToPath RemoveTags where
        toPath = const "/"

instance ToQuery RemoveTags where
        toQuery = const mempty

-- | /See:/ 'removeTagsResponse' smart constructor.
data RemoveTagsResponse = RemoveTagsResponse' deriving (Eq, Read, Show)

-- | 'RemoveTagsResponse' smart constructor.
removeTagsResponse :: RemoveTagsResponse
removeTagsResponse = RemoveTagsResponse';
