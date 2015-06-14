{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DirectConnect.DeleteConnection
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

-- | Deletes the connection.
--
-- Deleting a connection only stops the AWS Direct Connect port hour and
-- data transfer charges. You need to cancel separately with the providers
-- any services or charges for cross-connects or network circuits that
-- connect you to the AWS Direct Connect location.
--
-- <http://docs.aws.amazon.com/directconnect/latest/APIReference/API_DeleteConnection.html>
module Network.AWS.DirectConnect.DeleteConnection
    (
    -- * Request
      DeleteConnection
    -- ** Request constructor
    , deleteConnection
    -- ** Request lenses
    , dcConnectionId

    -- * Response
    , Connection
    -- ** Response constructor
    , connection
    -- ** Response lenses
    , conVlan
    , conLocation
    , conConnectionId
    , conConnectionName
    , conPartnerName
    , conBandwidth
    , conRegion
    , conOwnerAccount
    , conConnectionState
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DirectConnect.Types

-- | /See:/ 'deleteConnection' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcConnectionId'
newtype DeleteConnection = DeleteConnection'{_dcConnectionId :: Text} deriving (Eq, Read, Show)

-- | 'DeleteConnection' smart constructor.
deleteConnection :: Text -> DeleteConnection
deleteConnection pConnectionId = DeleteConnection'{_dcConnectionId = pConnectionId};

-- | FIXME: Undocumented member.
dcConnectionId :: Lens' DeleteConnection Text
dcConnectionId = lens _dcConnectionId (\ s a -> s{_dcConnectionId = a});

instance AWSRequest DeleteConnection where
        type Sv DeleteConnection = DirectConnect
        type Rs DeleteConnection = Connection
        request = postJSON
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders DeleteConnection where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OvertureService.DeleteConnection" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteConnection where
        toJSON DeleteConnection'{..}
          = object ["connectionId" .= _dcConnectionId]

instance ToPath DeleteConnection where
        toPath = const "/"

instance ToQuery DeleteConnection where
        toQuery = const mempty
