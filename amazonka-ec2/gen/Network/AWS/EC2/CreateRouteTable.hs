{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.CreateRouteTable
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

-- | Creates a route table for the specified VPC. After you create a route
-- table, you can add routes and associate the table with a subnet.
--
-- For more information about route tables, see
-- <http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Route_Tables.html Route Tables>
-- in the /Amazon Virtual Private Cloud User Guide/.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-CreateRouteTable.html>
module Network.AWS.EC2.CreateRouteTable
    (
    -- * Request
      CreateRouteTable
    -- ** Request constructor
    , createRouteTable
    -- ** Request lenses
    , crtDryRun
    , crtVPCId

    -- * Response
    , CreateRouteTableResponse
    -- ** Response constructor
    , createRouteTableResponse
    -- ** Response lenses
    , crtrRouteTable
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.EC2.Types

-- | /See:/ 'createRouteTable' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crtDryRun'
--
-- * 'crtVPCId'
data CreateRouteTable = CreateRouteTable'{_crtDryRun :: Maybe Bool, _crtVPCId :: Text} deriving (Eq, Read, Show)

-- | 'CreateRouteTable' smart constructor.
createRouteTable :: Text -> CreateRouteTable
createRouteTable pVPCId = CreateRouteTable'{_crtDryRun = Nothing, _crtVPCId = pVPCId};

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
crtDryRun :: Lens' CreateRouteTable (Maybe Bool)
crtDryRun = lens _crtDryRun (\ s a -> s{_crtDryRun = a});

-- | The ID of the VPC.
crtVPCId :: Lens' CreateRouteTable Text
crtVPCId = lens _crtVPCId (\ s a -> s{_crtVPCId = a});

instance AWSRequest CreateRouteTable where
        type Sv CreateRouteTable = EC2
        type Rs CreateRouteTable = CreateRouteTableResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 CreateRouteTableResponse' <$> x .@? "routeTable")

instance ToHeaders CreateRouteTable where
        toHeaders = const mempty

instance ToPath CreateRouteTable where
        toPath = const "/"

instance ToQuery CreateRouteTable where
        toQuery CreateRouteTable'{..}
          = mconcat
              ["Action" =: ("CreateRouteTable" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _crtDryRun, "VpcId" =: _crtVPCId]

-- | /See:/ 'createRouteTableResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crtrRouteTable'
newtype CreateRouteTableResponse = CreateRouteTableResponse'{_crtrRouteTable :: Maybe RouteTable} deriving (Eq, Read, Show)

-- | 'CreateRouteTableResponse' smart constructor.
createRouteTableResponse :: CreateRouteTableResponse
createRouteTableResponse = CreateRouteTableResponse'{_crtrRouteTable = Nothing};

-- | Information about the route table.
crtrRouteTable :: Lens' CreateRouteTableResponse (Maybe RouteTable)
crtrRouteTable = lens _crtrRouteTable (\ s a -> s{_crtrRouteTable = a});
