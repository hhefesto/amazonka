{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}

-- Module      : Network.AWS.Config.Types
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

module Network.AWS.Config.Types
    (
    -- * Service
      Config
    -- ** Errors
    , JSONError

    -- * ChronologicalOrder
    , ChronologicalOrder (..)

    -- * ConfigExportDeliveryInfo
    , ConfigExportDeliveryInfo
    , configExportDeliveryInfo
    , cediLastErrorCode
    , cediLastAttemptTime
    , cediLastSuccessfulTime
    , cediLastStatus
    , cediLastErrorMessage

    -- * ConfigStreamDeliveryInfo
    , ConfigStreamDeliveryInfo
    , configStreamDeliveryInfo
    , csdiLastErrorCode
    , csdiLastStatusChangeTime
    , csdiLastStatus
    , csdiLastErrorMessage

    -- * ConfigurationItem
    , ConfigurationItem
    , configurationItem
    , ciResourceId
    , ciConfigurationStateId
    , ciResourceType
    , ciArn
    , ciResourceCreationTime
    , ciConfigurationItemStatus
    , ciAccountId
    , ciConfigurationItemCaptureTime
    , ciAvailabilityZone
    , ciRelationships
    , ciVersion
    , ciRelatedEvents
    , ciConfiguration
    , ciConfigurationItemMD5Hash
    , ciTags

    -- * ConfigurationItemStatus
    , ConfigurationItemStatus (..)

    -- * ConfigurationRecorder
    , ConfigurationRecorder
    , configurationRecorder
    , crRoleARN
    , crName

    -- * ConfigurationRecorderStatus
    , ConfigurationRecorderStatus
    , configurationRecorderStatus
    , crsLastErrorCode
    , crsLastStopTime
    , crsLastStatusChangeTime
    , crsRecording
    , crsLastStatus
    , crsLastErrorMessage
    , crsName
    , crsLastStartTime

    -- * DeliveryChannel
    , DeliveryChannel
    , deliveryChannel
    , dcS3KeyPrefix
    , dcSnsTopicARN
    , dcS3BucketName
    , dcName

    -- * DeliveryChannelStatus
    , DeliveryChannelStatus
    , deliveryChannelStatus
    , dcsConfigStreamDeliveryInfo
    , dcsConfigSnapshotDeliveryInfo
    , dcsConfigHistoryDeliveryInfo
    , dcsName

    -- * DeliveryStatus
    , DeliveryStatus (..)

    -- * RecorderStatus
    , RecorderStatus (..)

    -- * Relationship
    , Relationship
    , relationship
    , relResourceId
    , relResourceType
    , relRelationshipName

    -- * ResourceType
    , ResourceType (..)
    ) where

import Network.AWS.Prelude
import Network.AWS.Sign.V4

-- | Version @2014-11-12@ of the Amazon Config SDK.
data Config

instance AWSService Config where
    type Sg Config = V4
    type Er Config = JSONError

    service = service'
      where
        service' :: Service Config
        service' = Service
            { _svcAbbrev  = "Config"
            , _svcPrefix  = "config"
            , _svcVersion = "2014-11-12"
            , _svcHandle  = handle
            , _svcRetry   = retry
            }

        handle :: Status
               -> Maybe (LazyByteString -> ServiceError JSONError)
        handle = jsonError statusSuccess service'

        retry :: Retry Config
        retry = undefined

        check :: Status
              -> JSONError
              -> Bool
        check (statusCode -> s) (awsErrorCode -> e) = undefined

data ChronologicalOrder = Forward | Reverse deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText ChronologicalOrder where
    parser = takeLowerText >>= \case
        "Forward" -> pure Forward
        "Reverse" -> pure Reverse
        e -> fail ("Failure parsing ChronologicalOrder from " ++ show e)

instance ToText ChronologicalOrder where
    toText = \case
        Forward -> "Forward"
        Reverse -> "Reverse"

instance Hashable ChronologicalOrder
instance ToQuery ChronologicalOrder
instance ToHeader ChronologicalOrder

instance ToJSON ChronologicalOrder where
    toJSON = toJSONText

