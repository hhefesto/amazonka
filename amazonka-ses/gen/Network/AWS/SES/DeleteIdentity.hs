{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SES.DeleteIdentity
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

-- | Deletes the specified identity (email address or domain) from the list
-- of verified identities.
--
-- This action is throttled at one request per second.
--
-- <http://docs.aws.amazon.com/ses/latest/APIReference/API_DeleteIdentity.html>
module Network.AWS.SES.DeleteIdentity
    (
    -- * Request
      DeleteIdentity
    -- ** Request constructor
    , deleteIdentity
    -- ** Request lenses
    , diIdentity

    -- * Response
    , DeleteIdentityResponse
    -- ** Response constructor
    , deleteIdentityResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.SES.Types

-- | /See:/ 'deleteIdentity' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'diIdentity'
newtype DeleteIdentity = DeleteIdentity'{_diIdentity :: Text} deriving (Eq, Read, Show)

-- | 'DeleteIdentity' smart constructor.
deleteIdentity :: Text -> DeleteIdentity
deleteIdentity pIdentity = DeleteIdentity'{_diIdentity = pIdentity};

-- | The identity to be removed from the list of identities for the AWS
-- Account.
diIdentity :: Lens' DeleteIdentity Text
diIdentity = lens _diIdentity (\ s a -> s{_diIdentity = a});

instance AWSRequest DeleteIdentity where
        type Sv DeleteIdentity = SES
        type Rs DeleteIdentity = DeleteIdentityResponse
        request = post
        response
          = receiveNullWrapper "DeleteIdentityResult"
              DeleteIdentityResponse'

instance ToHeaders DeleteIdentity where
        toHeaders = const mempty

instance ToPath DeleteIdentity where
        toPath = const "/"

instance ToQuery DeleteIdentity where
        toQuery DeleteIdentity'{..}
          = mconcat
              ["Action" =: ("DeleteIdentity" :: ByteString),
               "Version" =: ("2010-12-01" :: ByteString),
               "Identity" =: _diIdentity]

-- | /See:/ 'deleteIdentityResponse' smart constructor.
data DeleteIdentityResponse = DeleteIdentityResponse' deriving (Eq, Read, Show)

-- | 'DeleteIdentityResponse' smart constructor.
deleteIdentityResponse :: DeleteIdentityResponse
deleteIdentityResponse = DeleteIdentityResponse';
