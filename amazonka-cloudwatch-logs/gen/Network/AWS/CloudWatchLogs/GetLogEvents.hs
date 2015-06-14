{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CloudWatchLogs.GetLogEvents
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

-- | Retrieves log events from the specified log stream. You can provide an
-- optional time range to filter the results on the event @timestamp@.
--
-- By default, this operation returns as much log events as can fit in a
-- response size of 1MB, up to 10,000 log events. The response will always
-- include a @nextForwardToken@ and a @nextBackwardToken@ in the response
-- body. You can use any of these tokens in subsequent @GetLogEvents@
-- requests to paginate through events in either forward or backward
-- direction. You can also limit the number of log events returned in the
-- response by specifying the @limit@ parameter in the request.
--
-- <http://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html>
module Network.AWS.CloudWatchLogs.GetLogEvents
    (
    -- * Request
      GetLogEvents
    -- ** Request constructor
    , getLogEvents
    -- ** Request lenses
    , gleStartTime
    , gleStartFromHead
    , gleEndTime
    , gleLogGroupName
    , gleLogStreamName
    , gleNextToken
    , gleLimit

    -- * Response
    , GetLogEventsResponse
    -- ** Response constructor
    , getLogEventsResponse
    -- ** Response lenses
    , glerEvents
    , glerNextBackwardToken
    , glerNextForwardToken
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.CloudWatchLogs.Types

-- | /See:/ 'getLogEvents' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gleStartTime'
--
-- * 'gleStartFromHead'
--
-- * 'gleEndTime'
--
-- * 'gleLogGroupName'
--
-- * 'gleLogStreamName'
--
-- * 'gleNextToken'
--
-- * 'gleLimit'
data GetLogEvents = GetLogEvents'{_gleStartTime :: Maybe Nat, _gleStartFromHead :: Maybe Bool, _gleEndTime :: Maybe Nat, _gleLogGroupName :: Text, _gleLogStreamName :: Text, _gleNextToken :: Text, _gleLimit :: Nat} deriving (Eq, Read, Show)

-- | 'GetLogEvents' smart constructor.
getLogEvents :: Text -> Text -> Text -> Natural -> GetLogEvents
getLogEvents pLogGroupName pLogStreamName pNextToken pLimit = GetLogEvents'{_gleStartTime = Nothing, _gleStartFromHead = Nothing, _gleEndTime = Nothing, _gleLogGroupName = pLogGroupName, _gleLogStreamName = pLogStreamName, _gleNextToken = pNextToken, _gleLimit = _Nat # pLimit};

-- | FIXME: Undocumented member.
gleStartTime :: Lens' GetLogEvents (Maybe Natural)
gleStartTime = lens _gleStartTime (\ s a -> s{_gleStartTime = a}) . mapping _Nat;

-- | If set to true, the earliest log events would be returned first. The
-- default is false (the latest log events are returned first).
gleStartFromHead :: Lens' GetLogEvents (Maybe Bool)
gleStartFromHead = lens _gleStartFromHead (\ s a -> s{_gleStartFromHead = a});

-- | FIXME: Undocumented member.
gleEndTime :: Lens' GetLogEvents (Maybe Natural)
gleEndTime = lens _gleEndTime (\ s a -> s{_gleEndTime = a}) . mapping _Nat;

-- | The name of the log group to query.
gleLogGroupName :: Lens' GetLogEvents Text
gleLogGroupName = lens _gleLogGroupName (\ s a -> s{_gleLogGroupName = a});

-- | The name of the log stream to query.
gleLogStreamName :: Lens' GetLogEvents Text
gleLogStreamName = lens _gleLogStreamName (\ s a -> s{_gleLogStreamName = a});

-- | A string token used for pagination that points to the next page of
-- results. It must be a value obtained from the @nextForwardToken@ or
-- @nextBackwardToken@ fields in the response of the previous
-- @GetLogEvents@ request.
gleNextToken :: Lens' GetLogEvents Text
gleNextToken = lens _gleNextToken (\ s a -> s{_gleNextToken = a});

-- | The maximum number of log events returned in the response. If you don\'t
-- specify a value, the request would return as many log events as can fit
-- in a response size of 1MB, up to 10,000 log events.
gleLimit :: Lens' GetLogEvents Natural
gleLimit = lens _gleLimit (\ s a -> s{_gleLimit = a}) . _Nat;

instance AWSRequest GetLogEvents where
        type Sv GetLogEvents = CloudWatchLogs
        type Rs GetLogEvents = GetLogEventsResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 GetLogEventsResponse' <$>
                   x .?> "events" .!@ mempty <*>
                     x .:> "nextBackwardToken"
                     <*> x .:> "nextForwardToken")

instance ToHeaders GetLogEvents where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("Logs_20140328.GetLogEvents" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON GetLogEvents where
        toJSON GetLogEvents'{..}
          = object
              ["startTime" .= _gleStartTime,
               "startFromHead" .= _gleStartFromHead,
               "endTime" .= _gleEndTime,
               "logGroupName" .= _gleLogGroupName,
               "logStreamName" .= _gleLogStreamName,
               "nextToken" .= _gleNextToken, "limit" .= _gleLimit]

instance ToPath GetLogEvents where
        toPath = const "/"

instance ToQuery GetLogEvents where
        toQuery = const mempty

-- | /See:/ 'getLogEventsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'glerEvents'
--
-- * 'glerNextBackwardToken'
--
-- * 'glerNextForwardToken'
data GetLogEventsResponse = GetLogEventsResponse'{_glerEvents :: [OutputLogEvent], _glerNextBackwardToken :: Text, _glerNextForwardToken :: Text} deriving (Eq, Read, Show)

-- | 'GetLogEventsResponse' smart constructor.
getLogEventsResponse :: Text -> Text -> GetLogEventsResponse
getLogEventsResponse pNextBackwardToken pNextForwardToken = GetLogEventsResponse'{_glerEvents = mempty, _glerNextBackwardToken = pNextBackwardToken, _glerNextForwardToken = pNextForwardToken};

-- | FIXME: Undocumented member.
glerEvents :: Lens' GetLogEventsResponse [OutputLogEvent]
glerEvents = lens _glerEvents (\ s a -> s{_glerEvents = a});

-- | FIXME: Undocumented member.
glerNextBackwardToken :: Lens' GetLogEventsResponse Text
glerNextBackwardToken = lens _glerNextBackwardToken (\ s a -> s{_glerNextBackwardToken = a});

-- | FIXME: Undocumented member.
glerNextForwardToken :: Lens' GetLogEventsResponse Text
glerNextForwardToken = lens _glerNextForwardToken (\ s a -> s{_glerNextForwardToken = a});
