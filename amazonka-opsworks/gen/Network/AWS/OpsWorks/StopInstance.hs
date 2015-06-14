{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.StopInstance
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

-- | Stops a specified instance. When you stop a standard instance, the data
-- disappears and must be reinstalled when you restart the instance. You
-- can stop an Amazon EBS-backed instance without losing data. For more
-- information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html Starting, Stopping, and Rebooting Instances>.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack, or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_StopInstance.html>
module Network.AWS.OpsWorks.StopInstance
    (
    -- * Request
      StopInstance
    -- ** Request constructor
    , stopInstance
    -- ** Request lenses
    , siInstanceId

    -- * Response
    , StopInstanceResponse
    -- ** Response constructor
    , stopInstanceResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.OpsWorks.Types

-- | /See:/ 'stopInstance' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'siInstanceId'
newtype StopInstance = StopInstance'{_siInstanceId :: Text} deriving (Eq, Read, Show)

-- | 'StopInstance' smart constructor.
stopInstance :: Text -> StopInstance
stopInstance pInstanceId = StopInstance'{_siInstanceId = pInstanceId};

-- | The instance ID.
siInstanceId :: Lens' StopInstance Text
siInstanceId = lens _siInstanceId (\ s a -> s{_siInstanceId = a});

instance AWSRequest StopInstance where
        type Sv StopInstance = OpsWorks
        type Rs StopInstance = StopInstanceResponse
        request = postJSON
        response = receiveNull StopInstanceResponse'

instance ToHeaders StopInstance where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.StopInstance" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON StopInstance where
        toJSON StopInstance'{..}
          = object ["InstanceId" .= _siInstanceId]

instance ToPath StopInstance where
        toPath = const "/"

instance ToQuery StopInstance where
        toQuery = const mempty

-- | /See:/ 'stopInstanceResponse' smart constructor.
data StopInstanceResponse = StopInstanceResponse' deriving (Eq, Read, Show)

-- | 'StopInstanceResponse' smart constructor.
stopInstanceResponse :: StopInstanceResponse
stopInstanceResponse = StopInstanceResponse';
