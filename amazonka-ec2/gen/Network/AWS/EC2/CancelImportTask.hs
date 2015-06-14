{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.CancelImportTask
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

-- | Cancels an in-process import virtual machine or import snapshot task.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-CancelImportTask.html>
module Network.AWS.EC2.CancelImportTask
    (
    -- * Request
      CancelImportTask
    -- ** Request constructor
    , cancelImportTask
    -- ** Request lenses
    , citCancelReason
    , citImportTaskId
    , citDryRun

    -- * Response
    , CancelImportTaskResponse
    -- ** Response constructor
    , cancelImportTaskResponse
    -- ** Response lenses
    , citrState
    , citrImportTaskId
    , citrPreviousState
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.EC2.Types

-- | /See:/ 'cancelImportTask' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'citCancelReason'
--
-- * 'citImportTaskId'
--
-- * 'citDryRun'
data CancelImportTask = CancelImportTask'{_citCancelReason :: Maybe Text, _citImportTaskId :: Maybe Text, _citDryRun :: Maybe Bool} deriving (Eq, Read, Show)

-- | 'CancelImportTask' smart constructor.
cancelImportTask :: CancelImportTask
cancelImportTask = CancelImportTask'{_citCancelReason = Nothing, _citImportTaskId = Nothing, _citDryRun = Nothing};

-- | The reason for canceling the task.
citCancelReason :: Lens' CancelImportTask (Maybe Text)
citCancelReason = lens _citCancelReason (\ s a -> s{_citCancelReason = a});

-- | The ID of the import image or import snapshot task to be canceled.
citImportTaskId :: Lens' CancelImportTask (Maybe Text)
citImportTaskId = lens _citImportTaskId (\ s a -> s{_citImportTaskId = a});

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
citDryRun :: Lens' CancelImportTask (Maybe Bool)
citDryRun = lens _citDryRun (\ s a -> s{_citDryRun = a});

instance AWSRequest CancelImportTask where
        type Sv CancelImportTask = EC2
        type Rs CancelImportTask = CancelImportTaskResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 CancelImportTaskResponse' <$>
                   x .@? "state" <*> x .@? "importTaskId" <*>
                     x .@? "previousState")

instance ToHeaders CancelImportTask where
        toHeaders = const mempty

instance ToPath CancelImportTask where
        toPath = const "/"

instance ToQuery CancelImportTask where
        toQuery CancelImportTask'{..}
          = mconcat
              ["Action" =: ("CancelImportTask" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "CancelReason" =: _citCancelReason,
               "ImportTaskId" =: _citImportTaskId,
               "DryRun" =: _citDryRun]

-- | /See:/ 'cancelImportTaskResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'citrState'
--
-- * 'citrImportTaskId'
--
-- * 'citrPreviousState'
data CancelImportTaskResponse = CancelImportTaskResponse'{_citrState :: Maybe Text, _citrImportTaskId :: Maybe Text, _citrPreviousState :: Maybe Text} deriving (Eq, Read, Show)

-- | 'CancelImportTaskResponse' smart constructor.
cancelImportTaskResponse :: CancelImportTaskResponse
cancelImportTaskResponse = CancelImportTaskResponse'{_citrState = Nothing, _citrImportTaskId = Nothing, _citrPreviousState = Nothing};

-- | The current state of the task being canceled.
citrState :: Lens' CancelImportTaskResponse (Maybe Text)
citrState = lens _citrState (\ s a -> s{_citrState = a});

-- | The ID of the task being canceled.
citrImportTaskId :: Lens' CancelImportTaskResponse (Maybe Text)
citrImportTaskId = lens _citrImportTaskId (\ s a -> s{_citrImportTaskId = a});

-- | The current state of the task being canceled.
citrPreviousState :: Lens' CancelImportTaskResponse (Maybe Text)
citrPreviousState = lens _citrPreviousState (\ s a -> s{_citrPreviousState = a});
