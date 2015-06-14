{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SSM.UpdateAssociationStatus
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

-- | Updates the status of the configuration document associated with the
-- specified instance.
--
-- <http://docs.aws.amazon.com/ssm/latest/APIReference/API_UpdateAssociationStatus.html>
module Network.AWS.SSM.UpdateAssociationStatus
    (
    -- * Request
      UpdateAssociationStatus
    -- ** Request constructor
    , updateAssociationStatus
    -- ** Request lenses
    , uasName
    , uasInstanceId
    , uasAssociationStatus

    -- * Response
    , UpdateAssociationStatusResponse
    -- ** Response constructor
    , updateAssociationStatusResponse
    -- ** Response lenses
    , uasrAssociationDescription
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.SSM.Types

-- | /See:/ 'updateAssociationStatus' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'uasName'
--
-- * 'uasInstanceId'
--
-- * 'uasAssociationStatus'
data UpdateAssociationStatus = UpdateAssociationStatus'{_uasName :: Text, _uasInstanceId :: Text, _uasAssociationStatus :: AssociationStatus} deriving (Eq, Read, Show)

-- | 'UpdateAssociationStatus' smart constructor.
updateAssociationStatus :: Text -> Text -> AssociationStatus -> UpdateAssociationStatus
updateAssociationStatus pName pInstanceId pAssociationStatus = UpdateAssociationStatus'{_uasName = pName, _uasInstanceId = pInstanceId, _uasAssociationStatus = pAssociationStatus};

-- | The name of the configuration document.
uasName :: Lens' UpdateAssociationStatus Text
uasName = lens _uasName (\ s a -> s{_uasName = a});

-- | The ID of the instance.
uasInstanceId :: Lens' UpdateAssociationStatus Text
uasInstanceId = lens _uasInstanceId (\ s a -> s{_uasInstanceId = a});

-- | The association status.
uasAssociationStatus :: Lens' UpdateAssociationStatus AssociationStatus
uasAssociationStatus = lens _uasAssociationStatus (\ s a -> s{_uasAssociationStatus = a});

instance AWSRequest UpdateAssociationStatus where
        type Sv UpdateAssociationStatus = SSM
        type Rs UpdateAssociationStatus =
             UpdateAssociationStatusResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 UpdateAssociationStatusResponse' <$>
                   x .?> "AssociationDescription")

instance ToHeaders UpdateAssociationStatus where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.UpdateAssociationStatus" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateAssociationStatus where
        toJSON UpdateAssociationStatus'{..}
          = object
              ["Name" .= _uasName, "InstanceId" .= _uasInstanceId,
               "AssociationStatus" .= _uasAssociationStatus]

instance ToPath UpdateAssociationStatus where
        toPath = const "/"

instance ToQuery UpdateAssociationStatus where
        toQuery = const mempty

-- | /See:/ 'updateAssociationStatusResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'uasrAssociationDescription'
newtype UpdateAssociationStatusResponse = UpdateAssociationStatusResponse'{_uasrAssociationDescription :: Maybe AssociationDescription} deriving (Eq, Read, Show)

-- | 'UpdateAssociationStatusResponse' smart constructor.
updateAssociationStatusResponse :: UpdateAssociationStatusResponse
updateAssociationStatusResponse = UpdateAssociationStatusResponse'{_uasrAssociationDescription = Nothing};

-- | Information about the association.
uasrAssociationDescription :: Lens' UpdateAssociationStatusResponse (Maybe AssociationDescription)
uasrAssociationDescription = lens _uasrAssociationDescription (\ s a -> s{_uasrAssociationDescription = a});
