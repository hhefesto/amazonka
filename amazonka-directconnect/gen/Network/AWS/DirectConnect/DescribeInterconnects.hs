{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.DirectConnect.DescribeInterconnects
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

-- | Returns a list of interconnects owned by the AWS account.
--
-- If an interconnect ID is provided, it will only return this particular
-- interconnect.
--
-- <http://docs.aws.amazon.com/directconnect/latest/APIReference/API_DescribeInterconnects.html>
module Network.AWS.DirectConnect.DescribeInterconnects
    (
    -- * Request
      DescribeInterconnects
    -- ** Request constructor
    , describeInterconnects
    -- ** Request lenses
    , diInterconnectId

    -- * Response
    , DescribeInterconnectsResponse
    -- ** Response constructor
    , describeInterconnectsResponse
    -- ** Response lenses
    , dirDescribeInterconnectsResponse
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.DirectConnect.Types

-- | /See:/ 'describeInterconnects' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'diInterconnectId'
newtype DescribeInterconnects = DescribeInterconnects'{_diInterconnectId :: Maybe Text} deriving (Eq, Read, Show)

-- | 'DescribeInterconnects' smart constructor.
describeInterconnects :: DescribeInterconnects
describeInterconnects = DescribeInterconnects'{_diInterconnectId = Nothing};

-- | FIXME: Undocumented member.
diInterconnectId :: Lens' DescribeInterconnects (Maybe Text)
diInterconnectId = lens _diInterconnectId (\ s a -> s{_diInterconnectId = a});

instance AWSRequest DescribeInterconnects where
        type Sv DescribeInterconnects = DirectConnect
        type Rs DescribeInterconnects =
             DescribeInterconnectsResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 DescribeInterconnectsResponse' <$>
                   x .?> "DescribeInterconnectsResponse" .!@ mempty)

instance ToHeaders DescribeInterconnects where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OvertureService.DescribeInterconnects" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeInterconnects where
        toJSON DescribeInterconnects'{..}
          = object ["interconnectId" .= _diInterconnectId]

instance ToPath DescribeInterconnects where
        toPath = const "/"

instance ToQuery DescribeInterconnects where
        toQuery = const mempty

-- | /See:/ 'describeInterconnectsResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dirDescribeInterconnectsResponse'
newtype DescribeInterconnectsResponse = DescribeInterconnectsResponse'{_dirDescribeInterconnectsResponse :: [Interconnect]} deriving (Eq, Read, Show)

-- | 'DescribeInterconnectsResponse' smart constructor.
describeInterconnectsResponse :: DescribeInterconnectsResponse
describeInterconnectsResponse = DescribeInterconnectsResponse'{_dirDescribeInterconnectsResponse = mempty};

-- | A list of interconnects.
dirDescribeInterconnectsResponse :: Lens' DescribeInterconnectsResponse [Interconnect]
dirDescribeInterconnectsResponse = lens _dirDescribeInterconnectsResponse (\ s a -> s{_dirDescribeInterconnectsResponse = a});
