{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.CognitoIdentity.UpdateIdentityPool
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

-- | Updates a user pool.
--
-- You must use AWS Developer credentials to call this API.
--
-- <http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_UpdateIdentityPool.html>
module Network.AWS.CognitoIdentity.UpdateIdentityPool
    (
    -- * Request
      UpdateIdentityPool
    -- ** Request constructor
    , updateIdentityPool
    -- ** Request lenses
    , uipSupportedLoginProviders
    , uipOpenIdConnectProviderARNs
    , uipIdentityPoolId
    , uipIdentityPoolName
    , uipAllowUnauthenticatedIdentities
    , uipDeveloperProviderName

    -- * Response
    , IdentityPool
    -- ** Response constructor
    , identityPool
    -- ** Response lenses
    , ipSupportedLoginProviders
    , ipOpenIdConnectProviderARNs
    , ipIdentityPoolId
    , ipIdentityPoolName
    , ipAllowUnauthenticatedIdentities
    , ipDeveloperProviderName
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.CognitoIdentity.Types

-- | /See:/ 'updateIdentityPool' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'uipSupportedLoginProviders'
--
-- * 'uipOpenIdConnectProviderARNs'
--
-- * 'uipIdentityPoolId'
--
-- * 'uipIdentityPoolName'
--
-- * 'uipAllowUnauthenticatedIdentities'
--
-- * 'uipDeveloperProviderName'
data UpdateIdentityPool = UpdateIdentityPool'{_uipSupportedLoginProviders :: HashMap Text Text, _uipOpenIdConnectProviderARNs :: [Text], _uipIdentityPoolId :: Text, _uipIdentityPoolName :: Text, _uipAllowUnauthenticatedIdentities :: Bool, _uipDeveloperProviderName :: Text} deriving (Eq, Read, Show)

-- | 'UpdateIdentityPool' smart constructor.
updateIdentityPool :: Text -> Text -> Bool -> Text -> UpdateIdentityPool
updateIdentityPool pIdentityPoolId pIdentityPoolName pAllowUnauthenticatedIdentities pDeveloperProviderName = UpdateIdentityPool'{_uipSupportedLoginProviders = mempty, _uipOpenIdConnectProviderARNs = mempty, _uipIdentityPoolId = pIdentityPoolId, _uipIdentityPoolName = pIdentityPoolName, _uipAllowUnauthenticatedIdentities = pAllowUnauthenticatedIdentities, _uipDeveloperProviderName = pDeveloperProviderName};

-- | Optional key:value pairs mapping provider names to provider app IDs.
uipSupportedLoginProviders :: Lens' UpdateIdentityPool (HashMap Text Text)
uipSupportedLoginProviders = lens _uipSupportedLoginProviders (\ s a -> s{_uipSupportedLoginProviders = a}) . _Coerce;

-- | A list of OpendID Connect provider ARNs.
uipOpenIdConnectProviderARNs :: Lens' UpdateIdentityPool [Text]
uipOpenIdConnectProviderARNs = lens _uipOpenIdConnectProviderARNs (\ s a -> s{_uipOpenIdConnectProviderARNs = a});

-- | An identity pool ID in the format REGION:GUID.
uipIdentityPoolId :: Lens' UpdateIdentityPool Text
uipIdentityPoolId = lens _uipIdentityPoolId (\ s a -> s{_uipIdentityPoolId = a});

-- | A string that you provide.
uipIdentityPoolName :: Lens' UpdateIdentityPool Text
uipIdentityPoolName = lens _uipIdentityPoolName (\ s a -> s{_uipIdentityPoolName = a});

-- | TRUE if the identity pool supports unauthenticated logins.
uipAllowUnauthenticatedIdentities :: Lens' UpdateIdentityPool Bool
uipAllowUnauthenticatedIdentities = lens _uipAllowUnauthenticatedIdentities (\ s a -> s{_uipAllowUnauthenticatedIdentities = a});

-- | The \"domain\" by which Cognito will refer to your users.
uipDeveloperProviderName :: Lens' UpdateIdentityPool Text
uipDeveloperProviderName = lens _uipDeveloperProviderName (\ s a -> s{_uipDeveloperProviderName = a});

instance AWSRequest UpdateIdentityPool where
        type Sv UpdateIdentityPool = CognitoIdentity
        type Rs UpdateIdentityPool = IdentityPool
        request = postJSON
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders UpdateIdentityPool where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AWSCognitoIdentityService.UpdateIdentityPool" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateIdentityPool where
        toJSON UpdateIdentityPool'{..}
          = object
              ["SupportedLoginProviders" .=
                 _uipSupportedLoginProviders,
               "OpenIdConnectProviderARNs" .=
                 _uipOpenIdConnectProviderARNs,
               "IdentityPoolId" .= _uipIdentityPoolId,
               "IdentityPoolName" .= _uipIdentityPoolName,
               "AllowUnauthenticatedIdentities" .=
                 _uipAllowUnauthenticatedIdentities,
               "DeveloperProviderName" .= _uipDeveloperProviderName]

instance ToPath UpdateIdentityPool where
        toPath = const "/"

instance ToQuery UpdateIdentityPool where
        toQuery = const mempty
