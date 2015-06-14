{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.OpsWorks.UpdateLayer
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

-- | Updates a specified layer.
--
-- __Required Permissions__: To use this action, an IAM user must have a
-- Manage permissions level for the stack, or an attached policy that
-- explicitly grants permissions. For more information on user permissions,
-- see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/opsworks-security-users.html Managing User Permissions>.
--
-- <http://docs.aws.amazon.com/opsworks/latest/APIReference/API_UpdateLayer.html>
module Network.AWS.OpsWorks.UpdateLayer
    (
    -- * Request
      UpdateLayer
    -- ** Request constructor
    , updateLayer
    -- ** Request lenses
    , ulCustomInstanceProfileARN
    , ulInstallUpdatesOnBoot
    , ulCustomSecurityGroupIds
    , ulLifecycleEventConfiguration
    , ulShortname
    , ulCustomRecipes
    , ulVolumeConfigurations
    , ulEnableAutoHealing
    , ulPackages
    , ulName
    , ulAttributes
    , ulAutoAssignPublicIPs
    , ulUseEBSOptimizedInstances
    , ulAutoAssignElasticIPs
    , ulLayerId

    -- * Response
    , UpdateLayerResponse
    -- ** Response constructor
    , updateLayerResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.OpsWorks.Types

-- | /See:/ 'updateLayer' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ulCustomInstanceProfileARN'
--
-- * 'ulInstallUpdatesOnBoot'
--
-- * 'ulCustomSecurityGroupIds'
--
-- * 'ulLifecycleEventConfiguration'
--
-- * 'ulShortname'
--
-- * 'ulCustomRecipes'
--
-- * 'ulVolumeConfigurations'
--
-- * 'ulEnableAutoHealing'
--
-- * 'ulPackages'
--
-- * 'ulName'
--
-- * 'ulAttributes'
--
-- * 'ulAutoAssignPublicIPs'
--
-- * 'ulUseEBSOptimizedInstances'
--
-- * 'ulAutoAssignElasticIPs'
--
-- * 'ulLayerId'
data UpdateLayer = UpdateLayer'{_ulCustomInstanceProfileARN :: Maybe Text, _ulInstallUpdatesOnBoot :: Maybe Bool, _ulCustomSecurityGroupIds :: [Text], _ulLifecycleEventConfiguration :: Maybe LifecycleEventConfiguration, _ulShortname :: Maybe Text, _ulCustomRecipes :: Maybe Recipes, _ulVolumeConfigurations :: [VolumeConfiguration], _ulEnableAutoHealing :: Maybe Bool, _ulPackages :: [Text], _ulName :: Maybe Text, _ulAttributes :: HashMap LayerAttributesKeys Text, _ulAutoAssignPublicIPs :: Maybe Bool, _ulUseEBSOptimizedInstances :: Maybe Bool, _ulAutoAssignElasticIPs :: Maybe Bool, _ulLayerId :: Text} deriving (Eq, Read, Show)

-- | 'UpdateLayer' smart constructor.
updateLayer :: Text -> UpdateLayer
updateLayer pLayerId = UpdateLayer'{_ulCustomInstanceProfileARN = Nothing, _ulInstallUpdatesOnBoot = Nothing, _ulCustomSecurityGroupIds = mempty, _ulLifecycleEventConfiguration = Nothing, _ulShortname = Nothing, _ulCustomRecipes = Nothing, _ulVolumeConfigurations = mempty, _ulEnableAutoHealing = Nothing, _ulPackages = mempty, _ulName = Nothing, _ulAttributes = mempty, _ulAutoAssignPublicIPs = Nothing, _ulUseEBSOptimizedInstances = Nothing, _ulAutoAssignElasticIPs = Nothing, _ulLayerId = pLayerId};

-- | The ARN of an IAM profile to be used for all of the layer\'s EC2
-- instances. For more information about IAM ARNs, see
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html Using Identifiers>.
ulCustomInstanceProfileARN :: Lens' UpdateLayer (Maybe Text)
ulCustomInstanceProfileARN = lens _ulCustomInstanceProfileARN (\ s a -> s{_ulCustomInstanceProfileARN = a});

-- | Whether to install operating system and package updates when the
-- instance boots. The default value is @true@. To control when updates are
-- installed, set this value to @false@. You must then update your
-- instances manually by using CreateDeployment to run the
-- @update_dependencies@ stack command or manually running @yum@ (Amazon
-- Linux) or @apt-get@ (Ubuntu) on the instances.
--
-- We strongly recommend using the default value of @true@, to ensure that
-- your instances have the latest security updates.
ulInstallUpdatesOnBoot :: Lens' UpdateLayer (Maybe Bool)
ulInstallUpdatesOnBoot = lens _ulInstallUpdatesOnBoot (\ s a -> s{_ulInstallUpdatesOnBoot = a});

-- | An array containing the layer\'s custom security group IDs.
ulCustomSecurityGroupIds :: Lens' UpdateLayer [Text]
ulCustomSecurityGroupIds = lens _ulCustomSecurityGroupIds (\ s a -> s{_ulCustomSecurityGroupIds = a});

-- |
ulLifecycleEventConfiguration :: Lens' UpdateLayer (Maybe LifecycleEventConfiguration)
ulLifecycleEventConfiguration = lens _ulLifecycleEventConfiguration (\ s a -> s{_ulLifecycleEventConfiguration = a});

-- | For custom layers only, use this parameter to specify the layer\'s short
-- name, which is used internally by AWS OpsWorksand by Chef. The short
-- name is also used as the name for the directory where your app files are
-- installed. It can have a maximum of 200 characters and must be in the
-- following format: \/\\A[a-z0-9\\-\\_\\.]+\\Z\/.
--
-- The built-in layers\' short names are defined by AWS OpsWorks. For more
-- information, see the
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/layers.html Layer Reference>
ulShortname :: Lens' UpdateLayer (Maybe Text)
ulShortname = lens _ulShortname (\ s a -> s{_ulShortname = a});

-- | A @LayerCustomRecipes@ object that specifies the layer\'s custom
-- recipes.
ulCustomRecipes :: Lens' UpdateLayer (Maybe Recipes)
ulCustomRecipes = lens _ulCustomRecipes (\ s a -> s{_ulCustomRecipes = a});

-- | A @VolumeConfigurations@ object that describes the layer\'s Amazon EBS
-- volumes.
ulVolumeConfigurations :: Lens' UpdateLayer [VolumeConfiguration]
ulVolumeConfigurations = lens _ulVolumeConfigurations (\ s a -> s{_ulVolumeConfigurations = a});

-- | Whether to disable auto healing for the layer.
ulEnableAutoHealing :: Lens' UpdateLayer (Maybe Bool)
ulEnableAutoHealing = lens _ulEnableAutoHealing (\ s a -> s{_ulEnableAutoHealing = a});

-- | An array of @Package@ objects that describe the layer\'s packages.
ulPackages :: Lens' UpdateLayer [Text]
ulPackages = lens _ulPackages (\ s a -> s{_ulPackages = a});

-- | The layer name, which is used by the console.
ulName :: Lens' UpdateLayer (Maybe Text)
ulName = lens _ulName (\ s a -> s{_ulName = a});

-- | One or more user-defined key\/value pairs to be added to the stack
-- attributes.
ulAttributes :: Lens' UpdateLayer (HashMap LayerAttributesKeys Text)
ulAttributes = lens _ulAttributes (\ s a -> s{_ulAttributes = a}) . _Coerce;

-- | For stacks that are running in a VPC, whether to automatically assign a
-- public IP address to the layer\'s instances. For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html How to Edit a Layer>.
ulAutoAssignPublicIPs :: Lens' UpdateLayer (Maybe Bool)
ulAutoAssignPublicIPs = lens _ulAutoAssignPublicIPs (\ s a -> s{_ulAutoAssignPublicIPs = a});

-- | Whether to use Amazon EBS-optimized instances.
ulUseEBSOptimizedInstances :: Lens' UpdateLayer (Maybe Bool)
ulUseEBSOptimizedInstances = lens _ulUseEBSOptimizedInstances (\ s a -> s{_ulUseEBSOptimizedInstances = a});

-- | Whether to automatically assign an
-- <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html Elastic IP address>
-- to the layer\'s instances. For more information, see
-- <http://docs.aws.amazon.com/opsworks/latest/userguide/workinglayers-basics-edit.html How to Edit a Layer>.
ulAutoAssignElasticIPs :: Lens' UpdateLayer (Maybe Bool)
ulAutoAssignElasticIPs = lens _ulAutoAssignElasticIPs (\ s a -> s{_ulAutoAssignElasticIPs = a});

-- | The layer ID.
ulLayerId :: Lens' UpdateLayer Text
ulLayerId = lens _ulLayerId (\ s a -> s{_ulLayerId = a});

instance AWSRequest UpdateLayer where
        type Sv UpdateLayer = OpsWorks
        type Rs UpdateLayer = UpdateLayerResponse
        request = postJSON
        response = receiveNull UpdateLayerResponse'

instance ToHeaders UpdateLayer where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OpsWorks_20130218.UpdateLayer" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateLayer where
        toJSON UpdateLayer'{..}
          = object
              ["CustomInstanceProfileArn" .=
                 _ulCustomInstanceProfileARN,
               "InstallUpdatesOnBoot" .= _ulInstallUpdatesOnBoot,
               "CustomSecurityGroupIds" .=
                 _ulCustomSecurityGroupIds,
               "LifecycleEventConfiguration" .=
                 _ulLifecycleEventConfiguration,
               "Shortname" .= _ulShortname,
               "CustomRecipes" .= _ulCustomRecipes,
               "VolumeConfigurations" .= _ulVolumeConfigurations,
               "EnableAutoHealing" .= _ulEnableAutoHealing,
               "Packages" .= _ulPackages, "Name" .= _ulName,
               "Attributes" .= _ulAttributes,
               "AutoAssignPublicIps" .= _ulAutoAssignPublicIPs,
               "UseEbsOptimizedInstances" .=
                 _ulUseEBSOptimizedInstances,
               "AutoAssignElasticIps" .= _ulAutoAssignElasticIPs,
               "LayerId" .= _ulLayerId]

instance ToPath UpdateLayer where
        toPath = const "/"

instance ToQuery UpdateLayer where
        toQuery = const mempty

-- | /See:/ 'updateLayerResponse' smart constructor.
data UpdateLayerResponse = UpdateLayerResponse' deriving (Eq, Read, Show)

-- | 'UpdateLayerResponse' smart constructor.
updateLayerResponse :: UpdateLayerResponse
updateLayerResponse = UpdateLayerResponse';
