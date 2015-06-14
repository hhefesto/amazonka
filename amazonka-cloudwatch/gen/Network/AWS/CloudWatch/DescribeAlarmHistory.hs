{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CloudWatch.DescribeAlarmHistory
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

-- | Retrieves history for the specified alarm. Filter alarms by date range
-- or item type. If an alarm name is not specified, Amazon CloudWatch
-- returns histories for all of the owner\'s alarms.
--
-- <http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_DescribeAlarmHistory.html>
module Network.AWS.CloudWatch.DescribeAlarmHistory
    (
    -- * Request
      DescribeAlarmHistory
    -- ** Request constructor
    , describeAlarmHistory
    -- ** Request lenses
    , dahHistoryItemType
    , dahEndDate
    , dahStartDate
    , dahNextToken
    , dahAlarmName
    , dahMaxRecords

    -- * Response
    , DescribeAlarmHistoryResponse
    -- ** Response constructor
    , describeAlarmHistoryResponse
    -- ** Response lenses
    , dahrAlarmHistoryItems
    , dahrNextToken
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.CloudWatch.Types

-- | /See:/ 'describeAlarmHistory' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dahHistoryItemType'
--
-- * 'dahEndDate'
--
-- * 'dahStartDate'
--
-- * 'dahNextToken'
--
-- * 'dahAlarmName'
--
-- * 'dahMaxRecords'
data DescribeAlarmHistory = DescribeAlarmHistory'{_dahHistoryItemType :: Maybe HistoryItemType, _dahEndDate :: Maybe ISO8601, _dahStartDate :: Maybe ISO8601, _dahNextToken :: Maybe Text, _dahAlarmName :: Text, _dahMaxRecords :: Nat} deriving (Eq, Read, Show)

-- | 'DescribeAlarmHistory' smart constructor.
describeAlarmHistory :: Text -> Natural -> DescribeAlarmHistory
describeAlarmHistory pAlarmName pMaxRecords = DescribeAlarmHistory'{_dahHistoryItemType = Nothing, _dahEndDate = Nothing, _dahStartDate = Nothing, _dahNextToken = Nothing, _dahAlarmName = pAlarmName, _dahMaxRecords = _Nat # pMaxRecords};

-- | The type of alarm histories to retrieve.
dahHistoryItemType :: Lens' DescribeAlarmHistory (Maybe HistoryItemType)
dahHistoryItemType = lens _dahHistoryItemType (\ s a -> s{_dahHistoryItemType = a});

-- | The ending date to retrieve alarm history.
dahEndDate :: Lens' DescribeAlarmHistory (Maybe UTCTime)
dahEndDate = lens _dahEndDate (\ s a -> s{_dahEndDate = a}) . mapping _Time;

-- | The starting date to retrieve alarm history.
dahStartDate :: Lens' DescribeAlarmHistory (Maybe UTCTime)
dahStartDate = lens _dahStartDate (\ s a -> s{_dahStartDate = a}) . mapping _Time;

-- | The token returned by a previous call to indicate that there is more
-- data available.
dahNextToken :: Lens' DescribeAlarmHistory (Maybe Text)
dahNextToken = lens _dahNextToken (\ s a -> s{_dahNextToken = a});

-- | The name of the alarm.
dahAlarmName :: Lens' DescribeAlarmHistory Text
dahAlarmName = lens _dahAlarmName (\ s a -> s{_dahAlarmName = a});

-- | The maximum number of alarm history records to retrieve.
dahMaxRecords :: Lens' DescribeAlarmHistory Natural
dahMaxRecords = lens _dahMaxRecords (\ s a -> s{_dahMaxRecords = a}) . _Nat;

instance AWSRequest DescribeAlarmHistory where
        type Sv DescribeAlarmHistory = CloudWatch
        type Rs DescribeAlarmHistory =
             DescribeAlarmHistoryResponse
        request = post
        response
          = receiveXMLWrapper "DescribeAlarmHistoryResult"
              (\ s h x ->
                 DescribeAlarmHistoryResponse' <$>
                   (x .@? "AlarmHistoryItems" .!@ mempty >>=
                      parseXMLList "member")
                     <*> x .@? "NextToken")

instance ToHeaders DescribeAlarmHistory where
        toHeaders = const mempty

instance ToPath DescribeAlarmHistory where
        toPath = const "/"

instance ToQuery DescribeAlarmHistory where
        toQuery DescribeAlarmHistory'{..}
          = mconcat
              ["Action" =: ("DescribeAlarmHistory" :: ByteString),
               "Version" =: ("2010-08-01" :: ByteString),
               "HistoryItemType" =: _dahHistoryItemType,
               "EndDate" =: _dahEndDate,
               "StartDate" =: _dahStartDate,
               "NextToken" =: _dahNextToken,
               "AlarmName" =: _dahAlarmName,
               "MaxRecords" =: _dahMaxRecords]

-- | /See:/ 'describeAlarmHistoryResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dahrAlarmHistoryItems'
--
-- * 'dahrNextToken'
data DescribeAlarmHistoryResponse = DescribeAlarmHistoryResponse'{_dahrAlarmHistoryItems :: [AlarmHistoryItem], _dahrNextToken :: Maybe Text} deriving (Eq, Read, Show)

-- | 'DescribeAlarmHistoryResponse' smart constructor.
describeAlarmHistoryResponse :: DescribeAlarmHistoryResponse
describeAlarmHistoryResponse = DescribeAlarmHistoryResponse'{_dahrAlarmHistoryItems = mempty, _dahrNextToken = Nothing};

-- | A list of alarm histories in JSON format.
dahrAlarmHistoryItems :: Lens' DescribeAlarmHistoryResponse [AlarmHistoryItem]
dahrAlarmHistoryItems = lens _dahrAlarmHistoryItems (\ s a -> s{_dahrAlarmHistoryItems = a});

-- | A string that marks the start of the next batch of returned results.
dahrNextToken :: Lens' DescribeAlarmHistoryResponse (Maybe Text)
dahrNextToken = lens _dahrNextToken (\ s a -> s{_dahrNextToken = a});
