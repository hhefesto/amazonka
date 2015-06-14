{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.S3.GetObjectTorrent
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

-- | Return torrent files from a bucket.
--
-- <http://docs.aws.amazon.com/AmazonS3/latest/API/GetObjectTorrent.html>
module Network.AWS.S3.GetObjectTorrent
    (
    -- * Request
      GetObjectTorrent
    -- ** Request constructor
    , getObjectTorrent
    -- ** Request lenses
    , gotRequestPayer
    , gotBucket
    , gotKey

    -- * Response
    , GetObjectTorrentResponse
    -- ** Response constructor
    , getObjectTorrentResponse
    -- ** Response lenses
    , gotrRequestCharged
    , gotrBody
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.S3.Types

-- | /See:/ 'getObjectTorrent' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gotRequestPayer'
--
-- * 'gotBucket'
--
-- * 'gotKey'
data GetObjectTorrent = GetObjectTorrent'{_gotRequestPayer :: Maybe RequestPayer, _gotBucket :: BucketName, _gotKey :: ObjectKey} deriving (Eq, Read, Show)

-- | 'GetObjectTorrent' smart constructor.
getObjectTorrent :: BucketName -> ObjectKey -> GetObjectTorrent
getObjectTorrent pBucket pKey = GetObjectTorrent'{_gotRequestPayer = Nothing, _gotBucket = pBucket, _gotKey = pKey};

-- | FIXME: Undocumented member.
gotRequestPayer :: Lens' GetObjectTorrent (Maybe RequestPayer)
gotRequestPayer = lens _gotRequestPayer (\ s a -> s{_gotRequestPayer = a});

-- | FIXME: Undocumented member.
gotBucket :: Lens' GetObjectTorrent BucketName
gotBucket = lens _gotBucket (\ s a -> s{_gotBucket = a});

-- | FIXME: Undocumented member.
gotKey :: Lens' GetObjectTorrent ObjectKey
gotKey = lens _gotKey (\ s a -> s{_gotKey = a});

instance AWSRequest GetObjectTorrent where
        type Sv GetObjectTorrent = S3
        type Rs GetObjectTorrent = GetObjectTorrentResponse
        request = get
        response
          = receiveBody
              (\ s h x ->
                 GetObjectTorrentResponse' <$>
                   h .#? "x-amz-request-charged" <*> pure x)

instance ToHeaders GetObjectTorrent where
        toHeaders GetObjectTorrent'{..}
          = mconcat ["x-amz-request-payer" =# _gotRequestPayer]

instance ToPath GetObjectTorrent where
        toPath GetObjectTorrent'{..}
          = mconcat
              ["/", toText _gotBucket, "/", toText _gotKey]

instance ToQuery GetObjectTorrent where
        toQuery = const (mconcat ["torrent"])

-- | /See:/ 'getObjectTorrentResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'gotrRequestCharged'
--
-- * 'gotrBody'
data GetObjectTorrentResponse = GetObjectTorrentResponse'{_gotrRequestCharged :: Maybe RequestCharged, _gotrBody :: RsBody} deriving Show

-- | 'GetObjectTorrentResponse' smart constructor.
getObjectTorrentResponse :: RsBody -> GetObjectTorrentResponse
getObjectTorrentResponse pBody = GetObjectTorrentResponse'{_gotrRequestCharged = Nothing, _gotrBody = pBody};

-- | FIXME: Undocumented member.
gotrRequestCharged :: Lens' GetObjectTorrentResponse (Maybe RequestCharged)
gotrRequestCharged = lens _gotrRequestCharged (\ s a -> s{_gotrRequestCharged = a});

-- | FIXME: Undocumented member.
gotrBody :: Lens' GetObjectTorrentResponse RsBody
gotrBody = lens _gotrBody (\ s a -> s{_gotrBody = a});
