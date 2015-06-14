{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CodeDeploy.UpdateDeploymentGroup
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

-- | Changes information about an existing deployment group.
--
-- <http://docs.aws.amazon.com/codedeploy/latest/APIReference/API_UpdateDeploymentGroup.html>
module Network.AWS.CodeDeploy.UpdateDeploymentGroup
    (
    -- * Request
      UpdateDeploymentGroup
    -- ** Request constructor
    , updateDeploymentGroup
    -- ** Request lenses
    , udgServiceRoleARN
    , udgEc2TagFilters
    , udgOnPremisesInstanceTagFilters
    , udgAutoScalingGroups
    , udgApplicationName
    , udgCurrentDeploymentGroupName
    , udgDeploymentConfigName
    , udgNewDeploymentGroupName

    -- * Response
    , UpdateDeploymentGroupResponse
    -- ** Response constructor
    , updateDeploymentGroupResponse
    -- ** Response lenses
    , udgrHooksNotCleanedUp
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.CodeDeploy.Types

-- | /See:/ 'updateDeploymentGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'udgServiceRoleARN'
--
-- * 'udgEc2TagFilters'
--
-- * 'udgOnPremisesInstanceTagFilters'
--
-- * 'udgAutoScalingGroups'
--
-- * 'udgApplicationName'
--
-- * 'udgCurrentDeploymentGroupName'
--
-- * 'udgDeploymentConfigName'
--
-- * 'udgNewDeploymentGroupName'
data UpdateDeploymentGroup = UpdateDeploymentGroup'{_udgServiceRoleARN :: Maybe Text, _udgEc2TagFilters :: [EC2TagFilter], _udgOnPremisesInstanceTagFilters :: [TagFilter], _udgAutoScalingGroups :: [Text], _udgApplicationName :: Text, _udgCurrentDeploymentGroupName :: Text, _udgDeploymentConfigName :: Text, _udgNewDeploymentGroupName :: Text} deriving (Eq, Read, Show)

-- | 'UpdateDeploymentGroup' smart constructor.
updateDeploymentGroup :: Text -> Text -> Text -> Text -> UpdateDeploymentGroup
updateDeploymentGroup pApplicationName pCurrentDeploymentGroupName pDeploymentConfigName pNewDeploymentGroupName = UpdateDeploymentGroup'{_udgServiceRoleARN = Nothing, _udgEc2TagFilters = mempty, _udgOnPremisesInstanceTagFilters = mempty, _udgAutoScalingGroups = mempty, _udgApplicationName = pApplicationName, _udgCurrentDeploymentGroupName = pCurrentDeploymentGroupName, _udgDeploymentConfigName = pDeploymentConfigName, _udgNewDeploymentGroupName = pNewDeploymentGroupName};

-- | A replacement service role\'s ARN, if you want to change it.
udgServiceRoleARN :: Lens' UpdateDeploymentGroup (Maybe Text)
udgServiceRoleARN = lens _udgServiceRoleARN (\ s a -> s{_udgServiceRoleARN = a});

-- | The replacement set of Amazon EC2 tags to filter on, if you want to
-- change them.
udgEc2TagFilters :: Lens' UpdateDeploymentGroup [EC2TagFilter]
udgEc2TagFilters = lens _udgEc2TagFilters (\ s a -> s{_udgEc2TagFilters = a});

-- | The replacement set of on-premises instance tags for filter on, if you
-- want to change them.
udgOnPremisesInstanceTagFilters :: Lens' UpdateDeploymentGroup [TagFilter]
udgOnPremisesInstanceTagFilters = lens _udgOnPremisesInstanceTagFilters (\ s a -> s{_udgOnPremisesInstanceTagFilters = a});

-- | The replacement list of Auto Scaling groups to be included in the
-- deployment group, if you want to change them.
udgAutoScalingGroups :: Lens' UpdateDeploymentGroup [Text]
udgAutoScalingGroups = lens _udgAutoScalingGroups (\ s a -> s{_udgAutoScalingGroups = a});

-- | The application name corresponding to the deployment group to update.
udgApplicationName :: Lens' UpdateDeploymentGroup Text
udgApplicationName = lens _udgApplicationName (\ s a -> s{_udgApplicationName = a});

-- | The current name of the existing deployment group.
udgCurrentDeploymentGroupName :: Lens' UpdateDeploymentGroup Text
udgCurrentDeploymentGroupName = lens _udgCurrentDeploymentGroupName (\ s a -> s{_udgCurrentDeploymentGroupName = a});

-- | The replacement deployment configuration name to use, if you want to
-- change it.
udgDeploymentConfigName :: Lens' UpdateDeploymentGroup Text
udgDeploymentConfigName = lens _udgDeploymentConfigName (\ s a -> s{_udgDeploymentConfigName = a});

-- | The new name of the deployment group, if you want to change it.
udgNewDeploymentGroupName :: Lens' UpdateDeploymentGroup Text
udgNewDeploymentGroupName = lens _udgNewDeploymentGroupName (\ s a -> s{_udgNewDeploymentGroupName = a});

instance AWSRequest UpdateDeploymentGroup where
        type Sv UpdateDeploymentGroup = CodeDeploy
        type Rs UpdateDeploymentGroup =
             UpdateDeploymentGroupResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 UpdateDeploymentGroupResponse' <$>
                   x .?> "hooksNotCleanedUp" .!@ mempty)

instance ToHeaders UpdateDeploymentGroup where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CodeDeploy_20141006.UpdateDeploymentGroup" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateDeploymentGroup where
        toJSON UpdateDeploymentGroup'{..}
          = object
              ["serviceRoleArn" .= _udgServiceRoleARN,
               "ec2TagFilters" .= _udgEc2TagFilters,
               "onPremisesInstanceTagFilters" .=
                 _udgOnPremisesInstanceTagFilters,
               "autoScalingGroups" .= _udgAutoScalingGroups,
               "applicationName" .= _udgApplicationName,
               "currentDeploymentGroupName" .=
                 _udgCurrentDeploymentGroupName,
               "deploymentConfigName" .= _udgDeploymentConfigName,
               "newDeploymentGroupName" .=
                 _udgNewDeploymentGroupName]

instance ToPath UpdateDeploymentGroup where
        toPath = const "/"

instance ToQuery UpdateDeploymentGroup where
        toQuery = const mempty

-- | /See:/ 'updateDeploymentGroupResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'udgrHooksNotCleanedUp'
newtype UpdateDeploymentGroupResponse = UpdateDeploymentGroupResponse'{_udgrHooksNotCleanedUp :: [AutoScalingGroup]} deriving (Eq, Read, Show)

-- | 'UpdateDeploymentGroupResponse' smart constructor.
updateDeploymentGroupResponse :: UpdateDeploymentGroupResponse
updateDeploymentGroupResponse = UpdateDeploymentGroupResponse'{_udgrHooksNotCleanedUp = mempty};

-- | If the output contains no data, and the corresponding deployment group
-- contained at least one Auto Scaling group, AWS CodeDeploy successfully
-- removed all corresponding Auto Scaling lifecycle event hooks from the
-- AWS account. If the output does contain data, AWS CodeDeploy could not
-- remove some Auto Scaling lifecycle event hooks from the AWS account.
udgrHooksNotCleanedUp :: Lens' UpdateDeploymentGroupResponse [AutoScalingGroup]
udgrHooksNotCleanedUp = lens _udgrHooksNotCleanedUp (\ s a -> s{_udgrHooksNotCleanedUp = a});
