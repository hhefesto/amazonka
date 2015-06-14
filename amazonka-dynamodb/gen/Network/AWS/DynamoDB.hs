-- Module      : Network.AWS.DynamoDB
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

-- | Amazon DynamoDB
--
-- __Overview__
--
-- This is the Amazon DynamoDB API Reference. This guide provides
-- descriptions and samples of the low-level DynamoDB API. For information
-- about DynamoDB application development, see the
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ Amazon DynamoDB Developer Guide>.
--
-- Instead of making the requests to the low-level DynamoDB API directly
-- from your application, we recommend that you use the AWS Software
-- Development Kits (SDKs). The easy-to-use libraries in the AWS SDKs make
-- it unnecessary to call the low-level DynamoDB API directly from your
-- application. The libraries take care of request authentication,
-- serialization, and connection management. For more information, see
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/UsingAWSSDK.html Using the AWS SDKs with DynamoDB>
-- in the /Amazon DynamoDB Developer Guide/.
--
-- If you decide to code against the low-level DynamoDB API directly, you
-- will need to write the necessary code to authenticate your requests. For
-- more information on signing your requests, see
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/API.html Using the DynamoDB API>
-- in the /Amazon DynamoDB Developer Guide/.
--
-- The following are short descriptions of each low-level API action,
-- organized by function.
--
-- __Managing Tables__
--
-- -   /CreateTable/ - Creates a table with user-specified provisioned
--     throughput settings. You must designate one attribute as the hash
--     primary key for the table; you can optionally designate a second
--     attribute as the range primary key. DynamoDB creates indexes on
--     these key attributes for fast data access. Optionally, you can
--     create one or more secondary indexes, which provide fast data access
--     using non-key attributes.
--
-- -   /DescribeTable/ - Returns metadata for a table, such as table size,
--     status, and index information.
--
-- -   /UpdateTable/ - Modifies the provisioned throughput settings for a
--     table. Optionally, you can modify the provisioned throughput
--     settings for global secondary indexes on the table.
--
-- -   /ListTables/ - Returns a list of all tables associated with the
--     current AWS account and endpoint.
--
-- -   /DeleteTable/ - Deletes a table and all of its indexes.
--
-- For conceptual information about managing tables, see
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithTables.html Working with Tables>
-- in the /Amazon DynamoDB Developer Guide/.
--
-- __Reading Data__
--
-- -   /GetItem/ - Returns a set of attributes for the item that has a
--     given primary key. By default, /GetItem/ performs an eventually
--     consistent read; however, applications can request a strongly
--     consistent read instead.
--
-- -   /BatchGetItem/ - Performs multiple /GetItem/ requests for data items
--     using their primary keys, from one table or multiple tables. The
--     response from /BatchGetItem/ has a size limit of 16 MB and returns a
--     maximum of 100 items. Both eventually consistent and strongly
--     consistent reads can be used.
--
-- -   /Query/ - Returns one or more items from a table or a secondary
--     index. You must provide a specific hash key value. You can narrow
--     the scope of the query using comparison operators against a range
--     key value, or on the index key. /Query/ supports either eventual or
--     strong consistency. A single response has a size limit of 1 MB.
--
-- -   /Scan/ - Reads every item in a table; the result set is eventually
--     consistent. You can limit the number of items returned by filtering
--     the data attributes, using conditional expressions. /Scan/ can be
--     used to enable ad-hoc querying of a table against non-key
--     attributes; however, since this is a full table scan without using
--     an index, /Scan/ should not be used for any application query use
--     case that requires predictable performance.
--
-- For conceptual information about reading data, see
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html Working with Items>
-- and
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html Query and Scan Operations>
-- in the /Amazon DynamoDB Developer Guide/.
--
-- __Modifying Data__
--
-- -   /PutItem/ - Creates a new item, or replaces an existing item with a
--     new item (including all the attributes). By default, if an item in
--     the table already exists with the same primary key, the new item
--     completely replaces the existing item. You can use conditional
--     operators to replace an item only if its attribute values match
--     certain conditions, or to insert a new item only if that item
--     doesn\'t already exist.
--
-- -   /UpdateItem/ - Modifies the attributes of an existing item. You can
--     also use conditional operators to perform an update only if the
--     item\'s attribute values match certain conditions.
--
-- -   /DeleteItem/ - Deletes an item in a table by primary key. You can
--     use conditional operators to perform a delete an item only if the
--     item\'s attribute values match certain conditions.
--
-- -   /BatchWriteItem/ - Performs multiple /PutItem/ and /DeleteItem/
--     requests across multiple tables in a single request. A failure of
--     any request(s) in the batch will not cause the entire
--     /BatchWriteItem/ operation to fail. Supports batches of up to 25
--     items to put or delete, with a maximum total request size of 16 MB.
--
-- For conceptual information about modifying data, see
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/WorkingWithItems.html Working with Items>
-- and
-- <http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/QueryAndScan.html Query and Scan Operations>
-- in the /Amazon DynamoDB Developer Guide/.
module Network.AWS.DynamoDB
    ( module Export
    ) where

import Network.AWS.DynamoDB.BatchGetItem as Export
import Network.AWS.DynamoDB.BatchWriteItem as Export
import Network.AWS.DynamoDB.CreateTable as Export
import Network.AWS.DynamoDB.DeleteItem as Export
import Network.AWS.DynamoDB.DeleteTable as Export
import Network.AWS.DynamoDB.DescribeTable as Export
import Network.AWS.DynamoDB.GetItem as Export
import Network.AWS.DynamoDB.ListTables as Export
import Network.AWS.DynamoDB.PutItem as Export
import Network.AWS.DynamoDB.Query as Export
import Network.AWS.DynamoDB.Scan as Export
import Network.AWS.DynamoDB.Types as Export
import Network.AWS.DynamoDB.UpdateItem as Export
import Network.AWS.DynamoDB.UpdateTable as Export
import Network.AWS.DynamoDB.Waiters as Export
