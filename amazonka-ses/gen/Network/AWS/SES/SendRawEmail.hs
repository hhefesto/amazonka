{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.SES.SendRawEmail
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

-- | Sends an email message, with header and content specified by the client.
-- The @SendRawEmail@ action is useful for sending multipart MIME emails.
-- The raw text of the message must comply with Internet email standards;
-- otherwise, the message cannot be sent.
--
-- You can only send email from verified email addresses and domains. If
-- your account is still in the Amazon SES sandbox, you must also verify
-- every recipient email address except for the recipients provided by the
-- Amazon SES mailbox simulator. For more information, go to the
-- <http://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-addresses-and-domains.html Amazon SES Developer Guide>.
--
-- The total size of the message cannot exceed 10 MB. This includes any
-- attachments that are part of the message.
--
-- Amazon SES has a limit on the total number of recipients per message:
-- The combined number of To:, CC: and BCC: email addresses cannot exceed
-- 50. If you need to send an email message to a larger audience, you can
-- divide your recipient list into groups of 50 or fewer, and then call
-- Amazon SES repeatedly to send the message to each group.
--
-- The To:, CC:, and BCC: headers in the raw message can contain a group
-- list. Note that each recipient in a group list counts towards the
-- 50-recipient limit.
--
-- For every message that you send, the total number of recipients (To:,
-- CC: and BCC:) is counted against your /sending quota/ - the maximum
-- number of emails you can send in a 24-hour period. For information about
-- your sending quota, go to the
-- <http://docs.aws.amazon.com/ses/latest/DeveloperGuide/manage-sending-limits.html Amazon SES Developer Guide>.
--
-- <http://docs.aws.amazon.com/ses/latest/APIReference/API_SendRawEmail.html>
module Network.AWS.SES.SendRawEmail
    (
    -- * Request
      SendRawEmail
    -- ** Request constructor
    , sendRawEmail
    -- ** Request lenses
    , sreDestinations
    , sreSource
    , sreRawMessage

    -- * Response
    , SendRawEmailResponse
    -- ** Response constructor
    , sendRawEmailResponse
    -- ** Response lenses
    , srerMessageId
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.SES.Types

-- | /See:/ 'sendRawEmail' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sreDestinations'
--
-- * 'sreSource'
--
-- * 'sreRawMessage'
data SendRawEmail = SendRawEmail'{_sreDestinations :: [Text], _sreSource :: Maybe Text, _sreRawMessage :: RawMessage} deriving (Eq, Read, Show)

-- | 'SendRawEmail' smart constructor.
sendRawEmail :: RawMessage -> SendRawEmail
sendRawEmail pRawMessage = SendRawEmail'{_sreDestinations = mempty, _sreSource = Nothing, _sreRawMessage = pRawMessage};

-- | A list of destinations for the message, consisting of To:, CC:, and BCC:
-- addresses.
sreDestinations :: Lens' SendRawEmail [Text]
sreDestinations = lens _sreDestinations (\ s a -> s{_sreDestinations = a});

-- | The identity\'s email address. If you do not provide a value for this
-- parameter, you must specify a \"From\" address in the raw text of the
-- message. (You can also specify both.)
--
-- By default, the string must be 7-bit ASCII. If the text must contain any
-- other characters, then you must use MIME encoded-word syntax (RFC 2047)
-- instead of a literal string. MIME encoded-word syntax uses the following
-- form: @=?charset?encoding?encoded-text?=@. For more information, see
-- <http://tools.ietf.org/html/rfc2047 RFC 2047>.
--
-- If you specify the @Source@ parameter and have feedback forwarding
-- enabled, then bounces and complaints will be sent to this email address.
-- This takes precedence over any /Return-Path/ header that you might
-- include in the raw text of the message.
sreSource :: Lens' SendRawEmail (Maybe Text)
sreSource = lens _sreSource (\ s a -> s{_sreSource = a});

-- | The raw text of the message. The client is responsible for ensuring the
-- following:
--
-- -   Message must contain a header and a body, separated by a blank line.
-- -   All required header fields must be present.
-- -   Each part of a multipart MIME message must be formatted properly.
-- -   MIME content types must be among those supported by Amazon SES. For
--     more information, go to the
--     <http://docs.aws.amazon.com/ses/latest/DeveloperGuide/mime-types.html Amazon SES Developer Guide>.
-- -   Content must be base64-encoded, if MIME requires it.
sreRawMessage :: Lens' SendRawEmail RawMessage
sreRawMessage = lens _sreRawMessage (\ s a -> s{_sreRawMessage = a});

instance AWSRequest SendRawEmail where
        type Sv SendRawEmail = SES
        type Rs SendRawEmail = SendRawEmailResponse
        request = post
        response
          = receiveXMLWrapper "SendRawEmailResult"
              (\ s h x ->
                 SendRawEmailResponse' <$> x .@ "MessageId")

instance ToHeaders SendRawEmail where
        toHeaders = const mempty

instance ToPath SendRawEmail where
        toPath = const "/"

instance ToQuery SendRawEmail where
        toQuery SendRawEmail'{..}
          = mconcat
              ["Action" =: ("SendRawEmail" :: ByteString),
               "Version" =: ("2010-12-01" :: ByteString),
               "Destinations" =: "member" =: _sreDestinations,
               "Source" =: _sreSource,
               "RawMessage" =: _sreRawMessage]

-- | /See:/ 'sendRawEmailResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'srerMessageId'
newtype SendRawEmailResponse = SendRawEmailResponse'{_srerMessageId :: Text} deriving (Eq, Read, Show)

-- | 'SendRawEmailResponse' smart constructor.
sendRawEmailResponse :: Text -> SendRawEmailResponse
sendRawEmailResponse pMessageId = SendRawEmailResponse'{_srerMessageId = pMessageId};

-- | The unique message identifier returned from the @SendRawEmail@ action.
srerMessageId :: Lens' SendRawEmailResponse Text
srerMessageId = lens _srerMessageId (\ s a -> s{_srerMessageId = a});
