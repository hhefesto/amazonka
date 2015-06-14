{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DataPipeline.SetTaskStatus
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

-- | Task runners call @SetTaskStatus@ to notify AWS Data Pipeline that a
-- task is completed and provide information about the final status. A task
-- runner makes this call regardless of whether the task was sucessful. A
-- task runner does not need to call @SetTaskStatus@ for tasks that are
-- canceled by the web service during a call to ReportTaskProgress.
--
-- <http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_SetTaskStatus.html>
module Network.AWS.DataPipeline.SetTaskStatus
    (
    -- * Request
      SetTaskStatus
    -- ** Request constructor
    , setTaskStatus
    -- ** Request lenses
    , stsErrorStackTrace
    , stsErrorId
    , stsErrorMessage
    , stsTaskId
    , stsTaskStatus

    -- * Response
    , SetTaskStatusResponse
    -- ** Response constructor
    , setTaskStatusResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DataPipeline.Types

-- | /See:/ 'setTaskStatus' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'stsErrorStackTrace'
--
-- * 'stsErrorId'
--
-- * 'stsErrorMessage'
--
-- * 'stsTaskId'
--
-- * 'stsTaskStatus'
data SetTaskStatus = SetTaskStatus'{_stsErrorStackTrace :: Maybe Text, _stsErrorId :: Maybe Text, _stsErrorMessage :: Maybe Text, _stsTaskId :: Text, _stsTaskStatus :: TaskStatus} deriving (Eq, Read, Show)

-- | 'SetTaskStatus' smart constructor.
setTaskStatus :: Text -> TaskStatus -> SetTaskStatus
setTaskStatus pTaskId pTaskStatus = SetTaskStatus'{_stsErrorStackTrace = Nothing, _stsErrorId = Nothing, _stsErrorMessage = Nothing, _stsTaskId = pTaskId, _stsTaskStatus = pTaskStatus};

-- | If an error occurred during the task, this value specifies the stack
-- trace associated with the error. This value is set on the physical
-- attempt object. It is used to display error information to the user. The
-- web service does not parse this value.
stsErrorStackTrace :: Lens' SetTaskStatus (Maybe Text)
stsErrorStackTrace = lens _stsErrorStackTrace (\ s a -> s{_stsErrorStackTrace = a});

-- | If an error occurred during the task, this value specifies the error
-- code. This value is set on the physical attempt object. It is used to
-- display error information to the user. It should not start with string
-- \"Service_\" which is reserved by the system.
stsErrorId :: Lens' SetTaskStatus (Maybe Text)
stsErrorId = lens _stsErrorId (\ s a -> s{_stsErrorId = a});

-- | If an error occurred during the task, this value specifies a text
-- description of the error. This value is set on the physical attempt
-- object. It is used to display error information to the user. The web
-- service does not parse this value.
stsErrorMessage :: Lens' SetTaskStatus (Maybe Text)
stsErrorMessage = lens _stsErrorMessage (\ s a -> s{_stsErrorMessage = a});

-- | The ID of the task assigned to the task runner. This value is provided
-- in the response for PollForTask.
stsTaskId :: Lens' SetTaskStatus Text
stsTaskId = lens _stsTaskId (\ s a -> s{_stsTaskId = a});

-- | If @FINISHED@, the task successfully completed. If @FAILED@, the task
-- ended unsuccessfully. Preconditions use false.
stsTaskStatus :: Lens' SetTaskStatus TaskStatus
stsTaskStatus = lens _stsTaskStatus (\ s a -> s{_stsTaskStatus = a});

instance AWSRequest SetTaskStatus where
        type Sv SetTaskStatus = DataPipeline
        type Rs SetTaskStatus = SetTaskStatusResponse
        request = postJSON
        response = receiveNull SetTaskStatusResponse'

instance ToHeaders SetTaskStatus where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DataPipeline.SetTaskStatus" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON SetTaskStatus where
        toJSON SetTaskStatus'{..}
          = object
              ["errorStackTrace" .= _stsErrorStackTrace,
               "errorId" .= _stsErrorId,
               "errorMessage" .= _stsErrorMessage,
               "taskId" .= _stsTaskId,
               "taskStatus" .= _stsTaskStatus]

instance ToPath SetTaskStatus where
        toPath = const "/"

instance ToQuery SetTaskStatus where
        toQuery = const mempty

-- | /See:/ 'setTaskStatusResponse' smart constructor.
data SetTaskStatusResponse = SetTaskStatusResponse' deriving (Eq, Read, Show)

-- | 'SetTaskStatusResponse' smart constructor.
setTaskStatusResponse :: SetTaskStatusResponse
setTaskStatusResponse = SetTaskStatusResponse';
