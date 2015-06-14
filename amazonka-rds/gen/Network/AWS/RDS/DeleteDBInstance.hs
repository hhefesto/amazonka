{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.RDS.DeleteDBInstance
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

-- | The DeleteDBInstance action deletes a previously provisioned DB
-- instance. A successful response from the web service indicates the
-- request was received correctly. When you delete a DB instance, all
-- automated backups for that instance are deleted and cannot be recovered.
-- Manual DB snapshots of the DB instance to be deleted are not deleted.
--
-- If a final DB snapshot is requested the status of the RDS instance will
-- be \"deleting\" until the DB snapshot is created. The API action
-- @DescribeDBInstance@ is used to monitor the status of this operation.
-- The action cannot be canceled or reverted once submitted.
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_DeleteDBInstance.html>
module Network.AWS.RDS.DeleteDBInstance
    (
    -- * Request
      DeleteDBInstance
    -- ** Request constructor
    , deleteDBInstance
    -- ** Request lenses
    , ddiFinalDBSnapshotIdentifier
    , ddiSkipFinalSnapshot
    , ddiDBInstanceIdentifier

    -- * Response
    , DeleteDBInstanceResponse
    -- ** Response constructor
    , deleteDBInstanceResponse
    -- ** Response lenses
    , ddirDBInstance
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.RDS.Types

-- | /See:/ 'deleteDBInstance' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ddiFinalDBSnapshotIdentifier'
--
-- * 'ddiSkipFinalSnapshot'
--
-- * 'ddiDBInstanceIdentifier'
data DeleteDBInstance = DeleteDBInstance'{_ddiFinalDBSnapshotIdentifier :: Maybe Text, _ddiSkipFinalSnapshot :: Maybe Bool, _ddiDBInstanceIdentifier :: Text} deriving (Eq, Read, Show)

-- | 'DeleteDBInstance' smart constructor.
deleteDBInstance :: Text -> DeleteDBInstance
deleteDBInstance pDBInstanceIdentifier = DeleteDBInstance'{_ddiFinalDBSnapshotIdentifier = Nothing, _ddiSkipFinalSnapshot = Nothing, _ddiDBInstanceIdentifier = pDBInstanceIdentifier};

-- | The DBSnapshotIdentifier of the new DBSnapshot created when
-- SkipFinalSnapshot is set to @false@.
--
-- Specifying this parameter and also setting the SkipFinalShapshot
-- parameter to true results in an error.
--
-- Constraints:
--
-- -   Must be 1 to 255 alphanumeric characters
-- -   First character must be a letter
-- -   Cannot end with a hyphen or contain two consecutive hyphens
-- -   Cannot be specified when deleting a Read Replica.
ddiFinalDBSnapshotIdentifier :: Lens' DeleteDBInstance (Maybe Text)
ddiFinalDBSnapshotIdentifier = lens _ddiFinalDBSnapshotIdentifier (\ s a -> s{_ddiFinalDBSnapshotIdentifier = a});

-- | Determines whether a final DB snapshot is created before the DB instance
-- is deleted. If @true@ is specified, no DBSnapshot is created. If @false@
-- is specified, a DB snapshot is created before the DB instance is
-- deleted.
--
-- Specify @true@ when deleting a Read Replica.
--
-- The FinalDBSnapshotIdentifier parameter must be specified if
-- SkipFinalSnapshot is @false@.
--
-- Default: @false@
ddiSkipFinalSnapshot :: Lens' DeleteDBInstance (Maybe Bool)
ddiSkipFinalSnapshot = lens _ddiSkipFinalSnapshot (\ s a -> s{_ddiSkipFinalSnapshot = a});

-- | The DB instance identifier for the DB instance to be deleted. This
-- parameter isn\'t case sensitive.
--
-- Constraints:
--
-- -   Must contain from 1 to 63 alphanumeric characters or hyphens
-- -   First character must be a letter
-- -   Cannot end with a hyphen or contain two consecutive hyphens
ddiDBInstanceIdentifier :: Lens' DeleteDBInstance Text
ddiDBInstanceIdentifier = lens _ddiDBInstanceIdentifier (\ s a -> s{_ddiDBInstanceIdentifier = a});

instance AWSRequest DeleteDBInstance where
        type Sv DeleteDBInstance = RDS
        type Rs DeleteDBInstance = DeleteDBInstanceResponse
        request = post
        response
          = receiveXMLWrapper "DeleteDBInstanceResult"
              (\ s h x ->
                 DeleteDBInstanceResponse' <$> x .@? "DBInstance")

instance ToHeaders DeleteDBInstance where
        toHeaders = const mempty

instance ToPath DeleteDBInstance where
        toPath = const "/"

instance ToQuery DeleteDBInstance where
        toQuery DeleteDBInstance'{..}
          = mconcat
              ["Action" =: ("DeleteDBInstance" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "FinalDBSnapshotIdentifier" =:
                 _ddiFinalDBSnapshotIdentifier,
               "SkipFinalSnapshot" =: _ddiSkipFinalSnapshot,
               "DBInstanceIdentifier" =: _ddiDBInstanceIdentifier]

-- | /See:/ 'deleteDBInstanceResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ddirDBInstance'
newtype DeleteDBInstanceResponse = DeleteDBInstanceResponse'{_ddirDBInstance :: Maybe DBInstance} deriving (Eq, Read, Show)

-- | 'DeleteDBInstanceResponse' smart constructor.
deleteDBInstanceResponse :: DeleteDBInstanceResponse
deleteDBInstanceResponse = DeleteDBInstanceResponse'{_ddirDBInstance = Nothing};

-- | FIXME: Undocumented member.
ddirDBInstance :: Lens' DeleteDBInstanceResponse (Maybe DBInstance)
ddirDBInstance = lens _ddirDBInstance (\ s a -> s{_ddirDBInstance = a});