-- | /See:/ 'configExportDeliveryInfo' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cediLastErrorCode'
--
-- * 'cediLastAttemptTime'
--
-- * 'cediLastSuccessfulTime'
--
-- * 'cediLastStatus'
--
-- * 'cediLastErrorMessage'
data ConfigExportDeliveryInfo = ConfigExportDeliveryInfo'{_cediLastErrorCode :: Maybe Text, _cediLastAttemptTime :: Maybe POSIX, _cediLastSuccessfulTime :: Maybe POSIX, _cediLastStatus :: Maybe DeliveryStatus, _cediLastErrorMessage :: Maybe Text} deriving (Eq, Read, Show)

-- | 'ConfigExportDeliveryInfo' smart constructor.
configExportDeliveryInfo :: ConfigExportDeliveryInfo
configExportDeliveryInfo = ConfigExportDeliveryInfo'{_cediLastErrorCode = Nothing, _cediLastAttemptTime = Nothing, _cediLastSuccessfulTime = Nothing, _cediLastStatus = Nothing, _cediLastErrorMessage = Nothing};

-- | The error code from the last attempted delivery.
cediLastErrorCode :: Lens' ConfigExportDeliveryInfo (Maybe Text)
cediLastErrorCode = lens _cediLastErrorCode (\ s a -> s{_cediLastErrorCode = a});

-- | The time of the last attempted delivery.
cediLastAttemptTime :: Lens' ConfigExportDeliveryInfo (Maybe UTCTime)
cediLastAttemptTime = lens _cediLastAttemptTime (\ s a -> s{_cediLastAttemptTime = a}) . mapping _Time;

-- | The time of the last successful delivery.
cediLastSuccessfulTime :: Lens' ConfigExportDeliveryInfo (Maybe UTCTime)
cediLastSuccessfulTime = lens _cediLastSuccessfulTime (\ s a -> s{_cediLastSuccessfulTime = a}) . mapping _Time;

-- | Status of the last attempted delivery.
cediLastStatus :: Lens' ConfigExportDeliveryInfo (Maybe DeliveryStatus)
cediLastStatus = lens _cediLastStatus (\ s a -> s{_cediLastStatus = a});

-- | The error message from the last attempted delivery.
cediLastErrorMessage :: Lens' ConfigExportDeliveryInfo (Maybe Text)
cediLastErrorMessage = lens _cediLastErrorMessage (\ s a -> s{_cediLastErrorMessage = a});

instance FromJSON ConfigExportDeliveryInfo where
        parseJSON
          = withObject "ConfigExportDeliveryInfo"
              (\ x ->
                 ConfigExportDeliveryInfo' <$>
                   x .:? "lastErrorCode" <*> x .:? "lastAttemptTime" <*>
                     x .:? "lastSuccessfulTime"
                     <*> x .:? "lastStatus"
                     <*> x .:? "lastErrorMessage")

-- | /See:/ 'configStreamDeliveryInfo' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'csdiLastErrorCode'
--
-- * 'csdiLastStatusChangeTime'
--
-- * 'csdiLastStatus'
--
-- * 'csdiLastErrorMessage'
data ConfigStreamDeliveryInfo = ConfigStreamDeliveryInfo'{_csdiLastErrorCode :: Maybe Text, _csdiLastStatusChangeTime :: Maybe POSIX, _csdiLastStatus :: Maybe DeliveryStatus, _csdiLastErrorMessage :: Maybe Text} deriving (Eq, Read, Show)

-- | 'ConfigStreamDeliveryInfo' smart constructor.
configStreamDeliveryInfo :: ConfigStreamDeliveryInfo
configStreamDeliveryInfo = ConfigStreamDeliveryInfo'{_csdiLastErrorCode = Nothing, _csdiLastStatusChangeTime = Nothing, _csdiLastStatus = Nothing, _csdiLastErrorMessage = Nothing};

-- | The error code from the last attempted delivery.
csdiLastErrorCode :: Lens' ConfigStreamDeliveryInfo (Maybe Text)
csdiLastErrorCode = lens _csdiLastErrorCode (\ s a -> s{_csdiLastErrorCode = a});

-- | The time from the last status change.
csdiLastStatusChangeTime :: Lens' ConfigStreamDeliveryInfo (Maybe UTCTime)
csdiLastStatusChangeTime = lens _csdiLastStatusChangeTime (\ s a -> s{_csdiLastStatusChangeTime = a}) . mapping _Time;

