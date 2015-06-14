{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DynamoDB.ListTables
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

-- | Returns an array of table names associated with the current account and
-- endpoint. The output from /ListTables/ is paginated, with each page
-- returning a maximum of 100 table names.
--
-- <http://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_ListTables.html>
module Network.AWS.DynamoDB.ListTables
    (
    -- * Request
      ListTables
    -- ** Request constructor
    , listTables
    -- ** Request lenses
    , ltExclusiveStartTableName
    , ltLimit

    -- * Response
    , ListTablesResponse
    -- ** Response constructor
    , listTablesResponse
    -- ** Response lenses
    , ltrTableNames
    , ltrLastEvaluatedTableName
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DynamoDB.Types

-- | /See:/ 'listTables' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ltExclusiveStartTableName'
--
-- * 'ltLimit'
data ListTables = ListTables'{_ltExclusiveStartTableName :: Text, _ltLimit :: Nat} deriving (Eq, Read, Show)

-- | 'ListTables' smart constructor.
listTables :: Text -> Natural -> ListTables
listTables pExclusiveStartTableName pLimit = ListTables'{_ltExclusiveStartTableName = pExclusiveStartTableName, _ltLimit = _Nat # pLimit};

-- | The first table name that this operation will evaluate. Use the value
-- that was returned for /LastEvaluatedTableName/ in a previous operation,
-- so that you can obtain the next page of results.
ltExclusiveStartTableName :: Lens' ListTables Text
ltExclusiveStartTableName = lens _ltExclusiveStartTableName (\ s a -> s{_ltExclusiveStartTableName = a});

-- | A maximum number of table names to return. If this parameter is not
-- specified, the limit is 100.
ltLimit :: Lens' ListTables Natural
ltLimit = lens _ltLimit (\ s a -> s{_ltLimit = a}) . _Nat;

instance AWSRequest ListTables where
        type Sv ListTables = DynamoDB
        type Rs ListTables = ListTablesResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ListTablesResponse' <$>
                   x .?> "TableNames" .!@ mempty <*>
                     x .:> "LastEvaluatedTableName")

instance ToHeaders ListTables where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DynamoDB_20120810.ListTables" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.0" :: ByteString)])

instance ToJSON ListTables where
        toJSON ListTables'{..}
          = object
              ["ExclusiveStartTableName" .=
                 _ltExclusiveStartTableName,
               "Limit" .= _ltLimit]

instance ToPath ListTables where
        toPath = const "/"

instance ToQuery ListTables where
        toQuery = const mempty

-- | /See:/ 'listTablesResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ltrTableNames'
--
-- * 'ltrLastEvaluatedTableName'
data ListTablesResponse = ListTablesResponse'{_ltrTableNames :: [Text], _ltrLastEvaluatedTableName :: Text} deriving (Eq, Read, Show)

-- | 'ListTablesResponse' smart constructor.
listTablesResponse :: Text -> ListTablesResponse
listTablesResponse pLastEvaluatedTableName = ListTablesResponse'{_ltrTableNames = mempty, _ltrLastEvaluatedTableName = pLastEvaluatedTableName};

-- | The names of the tables associated with the current account at the
-- current endpoint. The maximum size of this array is 100.
--
-- If /LastEvaluatedTableName/ also appears in the output, you can use this
-- value as the /ExclusiveStartTableName/ parameter in a subsequent
-- /ListTables/ request and obtain the next page of results.
ltrTableNames :: Lens' ListTablesResponse [Text]
ltrTableNames = lens _ltrTableNames (\ s a -> s{_ltrTableNames = a});

-- | The name of the last table in the current page of results. Use this
-- value as the /ExclusiveStartTableName/ in a new request to obtain the
-- next page of results, until all the table names are returned.
--
-- If you do not receive a /LastEvaluatedTableName/ value in the response,
-- this means that there are no more table names to be retrieved.
ltrLastEvaluatedTableName :: Lens' ListTablesResponse Text
ltrLastEvaluatedTableName = lens _ltrLastEvaluatedTableName (\ s a -> s{_ltrLastEvaluatedTableName = a});
