{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.RebootInstance
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

-- | Reboots a specified instance. For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workinginstances-starting.html Starting, Stopping, and Rebooting Instances>.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack, or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_RebootInstance.html>
module Network.AWS.OpsWorks.RebootInstance
    (
    -- * Request
      RebootInstance
    -- ** Request constructor
    , rebootInstance
    -- ** Request lenses
    , riInstanceId

    -- * Response
    , RebootInstanceResponse
    -- ** Response constructor
    , rebootInstanceResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.OpsWorks.Types

-- | /See:/ 'rebootInstance' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'riInstanceId'
newtype RebootInstance = RebootInstance'{_riInstanceId :: Text} deriving (Eq, Read, Show)

-- | 'RebootInstance' smart constructor.
rebootInstance :: Text -> RebootInstance
rebootInstance pInstanceId = RebootInstance'{_riInstanceId = pInstanceId};

-- | The instance ID.
riInstanceId :: Lens' RebootInstance Text
riInstanceId = lens _riInstanceId (\ s a -> s{_riInstanceId = a});

instance AWSRequest RebootInstance where
        type Sv RebootInstance = OpsWorks
        type Rs RebootInstance = RebootInstanceResponse
        request = postJSON
        response = receiveNull RebootInstanceResponse'

instance ToHeaders RebootInstance where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.RebootInstance" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON RebootInstance where
        toJSON RebootInstance'{..}
          = object ["InstanceId" .= _riInstanceId]

instance ToPath RebootInstance where
        toPath = const "/"

instance ToQuery RebootInstance where
        toQuery = const mempty

-- | /See:/ 'rebootInstanceResponse' smart constructor.
data RebootInstanceResponse = RebootInstanceResponse' deriving (Eq, Read, Show)

-- | 'RebootInstanceResponse' smart constructor.
rebootInstanceResponse :: RebootInstanceResponse
rebootInstanceResponse = RebootInstanceResponse';