-- | Status of the last attempted delivery.
csdiLastStatus :: Lens' ConfigStreamDeliveryInfo (Maybe DeliveryStatus)
csdiLastStatus = lens _csdiLastStatus (\ s a -> s{_csdiLastStatus = a});

-- | The error message from the last attempted delivery.
csdiLastErrorMessage :: Lens' ConfigStreamDeliveryInfo (Maybe Text)
csdiLastErrorMessage = lens _csdiLastErrorMessage (\ s a -> s{_csdiLastErrorMessage = a});

instance FromJSON ConfigStreamDeliveryInfo where
        parseJSON
          = withObject "ConfigStreamDeliveryInfo"
              (\ x ->
                 ConfigStreamDeliveryInfo' <$>
                   x .:? "lastErrorCode" <*>
                     x .:? "lastStatusChangeTime"
                     <*> x .:? "lastStatus"
                     <*> x .:? "lastErrorMessage")

-- | /See:/ 'configurationItem' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ciResourceId'
--
-- * 'ciConfigurationStateId'
--
-- * 'ciResourceType'
--
-- * 'ciArn'
--
-- * 'ciResourceCreationTime'
--
-- * 'ciConfigurationItemStatus'
--
-- * 'ciAccountId'
--
-- * 'ciConfigurationItemCaptureTime'
--
-- * 'ciAvailabilityZone'
--
-- * 'ciRelationships'
--
-- * 'ciVersion'
--
-- * 'ciRelatedEvents'
--
-- * 'ciConfiguration'
--
-- * 'ciConfigurationItemMD5Hash'
--
-- * 'ciTags'
data ConfigurationItem = ConfigurationItem'{_ciResourceId :: Maybe Text, _ciConfigurationStateId :: Maybe Text, _ciResourceType :: Maybe ResourceType, _ciArn :: Maybe Text, _ciResourceCreationTime :: Maybe POSIX, _ciConfigurationItemStatus :: Maybe ConfigurationItemStatus, _ciAccountId :: Maybe Text, _ciConfigurationItemCaptureTime :: Maybe POSIX, _ciAvailabilityZone :: Maybe Text, _ciRelationships :: [Relationship], _ciVersion :: Maybe Text, _ciRelatedEvents :: [Text], _ciConfiguration :: Maybe Text, _ciConfigurationItemMD5Hash :: Maybe Text, _ciTags :: HashMap Text Text} deriving (Eq, Read, Show)

-- | 'ConfigurationItem' smart constructor.
configurationItem :: ConfigurationItem
configurationItem = ConfigurationItem'{_ciResourceId = Nothing, _ciConfigurationStateId = Nothing, _ciResourceType = Nothing, _ciArn = Nothing, _ciResourceCreationTime = Nothing, _ciConfigurationItemStatus = Nothing, _ciAccountId = Nothing, _ciConfigurationItemCaptureTime = Nothing, _ciAvailabilityZone = Nothing, _ciRelationships = mempty, _ciVersion = Nothing, _ciRelatedEvents = mempty, _ciConfiguration = Nothing, _ciConfigurationItemMD5Hash = Nothing, _ciTags = mempty};

-- | The ID of the resource (for example., @sg-xxxxxx@).
ciResourceId :: Lens' ConfigurationItem (Maybe Text)
ciResourceId = lens _ciResourceId (\ s a -> s{_ciResourceId = a});

-- | An identifier that indicates the ordering of the configuration items of
-- a resource.
ciConfigurationStateId :: Lens' ConfigurationItem (Maybe Text)
ciConfigurationStateId = lens _ciConfigurationStateId (\ s a -> s{_ciConfigurationStateId = a});

-- | The type of AWS resource.
ciResourceType :: Lens' ConfigurationItem (Maybe ResourceType)
ciResourceType = lens _ciResourceType (\ s a -> s{_ciResourceType = a});

-- | The Amazon Resource Name (ARN) of the resource.
ciArn :: Lens' ConfigurationItem (Maybe Text)
ciArn = lens _ciArn (\ s a -> s{_ciArn = a});

