{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.CreateDeployment
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

-- | Runs deployment or stack commands. For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workingapps-deploying.html Deploying Apps>
-- and
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-commands.html Run Stack Commands>.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Deploy or Manage permissions level for the stack, or an attached policy
-- that explicitly grants permissions. For more information on user
-- permissions, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_CreateDeployment.html>
module Network.AWS.OpsWorks.CreateDeployment
    (
    -- * Request
      CreateDeployment
    -- ** Request constructor
    , createDeployment
    -- ** Request lenses
    , cdCustomJSON
    , cdAppId
    , cdInstanceIds
    , cdComment
    , cdStackId
    , cdCommand

    -- * Response
    , CreateDeploymentResponse
    -- ** Response constructor
    , createDeploymentResponse
    -- ** Response lenses
    , cdrDeploymentId
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.OpsWorks.Types

-- | /See:/ 'createDeployment' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cdCustomJSON'
--
-- * 'cdAppId'
--
-- * 'cdInstanceIds'
--
-- * 'cdComment'
--
-- * 'cdStackId'
--
-- * 'cdCommand'
data CreateDeployment = CreateDeployment'{_cdCustomJSON :: Maybe Text, _cdAppId :: Maybe Text, _cdInstanceIds :: [Text], _cdComment :: Maybe Text, _cdStackId :: Text, _cdCommand :: DeploymentCommand} deriving (Eq, Read, Show)

-- | 'CreateDeployment' smart constructor.
createDeployment :: Text -> DeploymentCommand -> CreateDeployment
createDeployment pStackId pCommand = CreateDeployment'{_cdCustomJSON = Nothing, _cdAppId = Nothing, _cdInstanceIds = mempty, _cdComment = Nothing, _cdStackId = pStackId, _cdCommand = pCommand};

-- | A string that contains user-defined, custom JSON. It is used to override
-- the corresponding default stack configuration JSON values. The string
-- should be in the following format and must escape characters such as
-- \'\"\'.:
--
-- @\"{\\\"key1\\\": \\\"value1\\\", \\\"key2\\\": \\\"value2\\\",...}\"@
--
-- For more information on custom JSON, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workingstacks-json.html Use Custom JSON to Modify the Stack Configuration Attributes>.
cdCustomJSON :: Lens' CreateDeployment (Maybe Text)
cdCustomJSON = lens _cdCustomJSON (\ s a -> s{_cdCustomJSON = a});

-- | The app ID. This parameter is required for app deployments, but not for
-- other deployment commands.
cdAppId :: Lens' CreateDeployment (Maybe Text)
cdAppId = lens _cdAppId (\ s a -> s{_cdAppId = a});

-- | The instance IDs for the deployment targets.
cdInstanceIds :: Lens' CreateDeployment [Text]
cdInstanceIds = lens _cdInstanceIds (\ s a -> s{_cdInstanceIds = a});

-- | A user-defined comment.
cdComment :: Lens' CreateDeployment (Maybe Text)
cdComment = lens _cdComment (\ s a -> s{_cdComment = a});

-- | The stack ID.
cdStackId :: Lens' CreateDeployment Text
cdStackId = lens _cdStackId (\ s a -> s{_cdStackId = a});

-- | A @DeploymentCommand@ object that specifies the deployment command and
-- any associated arguments.
cdCommand :: Lens' CreateDeployment DeploymentCommand
cdCommand = lens _cdCommand (\ s a -> s{_cdCommand = a});

instance AWSRequest CreateDeployment where
        type Sv CreateDeployment = OpsWorks
        type Rs CreateDeployment = CreateDeploymentResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 CreateDeploymentResponse' <$> x .?> "DeploymentId")

instance ToHeaders CreateDeployment where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.CreateDeployment" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateDeployment where
        toJSON CreateDeployment'{..}
          = object
              ["CustomJson" .= _cdCustomJSON, "AppId" .= _cdAppId,
               "InstanceIds" .= _cdInstanceIds,
               "Comment" .= _cdComment, "StackId" .= _cdStackId,
               "Command" .= _cdCommand]

instance ToPath CreateDeployment where
        toPath = const "/"

instance ToQuery CreateDeployment where
        toQuery = const mempty

-- | /See:/ 'createDeploymentResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cdrDeploymentId'
newtype CreateDeploymentResponse = CreateDeploymentResponse'{_cdrDeploymentId :: Maybe Text} deriving (Eq, Read, Show)

-- | 'CreateDeploymentResponse' smart constructor.
createDeploymentResponse :: CreateDeploymentResponse
createDeploymentResponse = CreateDeploymentResponse'{_cdrDeploymentId = Nothing};

-- | The deployment ID, which can be used with other requests to identify the
-- deployment.
cdrDeploymentId :: Lens' CreateDeploymentResponse (Maybe Text)
cdrDeploymentId = lens _cdrDeploymentId (\ s a -> s{_cdrDeploymentId = a});
