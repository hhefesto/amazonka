{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.AutoScaling.DescribeLaunchConfigurations
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

-- | Describes one or more launch configurations. If you omit the list of
-- names, then the call describes all launch configurations.
--
-- You can specify a maximum number of items to be returned with a single
-- call. If there are more items to return, the call returns a token. To
-- get the next set of items, repeat the call with the returned token in
-- the @NextToken@ parameter.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_DescribeLaunchConfigurations.html>
module Network.AWS.AutoScaling.DescribeLaunchConfigurations
    (
    -- * Request
      DescribeLaunchConfigurations
    -- ** Request constructor
    , describeLaunchConfigurations
    -- ** Request lenses
    , dlcLaunchConfigurationNames
    , dlcNextToken
    , dlcMaxRecords

    -- * Response
    , DescribeLaunchConfigurationsResponse
    -- ** Response constructor
    , describeLaunchConfigurationsResponse
    -- ** Response lenses
    , dlcrNextToken
    , dlcrLaunchConfigurations
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.AutoScaling.Types

-- | /See:/ 'describeLaunchConfigurations' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dlcLaunchConfigurationNames'
--
-- * 'dlcNextToken'
--
-- * 'dlcMaxRecords'
data DescribeLaunchConfigurations = DescribeLaunchConfigurations'{_dlcLaunchConfigurationNames :: [Text], _dlcNextToken :: Maybe Text, _dlcMaxRecords :: Maybe Int} deriving (Eq, Read, Show)

-- | 'DescribeLaunchConfigurations' smart constructor.
describeLaunchConfigurations :: DescribeLaunchConfigurations
describeLaunchConfigurations = DescribeLaunchConfigurations'{_dlcLaunchConfigurationNames = mempty, _dlcNextToken = Nothing, _dlcMaxRecords = Nothing};

-- | The launch configuration names.
dlcLaunchConfigurationNames :: Lens' DescribeLaunchConfigurations [Text]
dlcLaunchConfigurationNames = lens _dlcLaunchConfigurationNames (\ s a -> s{_dlcLaunchConfigurationNames = a});

-- | The token for the next set of items to return. (You received this token
-- from a previous call.)
dlcNextToken :: Lens' DescribeLaunchConfigurations (Maybe Text)
dlcNextToken = lens _dlcNextToken (\ s a -> s{_dlcNextToken = a});

-- | The maximum number of items to return with this call. The default is
-- 100.
dlcMaxRecords :: Lens' DescribeLaunchConfigurations (Maybe Int)
dlcMaxRecords = lens _dlcMaxRecords (\ s a -> s{_dlcMaxRecords = a});

instance AWSRequest DescribeLaunchConfigurations
         where
        type Sv DescribeLaunchConfigurations = AutoScaling
        type Rs DescribeLaunchConfigurations =
             DescribeLaunchConfigurationsResponse
        request = post
        response
          = receiveXMLWrapper
              "DescribeLaunchConfigurationsResult"
              (\ s h x ->
                 DescribeLaunchConfigurationsResponse' <$>
                   x .@? "NextToken" <*>
                     (x .@? "LaunchConfigurations" .!@ mempty >>=
                        parseXMLList "member"))

instance ToHeaders DescribeLaunchConfigurations where
        toHeaders = const mempty

instance ToPath DescribeLaunchConfigurations where
        toPath = const "/"

instance ToQuery DescribeLaunchConfigurations where
        toQuery DescribeLaunchConfigurations'{..}
          = mconcat
              ["Action" =:
                 ("DescribeLaunchConfigurations" :: ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "LaunchConfigurationNames" =:
                 "member" =: _dlcLaunchConfigurationNames,
               "NextToken" =: _dlcNextToken,
               "MaxRecords" =: _dlcMaxRecords]

-- | /See:/ 'describeLaunchConfigurationsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dlcrNextToken'
--
-- * 'dlcrLaunchConfigurations'
data DescribeLaunchConfigurationsResponse = DescribeLaunchConfigurationsResponse'{_dlcrNextToken :: Maybe Text, _dlcrLaunchConfigurations :: [LaunchConfiguration]} deriving (Eq, Read, Show)

-- | 'DescribeLaunchConfigurationsResponse' smart constructor.
describeLaunchConfigurationsResponse :: [LaunchConfiguration] -> DescribeLaunchConfigurationsResponse
describeLaunchConfigurationsResponse pLaunchConfigurations = DescribeLaunchConfigurationsResponse'{_dlcrNextToken = Nothing, _dlcrLaunchConfigurations = pLaunchConfigurations};

-- | The token to use when requesting the next set of items. If there are no
-- additional items to return, the string is empty.
dlcrNextToken :: Lens' DescribeLaunchConfigurationsResponse (Maybe Text)
dlcrNextToken = lens _dlcrNextToken (\ s a -> s{_dlcrNextToken = a});

-- | The launch configurations.
dlcrLaunchConfigurations :: Lens' DescribeLaunchConfigurationsResponse [LaunchConfiguration]
dlcrLaunchConfigurations = lens _dlcrLaunchConfigurations (\ s a -> s{_dlcrLaunchConfigurations = a});