-- | The time stamp when the resource was created.
ciResourceCreationTime :: Lens' ConfigurationItem (Maybe UTCTime)
ciResourceCreationTime = lens _ciResourceCreationTime (\ s a -> s{_ciResourceCreationTime = a}) . mapping _Time;

-- | The configuration item status.
ciConfigurationItemStatus :: Lens' ConfigurationItem (Maybe ConfigurationItemStatus)
ciConfigurationItemStatus = lens _ciConfigurationItemStatus (\ s a -> s{_ciConfigurationItemStatus = a});

-- | The 12 digit AWS account ID associated with the resource.
ciAccountId :: Lens' ConfigurationItem (Maybe Text)
ciAccountId = lens _ciAccountId (\ s a -> s{_ciAccountId = a});

-- | The time when the configuration recording was initiated.
ciConfigurationItemCaptureTime :: Lens' ConfigurationItem (Maybe UTCTime)
ciConfigurationItemCaptureTime = lens _ciConfigurationItemCaptureTime (\ s a -> s{_ciConfigurationItemCaptureTime = a}) . mapping _Time;

-- | The Availability Zone associated with the resource.
ciAvailabilityZone :: Lens' ConfigurationItem (Maybe Text)
ciAvailabilityZone = lens _ciAvailabilityZone (\ s a -> s{_ciAvailabilityZone = a});

-- | A list of related AWS resources.
ciRelationships :: Lens' ConfigurationItem [Relationship]
ciRelationships = lens _ciRelationships (\ s a -> s{_ciRelationships = a});

-- | The version number of the resource configuration.
ciVersion :: Lens' ConfigurationItem (Maybe Text)
ciVersion = lens _ciVersion (\ s a -> s{_ciVersion = a});

-- | A list of CloudTrail event IDs.
--
-- A populated field indicates that the current configuration was initiated
-- by the events recorded in the CloudTrail log. For more information about
-- CloudTrail, see
-- <http://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html What is AWS CloudTrail?>.
--
-- An empty field indicates that the current configuration was not
-- initiated by any event.
ciRelatedEvents :: Lens' ConfigurationItem [Text]
ciRelatedEvents = lens _ciRelatedEvents (\ s a -> s{_ciRelatedEvents = a});

-- | The description of the resource configuration.
ciConfiguration :: Lens' ConfigurationItem (Maybe Text)
ciConfiguration = lens _ciConfiguration (\ s a -> s{_ciConfiguration = a});

-- | Unique MD5 hash that represents the configuration item\'s state.
--
-- You can use MD5 hash to compare the states of two or more configuration
-- items that are associated with the same resource.
ciConfigurationItemMD5Hash :: Lens' ConfigurationItem (Maybe Text)
ciConfigurationItemMD5Hash = lens _ciConfigurationItemMD5Hash (\ s a -> s{_ciConfigurationItemMD5Hash = a});

-- | A mapping of key value tags associated with the resource.
ciTags :: Lens' ConfigurationItem (HashMap Text Text)
ciTags = lens _ciTags (\ s a -> s{_ciTags = a}) . _Coerce;

instance FromJSON ConfigurationItem where
        parseJSON
          = withObject "ConfigurationItem"
              (\ x ->
                 ConfigurationItem' <$>
                   x .:? "resourceId" <*> x .:? "configurationStateId"
                     <*> x .:? "resourceType"
                     <*> x .:? "arn"
                     <*> x .:? "resourceCreationTime"
                     <*> x .:? "configurationItemStatus"
                     <*> x .:? "accountId"
                     <*> x .:? "configurationItemCaptureTime"
                     <*> x .:? "availabilityZone"
                     <*> x .:? "relationships" .!= mempty
                     <*> x .:? "version"
                     <*> x .:? "relatedEvents" .!= mempty
                     <*> x .:? "configuration"
                     <*> x .:? "configurationItemMD5Hash"
                     <*> x .:? "tags" .!= mempty)

data ConfigurationItemStatus = OK | Discovered | Deleted | Failed deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText ConfigurationItemStatus where
    parser = takeLowerText >>= \case
        "Deleted" -> pure Deleted
        "Discovered" -> pure Discovered
        "Failed" -> pure Failed
        "Ok" -> pure OK
        e -> fail ("Failure parsing ConfigurationItemStatus from " ++ show e)

