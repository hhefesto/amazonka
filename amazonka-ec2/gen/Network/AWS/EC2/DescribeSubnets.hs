{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.EC2.DescribeSubnets
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

-- | Describes one or more of your subnets.
--
-- For more information about subnets, see
-- <http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Subnets.html Your VPC and Subnets>
-- in the /Amazon Virtual Private Cloud User Guide/.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeSubnets.html>
module Network.AWS.EC2.DescribeSubnets
    (
    -- * Request
      DescribeSubnets
    -- ** Request constructor
    , describeSubnets
    -- ** Request lenses
    , dsSubnetIds
    , dsFilters
    , dsDryRun

    -- * Response
    , DescribeSubnetsResponse
    -- ** Response constructor
    , describeSubnetsResponse
    -- ** Response lenses
    , dsrSubnets
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.EC2.Types

-- | /See:/ 'describeSubnets' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsSubnetIds'
--
-- * 'dsFilters'
--
-- * 'dsDryRun'
data DescribeSubnets = DescribeSubnets'{_dsSubnetIds :: [Text], _dsFilters :: [Filter], _dsDryRun :: Maybe Bool} deriving (Eq, Read, Show)

-- | 'DescribeSubnets' smart constructor.
describeSubnets :: DescribeSubnets
describeSubnets = DescribeSubnets'{_dsSubnetIds = mempty, _dsFilters = mempty, _dsDryRun = Nothing};

-- | One or more subnet IDs.
--
-- Default: Describes all your subnets.
dsSubnetIds :: Lens' DescribeSubnets [Text]
dsSubnetIds = lens _dsSubnetIds (\ s a -> s{_dsSubnetIds = a});

-- | One or more filters.
--
-- -   @availabilityZone@ - The Availability Zone for the subnet. You can
--     also use @availability-zone@ as the filter name.
--
-- -   @available-ip-address-count@ - The number of IP addresses in the
--     subnet that are available.
--
-- -   @cidrBlock@ - The CIDR block of the subnet. The CIDR block you
--     specify must exactly match the subnet\'s CIDR block for information
--     to be returned for the subnet. You can also use @cidr@ or
--     @cidr-block@ as the filter names.
--
-- -   @defaultForAz@ - Indicates whether this is the default subnet for
--     the Availability Zone. You can also use @default-for-az@ as the
--     filter name.
--
-- -   @state@ - The state of the subnet (@pending@ | @available@).
--
-- -   @subnet-id@ - The ID of the subnet.
--
-- -   @tag@:/key/=/value/ - The key\/value combination of a tag assigned
--     to the resource.
--
-- -   @tag-key@ - The key of a tag assigned to the resource. This filter
--     is independent of the @tag-value@ filter. For example, if you use
--     both the filter \"tag-key=Purpose\" and the filter \"tag-value=X\",
--     you get any resources assigned both the tag key Purpose (regardless
--     of what the tag\'s value is), and the tag value X (regardless of
--     what the tag\'s key is). If you want to list only resources where
--     Purpose is X, see the @tag@:/key/=/value/ filter.
--
-- -   @tag-value@ - The value of a tag assigned to the resource. This
--     filter is independent of the @tag-key@ filter.
--
-- -   @vpc-id@ - The ID of the VPC for the subnet.
--
dsFilters :: Lens' DescribeSubnets [Filter]
dsFilters = lens _dsFilters (\ s a -> s{_dsFilters = a});

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dsDryRun :: Lens' DescribeSubnets (Maybe Bool)
dsDryRun = lens _dsDryRun (\ s a -> s{_dsDryRun = a});

instance AWSRequest DescribeSubnets where
        type Sv DescribeSubnets = EC2
        type Rs DescribeSubnets = DescribeSubnetsResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 DescribeSubnetsResponse' <$> parseXMLList "item" x)

instance ToHeaders DescribeSubnets where
        toHeaders = const mempty

instance ToPath DescribeSubnets where
        toPath = const "/"

instance ToQuery DescribeSubnets where
        toQuery DescribeSubnets'{..}
          = mconcat
              ["Action" =: ("DescribeSubnets" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "SubnetId" =: _dsSubnetIds, "Filter" =: _dsFilters,
               "DryRun" =: _dsDryRun]

-- | /See:/ 'describeSubnetsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsrSubnets'
newtype DescribeSubnetsResponse = DescribeSubnetsResponse'{_dsrSubnets :: [Subnet]} deriving (Eq, Read, Show)

-- | 'DescribeSubnetsResponse' smart constructor.
describeSubnetsResponse :: DescribeSubnetsResponse
describeSubnetsResponse = DescribeSubnetsResponse'{_dsrSubnets = mempty};

-- | Information about one or more subnets.
dsrSubnets :: Lens' DescribeSubnetsResponse [Subnet]
dsrSubnets = lens _dsrSubnets (\ s a -> s{_dsrSubnets = a});
