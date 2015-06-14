{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.ReportInstanceStatus
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

-- | Submits feedback about the status of an instance. The instance must be
-- in the @running@ state. If your experience with the instance differs
-- from the instance status returned by DescribeInstanceStatus, use
-- ReportInstanceStatus to report your experience with the instance. Amazon
-- EC2 collects this information to improve the accuracy of status checks.
--
-- Use of this action does not change the value returned by
-- DescribeInstanceStatus.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-ReportInstanceStatus.html>
module Network.AWS.EC2.ReportInstanceStatus
    (
    -- * Request
      ReportInstanceStatus
    -- ** Request constructor
    , reportInstanceStatus
    -- ** Request lenses
    , risStartTime
    , risAddressStatus
    , risEndTime
    , risDryRun
    , risDescription
    , risInstances
    , risReasonCodes

    -- * Response
    , ReportInstanceStatusResponse
    -- ** Response constructor
    , reportInstanceStatusResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.EC2.Types

-- | /See:/ 'reportInstanceStatus' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'risStartTime'
--
-- * 'risAddressStatus'
--
-- * 'risEndTime'
--
-- * 'risDryRun'
--
-- * 'risDescription'
--
-- * 'risInstances'
--
-- * 'risReasonCodes'
data ReportInstanceStatus = ReportInstanceStatus'{_risStartTime :: Maybe ISO8601, _risAddressStatus :: Maybe ReportStatusType, _risEndTime :: Maybe ISO8601, _risDryRun :: Maybe Bool, _risDescription :: Maybe Text, _risInstances :: [Text], _risReasonCodes :: [ReportInstanceReasonCodes]} deriving (Eq, Read, Show)

-- | 'ReportInstanceStatus' smart constructor.
reportInstanceStatus :: [Text] -> [ReportInstanceReasonCodes] -> ReportInstanceStatus
reportInstanceStatus pInstances pReasonCodes = ReportInstanceStatus'{_risStartTime = Nothing, _risAddressStatus = Nothing, _risEndTime = Nothing, _risDryRun = Nothing, _risDescription = Nothing, _risInstances = pInstances, _risReasonCodes = pReasonCodes};

-- | The time at which the reported instance health state began.
risStartTime :: Lens' ReportInstanceStatus (Maybe UTCTime)
risStartTime = lens _risStartTime (\ s a -> s{_risStartTime = a}) . mapping _Time;

-- | The status of all instances listed.
risAddressStatus :: Lens' ReportInstanceStatus (Maybe ReportStatusType)
risAddressStatus = lens _risAddressStatus (\ s a -> s{_risAddressStatus = a});

-- | The time at which the reported instance health state ended.
risEndTime :: Lens' ReportInstanceStatus (Maybe UTCTime)
risEndTime = lens _risEndTime (\ s a -> s{_risEndTime = a}) . mapping _Time;

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
risDryRun :: Lens' ReportInstanceStatus (Maybe Bool)
risDryRun = lens _risDryRun (\ s a -> s{_risDryRun = a});

-- | Descriptive text about the health state of your instance.
risDescription :: Lens' ReportInstanceStatus (Maybe Text)
risDescription = lens _risDescription (\ s a -> s{_risDescription = a});

-- | One or more instances.
risInstances :: Lens' ReportInstanceStatus [Text]
risInstances = lens _risInstances (\ s a -> s{_risInstances = a});

-- | One or more reason codes that describes the health state of your
-- instance.
--
-- -   @instance-stuck-in-state@: My instance is stuck in a state.
--
-- -   @unresponsive@: My instance is unresponsive.
--
-- -   @not-accepting-credentials@: My instance is not accepting my
--     credentials.
--
-- -   @password-not-available@: A password is not available for my
--     instance.
--
-- -   @performance-network@: My instance is experiencing performance
--     problems which I believe are network related.
--
-- -   @performance-instance-store@: My instance is experiencing
--     performance problems which I believe are related to the instance
--     stores.
--
-- -   @performance-ebs-volume@: My instance is experiencing performance
--     problems which I believe are related to an EBS volume.
--
-- -   @performance-other@: My instance is experiencing performance
--     problems.
--
-- -   @other@: [explain using the description parameter]
--
risReasonCodes :: Lens' ReportInstanceStatus [ReportInstanceReasonCodes]
risReasonCodes = lens _risReasonCodes (\ s a -> s{_risReasonCodes = a});

instance AWSRequest ReportInstanceStatus where
        type Sv ReportInstanceStatus = EC2
        type Rs ReportInstanceStatus =
             ReportInstanceStatusResponse
        request = post
        response = receiveNull ReportInstanceStatusResponse'

instance ToHeaders ReportInstanceStatus where
        toHeaders = const mempty

instance ToPath ReportInstanceStatus where
        toPath = const "/"

instance ToQuery ReportInstanceStatus where
        toQuery ReportInstanceStatus'{..}
          = mconcat
              ["Action" =: ("ReportInstanceStatus" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "StartTime" =: _risStartTime,
               "Status" =: _risAddressStatus,
               "EndTime" =: _risEndTime, "DryRun" =: _risDryRun,
               "Description" =: _risDescription,
               "InstanceId" =: _risInstances,
               "item" =: _risReasonCodes]

-- | /See:/ 'reportInstanceStatusResponse' smart constructor.
data ReportInstanceStatusResponse = ReportInstanceStatusResponse' deriving (Eq, Read, Show)

-- | 'ReportInstanceStatusResponse' smart constructor.
reportInstanceStatusResponse :: ReportInstanceStatusResponse
reportInstanceStatusResponse = ReportInstanceStatusResponse';