instance ToText ConfigurationItemStatus where
    toText = \case
        Deleted -> "Deleted"
        Discovered -> "Discovered"
        Failed -> "Failed"
        OK -> "Ok"

instance Hashable ConfigurationItemStatus
instance ToQuery ConfigurationItemStatus
instance ToHeader ConfigurationItemStatus

instance FromJSON ConfigurationItemStatus where
    parseJSON = parseJSONText "ConfigurationItemStatus"

-- | /See:/ 'configurationRecorder' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crRoleARN'
--
-- * 'crName'
data ConfigurationRecorder = ConfigurationRecorder'{_crRoleARN :: Maybe Text, _crName :: Text} deriving (Eq, Read, Show)

-- | 'ConfigurationRecorder' smart constructor.
configurationRecorder :: Text -> ConfigurationRecorder
configurationRecorder pName = ConfigurationRecorder'{_crRoleARN = Nothing, _crName = pName};

-- | Amazon Resource Name (ARN) of the IAM role used to describe the AWS
-- resources associated with the account.
crRoleARN :: Lens' ConfigurationRecorder (Maybe Text)
crRoleARN = lens _crRoleARN (\ s a -> s{_crRoleARN = a});

-- | The name of the recorder. By default, AWS Config automatically assigns
-- the name \"default\" when creating the configuration recorder. You
-- cannot change the assigned name.
crName :: Lens' ConfigurationRecorder Text
crName = lens _crName (\ s a -> s{_crName = a});

instance FromJSON ConfigurationRecorder where
        parseJSON
          = withObject "ConfigurationRecorder"
              (\ x ->
                 ConfigurationRecorder' <$>
                   x .:? "roleARN" <*> x .: "name")

instance ToJSON ConfigurationRecorder where
        toJSON ConfigurationRecorder'{..}
          = object ["roleARN" .= _crRoleARN, "name" .= _crName]

-- | /See:/ 'configurationRecorderStatus' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'crsLastErrorCode'
--
-- * 'crsLastStopTime'
--
-- * 'crsLastStatusChangeTime'
--
-- * 'crsRecording'
--
-- * 'crsLastStatus'
--
-- * 'crsLastErrorMessage'
--
-- * 'crsName'
--
-- * 'crsLastStartTime'
data ConfigurationRecorderStatus = ConfigurationRecorderStatus'{_crsLastErrorCode :: Maybe Text, _crsLastStopTime :: Maybe POSIX, _crsLastStatusChangeTime :: Maybe POSIX, _crsRecording :: Maybe Bool, _crsLastStatus :: Maybe RecorderStatus, _crsLastErrorMessage :: Maybe Text, _crsName :: Maybe Text, _crsLastStartTime :: Maybe POSIX} deriving (Eq, Read, Show)

-- | 'ConfigurationRecorderStatus' smart constructor.
configurationRecorderStatus :: ConfigurationRecorderStatus
configurationRecorderStatus = ConfigurationRecorderStatus'{_crsLastErrorCode = Nothing, _crsLastStopTime = Nothing, _crsLastStatusChangeTime = Nothing, _crsRecording = Nothing, _crsLastStatus = Nothing, _crsLastErrorMessage = Nothing, _crsName = Nothing, _crsLastStartTime = Nothing};

-- | The error code indicating that the recording failed.
crsLastErrorCode :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsLastErrorCode = lens _crsLastErrorCode (\ s a -> s{_crsLastErrorCode = a});

-- | The time the recorder was last stopped.
crsLastStopTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStopTime = lens _crsLastStopTime (\ s a -> s{_crsLastStopTime = a}) . mapping _Time;

-- | The time when the status was last changed.
crsLastStatusChangeTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStatusChangeTime = lens _crsLastStatusChangeTime (\ s a -> s{_crsLastStatusChangeTime = a}) . mapping _Time;

-- | Specifies whether the recorder is currently recording or not.
crsRecording :: Lens' ConfigurationRecorderStatus (Maybe Bool)
crsRecording = lens _crsRecording (\ s a -> s{_crsRecording = a});

