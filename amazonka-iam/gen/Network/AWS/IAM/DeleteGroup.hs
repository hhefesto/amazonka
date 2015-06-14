{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.IAM.DeleteGroup
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

-- | Deletes the specified group. The group must not contain any users or
-- have any attached policies.
--
-- <http://docs.aws.amazon.com/IAM/latest/APIReference/API_DeleteGroup.html>
module Network.AWS.IAM.DeleteGroup
    (
    -- * Request
      DeleteGroup
    -- ** Request constructor
    , deleteGroup
    -- ** Request lenses
    , dgGroupName

    -- * Response
    , DeleteGroupResponse
    -- ** Response constructor
    , deleteGroupResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.IAM.Types

-- | /See:/ 'deleteGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dgGroupName'
newtype DeleteGroup = DeleteGroup'{_dgGroupName :: Text} deriving (Eq, Read, Show)

-- | 'DeleteGroup' smart constructor.
deleteGroup :: Text -> DeleteGroup
deleteGroup pGroupName = DeleteGroup'{_dgGroupName = pGroupName};

-- | The name of the group to delete.
dgGroupName :: Lens' DeleteGroup Text
dgGroupName = lens _dgGroupName (\ s a -> s{_dgGroupName = a});

instance AWSRequest DeleteGroup where
        type Sv DeleteGroup = IAM
        type Rs DeleteGroup = DeleteGroupResponse
        request = post
        response = receiveNull DeleteGroupResponse'

instance ToHeaders DeleteGroup where
        toHeaders = const mempty

instance ToPath DeleteGroup where
        toPath = const "/"

instance ToQuery DeleteGroup where
        toQuery DeleteGroup'{..}
          = mconcat
              ["Action" =: ("DeleteGroup" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "GroupName" =: _dgGroupName]

-- | /See:/ 'deleteGroupResponse' smart constructor.
data DeleteGroupResponse = DeleteGroupResponse' deriving (Eq, Read, Show)

-- | 'DeleteGroupResponse' smart constructor.
deleteGroupResponse :: DeleteGroupResponse
deleteGroupResponse = DeleteGroupResponse';