-- | The last (previous) status of the recorder.
crsLastStatus :: Lens' ConfigurationRecorderStatus (Maybe RecorderStatus)
crsLastStatus = lens _crsLastStatus (\ s a -> s{_crsLastStatus = a});

-- | The message indicating that the recording failed due to an error.
crsLastErrorMessage :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsLastErrorMessage = lens _crsLastErrorMessage (\ s a -> s{_crsLastErrorMessage = a});

-- | The name of the configuration recorder.
crsName :: Lens' ConfigurationRecorderStatus (Maybe Text)
crsName = lens _crsName (\ s a -> s{_crsName = a});

-- | The time the recorder was last started.
crsLastStartTime :: Lens' ConfigurationRecorderStatus (Maybe UTCTime)
crsLastStartTime = lens _crsLastStartTime (\ s a -> s{_crsLastStartTime = a}) . mapping _Time;

instance FromJSON ConfigurationRecorderStatus where
        parseJSON
          = withObject "ConfigurationRecorderStatus"
              (\ x ->
                 ConfigurationRecorderStatus' <$>
                   x .:? "lastErrorCode" <*> x .:? "lastStopTime" <*>
                     x .:? "lastStatusChangeTime"
                     <*> x .:? "recording"
                     <*> x .:? "lastStatus"
                     <*> x .:? "lastErrorMessage"
                     <*> x .:? "name"
                     <*> x .:? "lastStartTime")

-- | /See:/ 'deliveryChannel' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcS3KeyPrefix'
--
-- * 'dcSnsTopicARN'
--
-- * 'dcS3BucketName'
--
-- * 'dcName'
data DeliveryChannel = DeliveryChannel'{_dcS3KeyPrefix :: Maybe Text, _dcSnsTopicARN :: Maybe Text, _dcS3BucketName :: Maybe Text, _dcName :: Text} deriving (Eq, Read, Show)

-- | 'DeliveryChannel' smart constructor.
deliveryChannel :: Text -> DeliveryChannel
deliveryChannel pName = DeliveryChannel'{_dcS3KeyPrefix = Nothing, _dcSnsTopicARN = Nothing, _dcS3BucketName = Nothing, _dcName = pName};

-- | The prefix for the specified Amazon S3 bucket.
dcS3KeyPrefix :: Lens' DeliveryChannel (Maybe Text)
dcS3KeyPrefix = lens _dcS3KeyPrefix (\ s a -> s{_dcS3KeyPrefix = a});

-- | The Amazon Resource Name (ARN) of the IAM role used for accessing the
-- Amazon S3 bucket and the Amazon SNS topic.
dcSnsTopicARN :: Lens' DeliveryChannel (Maybe Text)
dcSnsTopicARN = lens _dcSnsTopicARN (\ s a -> s{_dcSnsTopicARN = a});

-- | The name of the Amazon S3 bucket used to store configuration history for
-- the delivery channel.
dcS3BucketName :: Lens' DeliveryChannel (Maybe Text)
dcS3BucketName = lens _dcS3BucketName (\ s a -> s{_dcS3BucketName = a});

-- | The name of the delivery channel. By default, AWS Config automatically
-- assigns the name \"default\" when creating the delivery channel. You
-- cannot change the assigned name.
dcName :: Lens' DeliveryChannel Text
dcName = lens _dcName (\ s a -> s{_dcName = a});

instance FromJSON DeliveryChannel where
        parseJSON
          = withObject "DeliveryChannel"
              (\ x ->
                 DeliveryChannel' <$>
                   x .:? "s3KeyPrefix" <*> x .:? "snsTopicARN" <*>
                     x .:? "s3BucketName"
                     <*> x .: "name")

instance ToJSON DeliveryChannel where
        toJSON DeliveryChannel'{..}
          = object
              ["s3KeyPrefix" .= _dcS3KeyPrefix,
               "snsTopicARN" .= _dcSnsTopicARN,
               "s3BucketName" .= _dcS3BucketName, "name" .= _dcName]

-- | /See:/ 'deliveryChannelStatus' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcsConfigStreamDeliveryInfo'
--
-- * 'dcsConfigSnapshotDeliveryInfo'
--
-- * 'dcsConfigHistoryDeliveryInfo'
--
-- * 'dcsName'
data DeliveryChannelStatus = DeliveryChannelStatus'{_dcsConfigStreamDeliveryInfo :: Maybe ConfigStreamDeliveryInfo, _dcsConfigSnapshotDeliveryInfo :: Maybe ConfigExportDeliveryInfo, _dcsConfigHistoryDeliveryInfo :: Maybe ConfigExportDeliveryInfo, _dcsName :: Maybe Text} deriving (Eq, Read, Show)

-- | 'DeliveryChannelStatus' smart constructor.
deliveryChannelStatus :: DeliveryChannelStatus
deliveryChannelStatus = DeliveryChannelStatus'{_dcsConfigStreamDeliveryInfo = Nothing, _dcsConfigSnapshotDeliveryInfo = Nothing, _dcsConfigHistoryDeliveryInfo = Nothing, _dcsName = Nothing};

-- | A list containing the status of the delivery of the configuration stream
-- notification to the specified Amazon SNS topic.
dcsConfigStreamDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigStreamDeliveryInfo)
dcsConfigStreamDeliveryInfo = lens _dcsConfigStreamDeliveryInfo (\ s a -> s{_dcsConfigStreamDeliveryInfo = a});

-- | A list containing the status of the delivery of the snapshot to the
-- specified Amazon S3 bucket.
dcsConfigSnapshotDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigExportDeliveryInfo)
dcsConfigSnapshotDeliveryInfo = lens _dcsConfigSnapshotDeliveryInfo (\ s a -> s{_dcsConfigSnapshotDeliveryInfo = a});

-- | A list that contains the status of the delivery of the configuration
-- history to the specified Amazon S3 bucket.
dcsConfigHistoryDeliveryInfo :: Lens' DeliveryChannelStatus (Maybe ConfigExportDeliveryInfo)
dcsConfigHistoryDeliveryInfo = lens _dcsConfigHistoryDeliveryInfo (\ s a -> s{_dcsConfigHistoryDeliveryInfo = a});

-- | The name of the delivery channel.
dcsName :: Lens' DeliveryChannelStatus (Maybe Text)
dcsName = lens _dcsName (\ s a -> s{_dcsName = a});

instance FromJSON DeliveryChannelStatus where
        parseJSON
          = withObject "DeliveryChannelStatus"
              (\ x ->
                 DeliveryChannelStatus' <$>
                   x .:? "configStreamDeliveryInfo" <*>
                     x .:? "configSnapshotDeliveryInfo"
                     <*> x .:? "configHistoryDeliveryInfo"
                     <*> x .:? "name")

data DeliveryStatus = Success | NotApplicable | Failure deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText DeliveryStatus where
    parser = takeLowerText >>= \case
        "Failure" -> pure Failure
        "Not_Applicable" -> pure NotApplicable
        "Success" -> pure Success
        e -> fail ("Failure parsing DeliveryStatus from " ++ show e)

instance ToText DeliveryStatus where
    toText = \case
        Failure -> "Failure"
        NotApplicable -> "Not_Applicable"
        Success -> "Success"

instance Hashable DeliveryStatus
instance ToQuery DeliveryStatus
instance ToHeader DeliveryStatus

instance FromJSON DeliveryStatus where
    parseJSON = parseJSONText "DeliveryStatus"

data RecorderStatus = RSPending | RSFailure | RSSuccess deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText RecorderStatus where
    parser = takeLowerText >>= \case
        "Failure" -> pure RSFailure
        "Pending" -> pure RSPending
        "Success" -> pure RSSuccess
        e -> fail ("Failure parsing RecorderStatus from " ++ show e)

instance ToText RecorderStatus where
    toText = \case
        RSFailure -> "Failure"
        RSPending -> "Pending"
        RSSuccess -> "Success"

instance Hashable RecorderStatus
instance ToQuery RecorderStatus
instance ToHeader RecorderStatus

instance FromJSON RecorderStatus where
    parseJSON = parseJSONText "RecorderStatus"

-- | /See:/ 'relationship' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'relResourceId'
--
-- * 'relResourceType'
--
-- * 'relRelationshipName'
data Relationship = Relationship'{_relResourceId :: Maybe Text, _relResourceType :: Maybe ResourceType, _relRelationshipName :: Maybe Text} deriving (Eq, Read, Show)

-- | 'Relationship' smart constructor.
relationship :: Relationship
relationship = Relationship'{_relResourceId = Nothing, _relResourceType = Nothing, _relRelationshipName = Nothing};

-- | The resource ID of the related resource (for example, @sg-xxxxxx@.
relResourceId :: Lens' Relationship (Maybe Text)
relResourceId = lens _relResourceId (\ s a -> s{_relResourceId = a});

-- | The resource type of the related resource.
relResourceType :: Lens' Relationship (Maybe ResourceType)
relResourceType = lens _relResourceType (\ s a -> s{_relResourceType = a});

-- | The name of the related resource.
relRelationshipName :: Lens' Relationship (Maybe Text)
relRelationshipName = lens _relRelationshipName (\ s a -> s{_relRelationshipName = a});

instance FromJSON Relationship where
        parseJSON
          = withObject "Relationship"
              (\ x ->
                 Relationship' <$>
                   x .:? "resourceId" <*> x .:? "resourceType" <*>
                     x .:? "relationshipName")

data ResourceType = AWSCloudTrailTrail | AWSEC2VPNConnection | AWSEC2SecurityGroup | AWSEC2Instance | AWSEC2NetworkACL | AWSEC2VPNGateway | AWSEC2VPC | AWSEC2NetworkInterface | AWSEC2InternetGateway | AWSEC2Subnet | AWSEC2EIP | AWSEC2CustomerGateway | AWSEC2RouteTable | AWSEC2Volume deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText ResourceType where
    parser = takeLowerText >>= \case
        "AWS::CloudTrail::Trail" -> pure AWSCloudTrailTrail
        "AWS::EC2::CustomerGateway" -> pure AWSEC2CustomerGateway
        "AWS::EC2::EIP" -> pure AWSEC2EIP
        "AWS::EC2::Instance" -> pure AWSEC2Instance
        "AWS::EC2::InternetGateway" -> pure AWSEC2InternetGateway
        "AWS::EC2::NetworkAcl" -> pure AWSEC2NetworkACL
        "AWS::EC2::NetworkInterface" -> pure AWSEC2NetworkInterface
        "AWS::EC2::RouteTable" -> pure AWSEC2RouteTable
        "AWS::EC2::SecurityGroup" -> pure AWSEC2SecurityGroup
        "AWS::EC2::Subnet" -> pure AWSEC2Subnet
        "AWS::EC2::VPC" -> pure AWSEC2VPC
        "AWS::EC2::VPNConnection" -> pure AWSEC2VPNConnection
        "AWS::EC2::VPNGateway" -> pure AWSEC2VPNGateway
        "AWS::EC2::Volume" -> pure AWSEC2Volume
        e -> fail ("Failure parsing ResourceType from " ++ show e)

instance ToText ResourceType where
    toText = \case
        AWSCloudTrailTrail -> "AWS::CloudTrail::Trail"
        AWSEC2CustomerGateway -> "AWS::EC2::CustomerGateway"
        AWSEC2EIP -> "AWS::EC2::EIP"
        AWSEC2Instance -> "AWS::EC2::Instance"
        AWSEC2InternetGateway -> "AWS::EC2::InternetGateway"
        AWSEC2NetworkACL -> "AWS::EC2::NetworkAcl"
        AWSEC2NetworkInterface -> "AWS::EC2::NetworkInterface"
        AWSEC2RouteTable -> "AWS::EC2::RouteTable"
        AWSEC2SecurityGroup -> "AWS::EC2::SecurityGroup"
        AWSEC2Subnet -> "AWS::EC2::Subnet"
        AWSEC2VPC -> "AWS::EC2::VPC"
        AWSEC2VPNConnection -> "AWS::EC2::VPNConnection"
        AWSEC2VPNGateway -> "AWS::EC2::VPNGateway"
        AWSEC2Volume -> "AWS::EC2::Volume"

instance Hashable ResourceType
instance ToQuery ResourceType
instance ToHeader ResourceType

instance ToJSON ResourceType where
    toJSON = toJSONText

instance FromJSON ResourceType where
    parseJSON = parseJSONText "ResourceType"
