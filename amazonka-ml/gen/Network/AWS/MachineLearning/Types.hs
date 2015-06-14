{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE ViewPatterns      #-}

-- Module      : Network.AWS.MachineLearning.Types
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

module Network.AWS.MachineLearning.Types
    (
    -- * Service
      MachineLearning
    -- ** Errors
    , JSONError

    -- * Algorithm
    , Algorithm (..)

    -- * BatchPrediction
    , BatchPrediction
    , batchPrediction
    , bpStatus
    , bpLastUpdatedAt
    , bpCreatedAt
    , bpInputDataLocationS3
    , bpName
    , bpCreatedByIAMUser
    , bpMessage
    , bpOutputURI
    , bpMLModelId
    , bpBatchPredictionDataSourceId
    , bpBatchPredictionId

    -- * BatchPredictionFilterVariable
    , BatchPredictionFilterVariable (..)

    -- * DataSource
    , DataSource
    , dataSource
    , dsStatus
    , dsNumberOfFiles
    , dsLastUpdatedAt
    , dsCreatedAt
    , dsRDSMetadata
    , dsDataSizeInBytes
    , dsName
    , dsCreatedByIAMUser
    , dsDataLocationS3
    , dsComputeStatistics
    , dsMessage
    , dsRedshiftMetadata
    , dsDataRearrangement
    , dsDataSourceId
    , dsRoleARN

    -- * DataSourceFilterVariable
    , DataSourceFilterVariable (..)

    -- * DetailsAttributes
    , DetailsAttributes (..)

    -- * EntityStatus
    , EntityStatus (..)

    -- * Evaluation
    , Evaluation
    , evaluation
    , evaStatus
    , evaPerformanceMetrics
    , evaLastUpdatedAt
    , evaCreatedAt
    , evaInputDataLocationS3
    , evaName
    , evaCreatedByIAMUser
    , evaMessage
    , evaMLModelId
    , evaEvaluationId
    , evaEvaluationDataSourceId

    -- * EvaluationFilterVariable
    , EvaluationFilterVariable (..)

    -- * MLModel
    , MLModel
    , mLModel
    , mlmStatus
    , mlmTrainingParameters
    , mlmLastUpdatedAt
    , mlmCreatedAt
    , mlmScoreThresholdLastUpdatedAt
    , mlmInputDataLocationS3
    , mlmSizeInBytes
    , mlmScoreThreshold
    , mlmName
    , mlmAlgorithm
    , mlmCreatedByIAMUser
    , mlmEndpointInfo
    , mlmMessage
    , mlmMLModelType
    , mlmMLModelId
    , mlmTrainingDataSourceId

    -- * MLModelFilterVariable
    , MLModelFilterVariable (..)

    -- * MLModelType
    , MLModelType (..)

    -- * PerformanceMetrics
    , PerformanceMetrics
    , performanceMetrics
    , pmProperties

    -- * Prediction
    , Prediction
    , prediction
    , prePredictedValue
    , prePredictedScores
    , preDetails
    , prePredictedLabel

    -- * RDSDataSpec
    , RDSDataSpec
    , rdsDataSpec
    , rDataSchemaURI
    , rDataSchema
    , rDataRearrangement
    , rDatabaseInformation
    , rSelectSqlQuery
    , rDatabaseCredentials
    , rS3StagingLocation
    , rResourceRole
    , rServiceRole
    , rSubnetId
    , rSecurityGroupIds

    -- * RDSDatabase
    , RDSDatabase
    , rdsDatabase
    , rdsInstanceIdentifier
    , rdsDatabaseName

    -- * RDSDatabaseCredentials
    , RDSDatabaseCredentials
    , rdsDatabaseCredentials
    , rdsUsername
    , rdsPassword

    -- * RDSMetadata
    , RDSMetadata
    , rdsMetadata
    , rmDatabase
    , rmSelectSqlQuery
    , rmDataPipelineId
    , rmDatabaseUserName
    , rmResourceRole
    , rmServiceRole

    -- * RealtimeEndpointInfo
    , RealtimeEndpointInfo
    , realtimeEndpointInfo
    , reiCreatedAt
    , reiEndpointURL
    , reiEndpointStatus
    , reiPeakRequestsPerSecond

    -- * RealtimeEndpointStatus
    , RealtimeEndpointStatus (..)

    -- * RedshiftDataSpec
    , RedshiftDataSpec
    , redshiftDataSpec
    , rdsDataSchemaURI
    , rdsDataSchema
    , rdsDataRearrangement
    , rdsDatabaseInformation
    , rdsSelectSqlQuery
    , rdsDatabaseCredentials
    , rdsS3StagingLocation

    -- * RedshiftDatabase
    , RedshiftDatabase
    , redshiftDatabase
    , rdDatabaseName
    , rdClusterIdentifier

    -- * RedshiftDatabaseCredentials
    , RedshiftDatabaseCredentials
    , redshiftDatabaseCredentials
    , rdcUsername
    , rdcPassword

    -- * RedshiftMetadata
    , RedshiftMetadata
    , redshiftMetadata
    , redRedshiftDatabase
    , redSelectSqlQuery
    , redDatabaseUserName

    -- * S3DataSpec
    , S3DataSpec
    , s3DataSpec
    , sdsDataSchema
    , sdsDataSchemaLocationS3
    , sdsDataRearrangement
    , sdsDataLocationS3

    -- * SortOrder
    , SortOrder (..)
    ) where

import Network.AWS.Prelude
import Network.AWS.Sign.V4

-- | Version @2014-12-12@ of the Amazon Machine Learning SDK.
data MachineLearning

instance AWSService MachineLearning where
    type Sg MachineLearning = V4
    type Er MachineLearning = JSONError

    service = service'
      where
        service' :: Service MachineLearning
        service' = Service
            { _svcAbbrev  = "MachineLearning"
            , _svcPrefix  = "machinelearning"
            , _svcVersion = "2014-12-12"
            , _svcHandle  = handle
            , _svcRetry   = retry
            }

        handle :: Status
               -> Maybe (LazyByteString -> ServiceError JSONError)
        handle = jsonError statusSuccess service'

        retry :: Retry MachineLearning
        retry = undefined

        check :: Status
              -> JSONError
              -> Bool
        check (statusCode -> s) (awsErrorCode -> e) = undefined

data Algorithm = Sgd deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText Algorithm where
    parser = takeLowerText >>= \case
        "sgd" -> pure Sgd
        e -> fail ("Failure parsing Algorithm from " ++ show e)

instance ToText Algorithm where
    toText = \case
        Sgd -> "sgd"

instance Hashable Algorithm
instance ToQuery Algorithm
instance ToHeader Algorithm

instance FromJSON Algorithm where
    parseJSON = parseJSONText "Algorithm"

-- | /See:/ 'batchPrediction' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'bpStatus'
--
-- * 'bpLastUpdatedAt'
--
-- * 'bpCreatedAt'
--
-- * 'bpInputDataLocationS3'
--
-- * 'bpName'
--
-- * 'bpCreatedByIAMUser'
--
-- * 'bpMessage'
--
-- * 'bpOutputURI'
--
-- * 'bpMLModelId'
--
-- * 'bpBatchPredictionDataSourceId'
--
-- * 'bpBatchPredictionId'
data BatchPrediction = BatchPrediction'{_bpStatus :: Maybe EntityStatus, _bpLastUpdatedAt :: Maybe POSIX, _bpCreatedAt :: Maybe POSIX, _bpInputDataLocationS3 :: Maybe Text, _bpName :: Maybe Text, _bpCreatedByIAMUser :: Maybe Text, _bpMessage :: Maybe Text, _bpOutputURI :: Maybe Text, _bpMLModelId :: Text, _bpBatchPredictionDataSourceId :: Text, _bpBatchPredictionId :: Text} deriving (Eq, Read, Show)

-- | 'BatchPrediction' smart constructor.
batchPrediction :: Text -> Text -> Text -> BatchPrediction
batchPrediction pMLModelId pBatchPredictionDataSourceId pBatchPredictionId = BatchPrediction'{_bpStatus = Nothing, _bpLastUpdatedAt = Nothing, _bpCreatedAt = Nothing, _bpInputDataLocationS3 = Nothing, _bpName = Nothing, _bpCreatedByIAMUser = Nothing, _bpMessage = Nothing, _bpOutputURI = Nothing, _bpMLModelId = pMLModelId, _bpBatchPredictionDataSourceId = pBatchPredictionDataSourceId, _bpBatchPredictionId = pBatchPredictionId};

-- | The status of the @BatchPrediction@. This element can have one of the
-- following values:
--
-- -   @PENDING@ - Amazon Machine Learning (Amazon ML) submitted a request
--     to generate predictions for a batch of observations.
-- -   @INPROGRESS@ - The process is underway.
-- -   @FAILED@ - The request to peform a batch prediction did not run to
--     completion. It is not usable.
-- -   @COMPLETED@ - The batch prediction process completed successfully.
-- -   @DELETED@ - The @BatchPrediction@ is marked as deleted. It is not
--     usable.
bpStatus :: Lens' BatchPrediction (Maybe EntityStatus)
bpStatus = lens _bpStatus (\ s a -> s{_bpStatus = a});

-- | The time of the most recent edit to the @BatchPrediction@. The time is
-- expressed in epoch time.
bpLastUpdatedAt :: Lens' BatchPrediction (Maybe UTCTime)
bpLastUpdatedAt = lens _bpLastUpdatedAt (\ s a -> s{_bpLastUpdatedAt = a}) . mapping _Time;

-- | The time that the @BatchPrediction@ was created. The time is expressed
-- in epoch time.
bpCreatedAt :: Lens' BatchPrediction (Maybe UTCTime)
bpCreatedAt = lens _bpCreatedAt (\ s a -> s{_bpCreatedAt = a}) . mapping _Time;

-- | The location of the data file or directory in Amazon Simple Storage
-- Service (Amazon S3).
bpInputDataLocationS3 :: Lens' BatchPrediction (Maybe Text)
bpInputDataLocationS3 = lens _bpInputDataLocationS3 (\ s a -> s{_bpInputDataLocationS3 = a});

-- | A user-supplied name or description of the @BatchPrediction@.
bpName :: Lens' BatchPrediction (Maybe Text)
bpName = lens _bpName (\ s a -> s{_bpName = a});

-- | The AWS user account that invoked the @BatchPrediction@. The account
-- type can be either an AWS root account or an AWS Identity and Access
-- Management (IAM) user account.
bpCreatedByIAMUser :: Lens' BatchPrediction (Maybe Text)
bpCreatedByIAMUser = lens _bpCreatedByIAMUser (\ s a -> s{_bpCreatedByIAMUser = a});

-- | A description of the most recent details about processing the batch
-- prediction request.
bpMessage :: Lens' BatchPrediction (Maybe Text)
bpMessage = lens _bpMessage (\ s a -> s{_bpMessage = a});

-- | The location of an Amazon S3 bucket or directory to receive the
-- operation results. The following substrings are not allowed in the s3
-- key portion of the \"outputURI\" field: \':\', \'\/\/\', \'\/.\/\',
-- \'\/..\/\'.
bpOutputURI :: Lens' BatchPrediction (Maybe Text)
bpOutputURI = lens _bpOutputURI (\ s a -> s{_bpOutputURI = a});

-- | The ID of the @MLModel@ that generated predictions for the
-- @BatchPrediction@ request.
bpMLModelId :: Lens' BatchPrediction Text
bpMLModelId = lens _bpMLModelId (\ s a -> s{_bpMLModelId = a});

-- | The ID of the @DataSource@ that points to the group of observations to
-- predict.
bpBatchPredictionDataSourceId :: Lens' BatchPrediction Text
bpBatchPredictionDataSourceId = lens _bpBatchPredictionDataSourceId (\ s a -> s{_bpBatchPredictionDataSourceId = a});

-- | The ID assigned to the @BatchPrediction@ at creation. This value should
-- be identical to the value of the @BatchPredictionID@ in the request.
bpBatchPredictionId :: Lens' BatchPrediction Text
bpBatchPredictionId = lens _bpBatchPredictionId (\ s a -> s{_bpBatchPredictionId = a});

instance FromJSON BatchPrediction where
        parseJSON
          = withObject "BatchPrediction"
              (\ x ->
                 BatchPrediction' <$>
                   x .:? "Status" <*> x .:? "LastUpdatedAt" <*>
                     x .:? "CreatedAt"
                     <*> x .:? "InputDataLocationS3"
                     <*> x .:? "Name"
                     <*> x .:? "CreatedByIamUser"
                     <*> x .:? "Message"
                     <*> x .:? "OutputUri"
                     <*> x .: "MLModelId"
                     <*> x .: "BatchPredictionDataSourceId"
                     <*> x .: "BatchPredictionId")

data BatchPredictionFilterVariable = BatchDataSourceId | BatchMLModelId | BatchIAMUser | BatchStatus | BatchCreatedAt | BatchDataURI | BatchName | BatchLastUpdatedAt deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText BatchPredictionFilterVariable where
    parser = takeLowerText >>= \case
        "CreatedAt" -> pure BatchCreatedAt
        "DataSourceId" -> pure BatchDataSourceId
        "DataURI" -> pure BatchDataURI
        "IAMUser" -> pure BatchIAMUser
        "LastUpdatedAt" -> pure BatchLastUpdatedAt
        "MLModelId" -> pure BatchMLModelId
        "Name" -> pure BatchName
        "Status" -> pure BatchStatus
        e -> fail ("Failure parsing BatchPredictionFilterVariable from " ++ show e)

instance ToText BatchPredictionFilterVariable where
    toText = \case
        BatchCreatedAt -> "CreatedAt"
        BatchDataSourceId -> "DataSourceId"
        BatchDataURI -> "DataURI"
        BatchIAMUser -> "IAMUser"
        BatchLastUpdatedAt -> "LastUpdatedAt"
        BatchMLModelId -> "MLModelId"
        BatchName -> "Name"
        BatchStatus -> "Status"

instance Hashable BatchPredictionFilterVariable
instance ToQuery BatchPredictionFilterVariable
instance ToHeader BatchPredictionFilterVariable

instance ToJSON BatchPredictionFilterVariable where
    toJSON = toJSONText

-- | /See:/ 'dataSource' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dsStatus'
--
-- * 'dsNumberOfFiles'
--
-- * 'dsLastUpdatedAt'
--
-- * 'dsCreatedAt'
--
-- * 'dsRDSMetadata'
--
-- * 'dsDataSizeInBytes'
--
-- * 'dsName'
--
-- * 'dsCreatedByIAMUser'
--
-- * 'dsDataLocationS3'
--
-- * 'dsComputeStatistics'
--
-- * 'dsMessage'
--
-- * 'dsRedshiftMetadata'
--
-- * 'dsDataRearrangement'
--
-- * 'dsDataSourceId'
--
-- * 'dsRoleARN'
data DataSource = DataSource'{_dsStatus :: Maybe EntityStatus, _dsNumberOfFiles :: Maybe Integer, _dsLastUpdatedAt :: Maybe POSIX, _dsCreatedAt :: Maybe POSIX, _dsRDSMetadata :: Maybe RDSMetadata, _dsDataSizeInBytes :: Maybe Integer, _dsName :: Maybe Text, _dsCreatedByIAMUser :: Maybe Text, _dsDataLocationS3 :: Maybe Text, _dsComputeStatistics :: Maybe Bool, _dsMessage :: Maybe Text, _dsRedshiftMetadata :: Maybe RedshiftMetadata, _dsDataRearrangement :: Maybe Text, _dsDataSourceId :: Text, _dsRoleARN :: Text} deriving (Eq, Read, Show)

-- | 'DataSource' smart constructor.
dataSource :: Text -> Text -> DataSource
dataSource pDataSourceId pRoleARN = DataSource'{_dsStatus = Nothing, _dsNumberOfFiles = Nothing, _dsLastUpdatedAt = Nothing, _dsCreatedAt = Nothing, _dsRDSMetadata = Nothing, _dsDataSizeInBytes = Nothing, _dsName = Nothing, _dsCreatedByIAMUser = Nothing, _dsDataLocationS3 = Nothing, _dsComputeStatistics = Nothing, _dsMessage = Nothing, _dsRedshiftMetadata = Nothing, _dsDataRearrangement = Nothing, _dsDataSourceId = pDataSourceId, _dsRoleARN = pRoleARN};

-- | The current status of the @DataSource@. This element can have one of the
-- following values:
--
-- -   PENDING - Amazon Machine Learning (Amazon ML) submitted a request to
--     create a @DataSource@.
-- -   INPROGRESS - The creation process is underway.
-- -   FAILED - The request to create a @DataSource@ did not run to
--     completion. It is not usable.
-- -   COMPLETED - The creation process completed successfully.
-- -   DELETED - The @DataSource@ is marked as deleted. It is not usable.
dsStatus :: Lens' DataSource (Maybe EntityStatus)
dsStatus = lens _dsStatus (\ s a -> s{_dsStatus = a});

-- | The number of data files referenced by the @DataSource@.
dsNumberOfFiles :: Lens' DataSource (Maybe Integer)
dsNumberOfFiles = lens _dsNumberOfFiles (\ s a -> s{_dsNumberOfFiles = a});

-- | The time of the most recent edit to the @BatchPrediction@. The time is
-- expressed in epoch time.
dsLastUpdatedAt :: Lens' DataSource (Maybe UTCTime)
dsLastUpdatedAt = lens _dsLastUpdatedAt (\ s a -> s{_dsLastUpdatedAt = a}) . mapping _Time;

-- | The time that the @DataSource@ was created. The time is expressed in
-- epoch time.
dsCreatedAt :: Lens' DataSource (Maybe UTCTime)
dsCreatedAt = lens _dsCreatedAt (\ s a -> s{_dsCreatedAt = a}) . mapping _Time;

-- | FIXME: Undocumented member.
dsRDSMetadata :: Lens' DataSource (Maybe RDSMetadata)
dsRDSMetadata = lens _dsRDSMetadata (\ s a -> s{_dsRDSMetadata = a});

-- | The total number of observations contained in the data files that the
-- @DataSource@ references.
dsDataSizeInBytes :: Lens' DataSource (Maybe Integer)
dsDataSizeInBytes = lens _dsDataSizeInBytes (\ s a -> s{_dsDataSizeInBytes = a});

-- | A user-supplied name or description of the @DataSource@.
dsName :: Lens' DataSource (Maybe Text)
dsName = lens _dsName (\ s a -> s{_dsName = a});

-- | The AWS user account from which the @DataSource@ was created. The
-- account type can be either an AWS root account or an AWS Identity and
-- Access Management (IAM) user account.
dsCreatedByIAMUser :: Lens' DataSource (Maybe Text)
dsCreatedByIAMUser = lens _dsCreatedByIAMUser (\ s a -> s{_dsCreatedByIAMUser = a});

-- | The location and name of the data in Amazon Simple Storage Service
-- (Amazon S3) that is used by a @DataSource@.
dsDataLocationS3 :: Lens' DataSource (Maybe Text)
dsDataLocationS3 = lens _dsDataLocationS3 (\ s a -> s{_dsDataLocationS3 = a});

-- | The parameter is @true@ if statistics need to be generated from the
-- observation data.
dsComputeStatistics :: Lens' DataSource (Maybe Bool)
dsComputeStatistics = lens _dsComputeStatistics (\ s a -> s{_dsComputeStatistics = a});

-- | A description of the most recent details about creating the
-- @DataSource@.
dsMessage :: Lens' DataSource (Maybe Text)
dsMessage = lens _dsMessage (\ s a -> s{_dsMessage = a});

-- | FIXME: Undocumented member.
dsRedshiftMetadata :: Lens' DataSource (Maybe RedshiftMetadata)
dsRedshiftMetadata = lens _dsRedshiftMetadata (\ s a -> s{_dsRedshiftMetadata = a});

-- | A JSON string that represents the splitting requirement of a
-- @Datasource@.
dsDataRearrangement :: Lens' DataSource (Maybe Text)
dsDataRearrangement = lens _dsDataRearrangement (\ s a -> s{_dsDataRearrangement = a});

-- | The ID that is assigned to the @DataSource@ during creation.
dsDataSourceId :: Lens' DataSource Text
dsDataSourceId = lens _dsDataSourceId (\ s a -> s{_dsDataSourceId = a});

-- | FIXME: Undocumented member.
dsRoleARN :: Lens' DataSource Text
dsRoleARN = lens _dsRoleARN (\ s a -> s{_dsRoleARN = a});

instance FromJSON DataSource where
        parseJSON
          = withObject "DataSource"
              (\ x ->
                 DataSource' <$>
                   x .:? "Status" <*> x .:? "NumberOfFiles" <*>
                     x .:? "LastUpdatedAt"
                     <*> x .:? "CreatedAt"
                     <*> x .:? "RDSMetadata"
                     <*> x .:? "DataSizeInBytes"
                     <*> x .:? "Name"
                     <*> x .:? "CreatedByIamUser"
                     <*> x .:? "DataLocationS3"
                     <*> x .:? "ComputeStatistics"
                     <*> x .:? "Message"
                     <*> x .:? "RedshiftMetadata"
                     <*> x .:? "DataRearrangement"
                     <*> x .: "DataSourceId"
                     <*> x .: "RoleARN")

data DataSourceFilterVariable = DSFVDataStatus | DSFVDataDATALOCATIONS3 | DSFVDataCreatedAt | DSFVDataLastUpdatedAt | DSFVDataName | DSFVDataIAMUser deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText DataSourceFilterVariable where
    parser = takeLowerText >>= \case
        "CreatedAt" -> pure DSFVDataCreatedAt
        "DataLocationS3" -> pure DSFVDataDATALOCATIONS3
        "IAMUser" -> pure DSFVDataIAMUser
        "LastUpdatedAt" -> pure DSFVDataLastUpdatedAt
        "Name" -> pure DSFVDataName
        "Status" -> pure DSFVDataStatus
        e -> fail ("Failure parsing DataSourceFilterVariable from " ++ show e)

instance ToText DataSourceFilterVariable where
    toText = \case
        DSFVDataCreatedAt -> "CreatedAt"
        DSFVDataDATALOCATIONS3 -> "DataLocationS3"
        DSFVDataIAMUser -> "IAMUser"
        DSFVDataLastUpdatedAt -> "LastUpdatedAt"
        DSFVDataName -> "Name"
        DSFVDataStatus -> "Status"

instance Hashable DataSourceFilterVariable
instance ToQuery DataSourceFilterVariable
instance ToHeader DataSourceFilterVariable

instance ToJSON DataSourceFilterVariable where
    toJSON = toJSONText

data DetailsAttributes = Algorithm | PredictiveModelType deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText DetailsAttributes where
    parser = takeLowerText >>= \case
        "Algorithm" -> pure Algorithm
        "PredictiveModelType" -> pure PredictiveModelType
        e -> fail ("Failure parsing DetailsAttributes from " ++ show e)

instance ToText DetailsAttributes where
    toText = \case
        Algorithm -> "Algorithm"
        PredictiveModelType -> "PredictiveModelType"

instance Hashable DetailsAttributes
instance ToQuery DetailsAttributes
instance ToHeader DetailsAttributes

instance FromJSON DetailsAttributes where
    parseJSON = parseJSONText "DetailsAttributes"

data EntityStatus = Pending | Inprogress | Deleted | Completed | Failed deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText EntityStatus where
    parser = takeLowerText >>= \case
        "COMPLETED" -> pure Completed
        "DELETED" -> pure Deleted
        "FAILED" -> pure Failed
        "INPROGRESS" -> pure Inprogress
        "PENDING" -> pure Pending
        e -> fail ("Failure parsing EntityStatus from " ++ show e)

instance ToText EntityStatus where
    toText = \case
        Completed -> "COMPLETED"
        Deleted -> "DELETED"
        Failed -> "FAILED"
        Inprogress -> "INPROGRESS"
        Pending -> "PENDING"

instance Hashable EntityStatus
instance ToQuery EntityStatus
instance ToHeader EntityStatus

instance FromJSON EntityStatus where
    parseJSON = parseJSONText "EntityStatus"

-- | /See:/ 'evaluation' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'evaStatus'
--
-- * 'evaPerformanceMetrics'
--
-- * 'evaLastUpdatedAt'
--
-- * 'evaCreatedAt'
--
-- * 'evaInputDataLocationS3'
--
-- * 'evaName'
--
-- * 'evaCreatedByIAMUser'
--
-- * 'evaMessage'
--
-- * 'evaMLModelId'
--
-- * 'evaEvaluationId'
--
-- * 'evaEvaluationDataSourceId'
data Evaluation = Evaluation'{_evaStatus :: Maybe EntityStatus, _evaPerformanceMetrics :: Maybe PerformanceMetrics, _evaLastUpdatedAt :: Maybe POSIX, _evaCreatedAt :: Maybe POSIX, _evaInputDataLocationS3 :: Maybe Text, _evaName :: Maybe Text, _evaCreatedByIAMUser :: Maybe Text, _evaMessage :: Maybe Text, _evaMLModelId :: Text, _evaEvaluationId :: Text, _evaEvaluationDataSourceId :: Text} deriving (Eq, Read, Show)

-- | 'Evaluation' smart constructor.
evaluation :: Text -> Text -> Text -> Evaluation
evaluation pMLModelId pEvaluationId pEvaluationDataSourceId = Evaluation'{_evaStatus = Nothing, _evaPerformanceMetrics = Nothing, _evaLastUpdatedAt = Nothing, _evaCreatedAt = Nothing, _evaInputDataLocationS3 = Nothing, _evaName = Nothing, _evaCreatedByIAMUser = Nothing, _evaMessage = Nothing, _evaMLModelId = pMLModelId, _evaEvaluationId = pEvaluationId, _evaEvaluationDataSourceId = pEvaluationDataSourceId};

-- | The status of the evaluation. This element can have one of the following
-- values:
--
-- -   @PENDING@ - Amazon Machine Learning (Amazon ML) submitted a request
--     to evaluate an @MLModel@.
-- -   @INPROGRESS@ - The evaluation is underway.
-- -   @FAILED@ - The request to evaluate an @MLModel@ did not run to
--     completion. It is not usable.
-- -   @COMPLETED@ - The evaluation process completed successfully.
-- -   @DELETED@ - The @Evaluation@ is marked as deleted. It is not usable.
evaStatus :: Lens' Evaluation (Maybe EntityStatus)
evaStatus = lens _evaStatus (\ s a -> s{_evaStatus = a});

-- | Measurements of how well the @MLModel@ performed, using observations
-- referenced by the @DataSource@. One of the following metrics is
-- returned, based on the type of the MLModel:
--
-- -   BinaryAUC: A binary @MLModel@ uses the Area Under the Curve (AUC)
--     technique to measure performance.
--
-- -   RegressionRMSE: A regression @MLModel@ uses the Root Mean Square
--     Error (RMSE) technique to measure performance. RMSE measures the
--     difference between predicted and actual values for a single
--     variable.
--
-- -   MulticlassAvgFScore: A multiclass @MLModel@ uses the F1 score
--     technique to measure performance.
--
-- For more information about performance metrics, please see the
-- <http://docs.aws.amazon.com/machine-learning/latest/dg Amazon Machine Learning Developer Guide>.
evaPerformanceMetrics :: Lens' Evaluation (Maybe PerformanceMetrics)
evaPerformanceMetrics = lens _evaPerformanceMetrics (\ s a -> s{_evaPerformanceMetrics = a});

-- | The time of the most recent edit to the @Evaluation@. The time is
-- expressed in epoch time.
evaLastUpdatedAt :: Lens' Evaluation (Maybe UTCTime)
evaLastUpdatedAt = lens _evaLastUpdatedAt (\ s a -> s{_evaLastUpdatedAt = a}) . mapping _Time;

-- | The time that the @Evaluation@ was created. The time is expressed in
-- epoch time.
evaCreatedAt :: Lens' Evaluation (Maybe UTCTime)
evaCreatedAt = lens _evaCreatedAt (\ s a -> s{_evaCreatedAt = a}) . mapping _Time;

-- | The location and name of the data in Amazon Simple Storage Server
-- (Amazon S3) that is used in the evaluation.
evaInputDataLocationS3 :: Lens' Evaluation (Maybe Text)
evaInputDataLocationS3 = lens _evaInputDataLocationS3 (\ s a -> s{_evaInputDataLocationS3 = a});

-- | A user-supplied name or description of the @Evaluation@.
evaName :: Lens' Evaluation (Maybe Text)
evaName = lens _evaName (\ s a -> s{_evaName = a});

-- | The AWS user account that invoked the evaluation. The account type can
-- be either an AWS root account or an AWS Identity and Access Management
-- (IAM) user account.
evaCreatedByIAMUser :: Lens' Evaluation (Maybe Text)
evaCreatedByIAMUser = lens _evaCreatedByIAMUser (\ s a -> s{_evaCreatedByIAMUser = a});

-- | A description of the most recent details about evaluating the @MLModel@.
evaMessage :: Lens' Evaluation (Maybe Text)
evaMessage = lens _evaMessage (\ s a -> s{_evaMessage = a});

-- | The ID of the @MLModel@ that is the focus of the evaluation.
evaMLModelId :: Lens' Evaluation Text
evaMLModelId = lens _evaMLModelId (\ s a -> s{_evaMLModelId = a});

-- | The ID that is assigned to the @Evaluation@ at creation.
evaEvaluationId :: Lens' Evaluation Text
evaEvaluationId = lens _evaEvaluationId (\ s a -> s{_evaEvaluationId = a});

-- | The ID of the @DataSource@ that is used to evaluate the @MLModel@.
evaEvaluationDataSourceId :: Lens' Evaluation Text
evaEvaluationDataSourceId = lens _evaEvaluationDataSourceId (\ s a -> s{_evaEvaluationDataSourceId = a});

instance FromJSON Evaluation where
        parseJSON
          = withObject "Evaluation"
              (\ x ->
                 Evaluation' <$>
                   x .:? "Status" <*> x .:? "PerformanceMetrics" <*>
                     x .:? "LastUpdatedAt"
                     <*> x .:? "CreatedAt"
                     <*> x .:? "InputDataLocationS3"
                     <*> x .:? "Name"
                     <*> x .:? "CreatedByIamUser"
                     <*> x .:? "Message"
                     <*> x .: "MLModelId"
                     <*> x .: "EvaluationId"
                     <*> x .: "EvaluationDataSourceId")

data EvaluationFilterVariable = EFVEvalStatus | EFVEvalDataURI | EFVEvalDataSourceId | EFVEvalCreatedAt | EFVEvalName | EFVEvalIAMUser | EFVEvalMLModelId | EFVEvalLastUpdatedAt deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText EvaluationFilterVariable where
    parser = takeLowerText >>= \case
        "CreatedAt" -> pure EFVEvalCreatedAt
        "DataSourceId" -> pure EFVEvalDataSourceId
        "DataURI" -> pure EFVEvalDataURI
        "IAMUser" -> pure EFVEvalIAMUser
        "LastUpdatedAt" -> pure EFVEvalLastUpdatedAt
        "MLModelId" -> pure EFVEvalMLModelId
        "Name" -> pure EFVEvalName
        "Status" -> pure EFVEvalStatus
        e -> fail ("Failure parsing EvaluationFilterVariable from " ++ show e)

instance ToText EvaluationFilterVariable where
    toText = \case
        EFVEvalCreatedAt -> "CreatedAt"
        EFVEvalDataSourceId -> "DataSourceId"
        EFVEvalDataURI -> "DataURI"
        EFVEvalIAMUser -> "IAMUser"
        EFVEvalLastUpdatedAt -> "LastUpdatedAt"
        EFVEvalMLModelId -> "MLModelId"
        EFVEvalName -> "Name"
        EFVEvalStatus -> "Status"

instance Hashable EvaluationFilterVariable
instance ToQuery EvaluationFilterVariable
instance ToHeader EvaluationFilterVariable

instance ToJSON EvaluationFilterVariable where
    toJSON = toJSONText

-- | /See:/ 'mLModel' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mlmStatus'
--
-- * 'mlmTrainingParameters'
--
-- * 'mlmLastUpdatedAt'
--
-- * 'mlmCreatedAt'
--
-- * 'mlmScoreThresholdLastUpdatedAt'
--
-- * 'mlmInputDataLocationS3'
--
-- * 'mlmSizeInBytes'
--
-- * 'mlmScoreThreshold'
--
-- * 'mlmName'
--
-- * 'mlmAlgorithm'
--
-- * 'mlmCreatedByIAMUser'
--
-- * 'mlmEndpointInfo'
--
-- * 'mlmMessage'
--
-- * 'mlmMLModelType'
--
-- * 'mlmMLModelId'
--
-- * 'mlmTrainingDataSourceId'
data MLModel = MLModel'{_mlmStatus :: Maybe EntityStatus, _mlmTrainingParameters :: HashMap Text Text, _mlmLastUpdatedAt :: Maybe POSIX, _mlmCreatedAt :: Maybe POSIX, _mlmScoreThresholdLastUpdatedAt :: Maybe POSIX, _mlmInputDataLocationS3 :: Maybe Text, _mlmSizeInBytes :: Maybe Integer, _mlmScoreThreshold :: Maybe Double, _mlmName :: Maybe Text, _mlmAlgorithm :: Maybe Algorithm, _mlmCreatedByIAMUser :: Maybe Text, _mlmEndpointInfo :: Maybe RealtimeEndpointInfo, _mlmMessage :: Maybe Text, _mlmMLModelType :: Maybe MLModelType, _mlmMLModelId :: Text, _mlmTrainingDataSourceId :: Text} deriving (Eq, Read, Show)

-- | 'MLModel' smart constructor.
mLModel :: Text -> Text -> MLModel
mLModel pMLModelId pTrainingDataSourceId = MLModel'{_mlmStatus = Nothing, _mlmTrainingParameters = mempty, _mlmLastUpdatedAt = Nothing, _mlmCreatedAt = Nothing, _mlmScoreThresholdLastUpdatedAt = Nothing, _mlmInputDataLocationS3 = Nothing, _mlmSizeInBytes = Nothing, _mlmScoreThreshold = Nothing, _mlmName = Nothing, _mlmAlgorithm = Nothing, _mlmCreatedByIAMUser = Nothing, _mlmEndpointInfo = Nothing, _mlmMessage = Nothing, _mlmMLModelType = Nothing, _mlmMLModelId = pMLModelId, _mlmTrainingDataSourceId = pTrainingDataSourceId};

-- | The current status of an @MLModel@. This element can have one of the
-- following values:
--
-- -   PENDING - Amazon Machine Learning (Amazon ML) submitted a request to
--     create an @MLModel@.
-- -   INPROGRESS - The creation process is underway.
-- -   FAILED - The request to create an @MLModel@ did not run to
--     completion. It is not usable.
-- -   COMPLETED - The creation process completed successfully.
-- -   DELETED - The @MLModel@ is marked as deleted. It is not usable.
mlmStatus :: Lens' MLModel (Maybe EntityStatus)
mlmStatus = lens _mlmStatus (\ s a -> s{_mlmStatus = a});

-- | A list of the training parameters in the @MLModel@. The list is
-- implemented as a map of key\/value pairs.
--
-- The following is the current set of training parameters:
--
-- -   @sgd.l1RegularizationAmount@ - Coefficient regularization L1 norm.
--     It controls overfitting the data by penalizing large coefficients.
--     This tends to drive coefficients to zero, resulting in a sparse
--     feature set. If you use this parameter, specify a small value, such
--     as 1.0E-04 or 1.0E-08.
--
--     The value is a double that ranges from 0 to MAX_DOUBLE. The default
--     is not to use L1 normalization. The parameter cannot be used when
--     @L2@ is specified. Use this parameter sparingly.
--
-- -   @sgd.l2RegularizationAmount@ - Coefficient regularization L2 norm.
--     It controls overfitting the data by penalizing large coefficients.
--     This tends to drive coefficients to small, nonzero values. If you
--     use this parameter, specify a small value, such as 1.0E-04 or
--     1.0E-08.
--
--     The valus is a double that ranges from 0 to MAX_DOUBLE. The default
--     is not to use L2 normalization. This cannot be used when @L1@ is
--     specified. Use this parameter sparingly.
--
-- -   @sgd.maxPasses@ - Number of times that the training process
--     traverses the observations to build the @MLModel@. The value is an
--     integer that ranges from 1 to 10000. The default value is 10.
--
-- -   @sgd.maxMLModelSizeInBytes@ - Maximum allowed size of the model.
--     Depending on the input data, the model size might affect
--     performance.
--
--     The value is an integer that ranges from 100000 to 2147483648. The
--     default value is 33554432.
--
mlmTrainingParameters :: Lens' MLModel (HashMap Text Text)
mlmTrainingParameters = lens _mlmTrainingParameters (\ s a -> s{_mlmTrainingParameters = a}) . _Coerce;

-- | The time of the most recent edit to the @MLModel@. The time is expressed
-- in epoch time.
mlmLastUpdatedAt :: Lens' MLModel (Maybe UTCTime)
mlmLastUpdatedAt = lens _mlmLastUpdatedAt (\ s a -> s{_mlmLastUpdatedAt = a}) . mapping _Time;

-- | The time that the @MLModel@ was created. The time is expressed in epoch
-- time.
mlmCreatedAt :: Lens' MLModel (Maybe UTCTime)
mlmCreatedAt = lens _mlmCreatedAt (\ s a -> s{_mlmCreatedAt = a}) . mapping _Time;

-- | The time of the most recent edit to the @ScoreThreshold@. The time is
-- expressed in epoch time.
mlmScoreThresholdLastUpdatedAt :: Lens' MLModel (Maybe UTCTime)
mlmScoreThresholdLastUpdatedAt = lens _mlmScoreThresholdLastUpdatedAt (\ s a -> s{_mlmScoreThresholdLastUpdatedAt = a}) . mapping _Time;

-- | The location of the data file or directory in Amazon Simple Storage
-- Service (Amazon S3).
mlmInputDataLocationS3 :: Lens' MLModel (Maybe Text)
mlmInputDataLocationS3 = lens _mlmInputDataLocationS3 (\ s a -> s{_mlmInputDataLocationS3 = a});

-- | FIXME: Undocumented member.
mlmSizeInBytes :: Lens' MLModel (Maybe Integer)
mlmSizeInBytes = lens _mlmSizeInBytes (\ s a -> s{_mlmSizeInBytes = a});

-- | FIXME: Undocumented member.
mlmScoreThreshold :: Lens' MLModel (Maybe Double)
mlmScoreThreshold = lens _mlmScoreThreshold (\ s a -> s{_mlmScoreThreshold = a});

-- | A user-supplied name or description of the @MLModel@.
mlmName :: Lens' MLModel (Maybe Text)
mlmName = lens _mlmName (\ s a -> s{_mlmName = a});

-- | The algorithm used to train the @MLModel@. The following algorithm is
-- supported:
--
-- -   SGD -- Stochastic gradient descent. The goal of SGD is to minimize
--     the gradient of the loss function.
mlmAlgorithm :: Lens' MLModel (Maybe Algorithm)
mlmAlgorithm = lens _mlmAlgorithm (\ s a -> s{_mlmAlgorithm = a});

-- | The AWS user account from which the @MLModel@ was created. The account
-- type can be either an AWS root account or an AWS Identity and Access
-- Management (IAM) user account.
mlmCreatedByIAMUser :: Lens' MLModel (Maybe Text)
mlmCreatedByIAMUser = lens _mlmCreatedByIAMUser (\ s a -> s{_mlmCreatedByIAMUser = a});

-- | The current endpoint of the @MLModel@.
mlmEndpointInfo :: Lens' MLModel (Maybe RealtimeEndpointInfo)
mlmEndpointInfo = lens _mlmEndpointInfo (\ s a -> s{_mlmEndpointInfo = a});

-- | A description of the most recent details about accessing the @MLModel@.
mlmMessage :: Lens' MLModel (Maybe Text)
mlmMessage = lens _mlmMessage (\ s a -> s{_mlmMessage = a});

-- | Identifies the @MLModel@ category. The following are the available
-- types:
--
-- -   REGRESSION - Produces a numeric result. For example, \"What listing
--     price should a house have?\".
-- -   BINARY - Produces one of two possible results. For example, \"Is
--     this a child-friendly web site?\".
-- -   MULTICLASS - Produces more than two possible results. For example,
--     \"Is this a HIGH, LOW or MEDIUM risk trade?\".
mlmMLModelType :: Lens' MLModel (Maybe MLModelType)
mlmMLModelType = lens _mlmMLModelType (\ s a -> s{_mlmMLModelType = a});

-- | The ID assigned to the @MLModel@ at creation.
mlmMLModelId :: Lens' MLModel Text
mlmMLModelId = lens _mlmMLModelId (\ s a -> s{_mlmMLModelId = a});

-- | The ID of the training @DataSource@. The CreateMLModel operation uses
-- the @TrainingDataSourceId@.
mlmTrainingDataSourceId :: Lens' MLModel Text
mlmTrainingDataSourceId = lens _mlmTrainingDataSourceId (\ s a -> s{_mlmTrainingDataSourceId = a});

instance FromJSON MLModel where
        parseJSON
          = withObject "MLModel"
              (\ x ->
                 MLModel' <$>
                   x .:? "Status" <*>
                     x .:? "TrainingParameters" .!= mempty
                     <*> x .:? "LastUpdatedAt"
                     <*> x .:? "CreatedAt"
                     <*> x .:? "ScoreThresholdLastUpdatedAt"
                     <*> x .:? "InputDataLocationS3"
                     <*> x .:? "SizeInBytes"
                     <*> x .:? "ScoreThreshold"
                     <*> x .:? "Name"
                     <*> x .:? "Algorithm"
                     <*> x .:? "CreatedByIamUser"
                     <*> x .:? "EndpointInfo"
                     <*> x .:? "Message"
                     <*> x .:? "MLModelType"
                     <*> x .: "MLModelId"
                     <*> x .: "TrainingDataSourceId")

data MLModelFilterVariable = MLMFVRealtimeEndpointStatus | MLMFVMLModelType | MLMFVTrainingDataURI | MLMFVStatus | MLMFVIAMUser | MLMFVCreatedAt | MLMFVTrainingDataSourceId | MLMFVAlgorithm | MLMFVName | MLMFVLastUpdatedAt deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText MLModelFilterVariable where
    parser = takeLowerText >>= \case
        "Algorithm" -> pure MLMFVAlgorithm
        "CreatedAt" -> pure MLMFVCreatedAt
        "IAMUser" -> pure MLMFVIAMUser
        "LastUpdatedAt" -> pure MLMFVLastUpdatedAt
        "MLModelType" -> pure MLMFVMLModelType
        "Name" -> pure MLMFVName
        "RealtimeEndpointStatus" -> pure MLMFVRealtimeEndpointStatus
        "Status" -> pure MLMFVStatus
        "TrainingDataSourceId" -> pure MLMFVTrainingDataSourceId
        "TrainingDataURI" -> pure MLMFVTrainingDataURI
        e -> fail ("Failure parsing MLModelFilterVariable from " ++ show e)

instance ToText MLModelFilterVariable where
    toText = \case
        MLMFVAlgorithm -> "Algorithm"
        MLMFVCreatedAt -> "CreatedAt"
        MLMFVIAMUser -> "IAMUser"
        MLMFVLastUpdatedAt -> "LastUpdatedAt"
        MLMFVMLModelType -> "MLModelType"
        MLMFVName -> "Name"
        MLMFVRealtimeEndpointStatus -> "RealtimeEndpointStatus"
        MLMFVStatus -> "Status"
        MLMFVTrainingDataSourceId -> "TrainingDataSourceId"
        MLMFVTrainingDataURI -> "TrainingDataURI"

instance Hashable MLModelFilterVariable
instance ToQuery MLModelFilterVariable
instance ToHeader MLModelFilterVariable

instance ToJSON MLModelFilterVariable where
    toJSON = toJSONText

data MLModelType = Multiclass | Regression | Binary deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText MLModelType where
    parser = takeLowerText >>= \case
        "BINARY" -> pure Binary
        "MULTICLASS" -> pure Multiclass
        "REGRESSION" -> pure Regression
        e -> fail ("Failure parsing MLModelType from " ++ show e)

instance ToText MLModelType where
    toText = \case
        Binary -> "BINARY"
        Multiclass -> "MULTICLASS"
        Regression -> "REGRESSION"

instance Hashable MLModelType
instance ToQuery MLModelType
instance ToHeader MLModelType

instance ToJSON MLModelType where
    toJSON = toJSONText

instance FromJSON MLModelType where
    parseJSON = parseJSONText "MLModelType"

-- | /See:/ 'performanceMetrics' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'pmProperties'
newtype PerformanceMetrics = PerformanceMetrics'{_pmProperties :: HashMap Text Text} deriving (Eq, Read, Show)

-- | 'PerformanceMetrics' smart constructor.
performanceMetrics :: PerformanceMetrics
performanceMetrics = PerformanceMetrics'{_pmProperties = mempty};

-- | FIXME: Undocumented member.
pmProperties :: Lens' PerformanceMetrics (HashMap Text Text)
pmProperties = lens _pmProperties (\ s a -> s{_pmProperties = a}) . _Coerce;

instance FromJSON PerformanceMetrics where
        parseJSON
          = withObject "PerformanceMetrics"
              (\ x ->
                 PerformanceMetrics' <$>
                   x .:? "Properties" .!= mempty)

-- | /See:/ 'prediction' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'prePredictedValue'
--
-- * 'prePredictedScores'
--
-- * 'preDetails'
--
-- * 'prePredictedLabel'
data Prediction = Prediction'{_prePredictedValue :: Maybe Double, _prePredictedScores :: HashMap Text Double, _preDetails :: HashMap DetailsAttributes Text, _prePredictedLabel :: Text} deriving (Eq, Read, Show)

-- | 'Prediction' smart constructor.
prediction :: Text -> Prediction
prediction pPredictedLabel = Prediction'{_prePredictedValue = Nothing, _prePredictedScores = mempty, _preDetails = mempty, _prePredictedLabel = pPredictedLabel};

-- | The prediction value for REGRESSION @MLModel@.
prePredictedValue :: Lens' Prediction (Maybe Double)
prePredictedValue = lens _prePredictedValue (\ s a -> s{_prePredictedValue = a});

-- | FIXME: Undocumented member.
prePredictedScores :: Lens' Prediction (HashMap Text Double)
prePredictedScores = lens _prePredictedScores (\ s a -> s{_prePredictedScores = a}) . _Coerce;

-- | FIXME: Undocumented member.
preDetails :: Lens' Prediction (HashMap DetailsAttributes Text)
preDetails = lens _preDetails (\ s a -> s{_preDetails = a}) . _Coerce;

-- | The prediction label for either a BINARY or MULTICLASS @MLModel@.
prePredictedLabel :: Lens' Prediction Text
prePredictedLabel = lens _prePredictedLabel (\ s a -> s{_prePredictedLabel = a});

instance FromJSON Prediction where
        parseJSON
          = withObject "Prediction"
              (\ x ->
                 Prediction' <$>
                   x .:? "predictedValue" <*>
                     x .:? "predictedScores" .!= mempty
                     <*> x .:? "details" .!= mempty
                     <*> x .: "predictedLabel")

-- | /See:/ 'rdsDataSpec' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rDataSchemaURI'
--
-- * 'rDataSchema'
--
-- * 'rDataRearrangement'
--
-- * 'rDatabaseInformation'
--
-- * 'rSelectSqlQuery'
--
-- * 'rDatabaseCredentials'
--
-- * 'rS3StagingLocation'
--
-- * 'rResourceRole'
--
-- * 'rServiceRole'
--
-- * 'rSubnetId'
--
-- * 'rSecurityGroupIds'
data RDSDataSpec = RDSDataSpec'{_rDataSchemaURI :: Maybe Text, _rDataSchema :: Maybe Text, _rDataRearrangement :: Maybe Text, _rDatabaseInformation :: RDSDatabase, _rSelectSqlQuery :: Text, _rDatabaseCredentials :: RDSDatabaseCredentials, _rS3StagingLocation :: Text, _rResourceRole :: Text, _rServiceRole :: Text, _rSubnetId :: Text, _rSecurityGroupIds :: [Text]} deriving (Eq, Read, Show)

-- | 'RDSDataSpec' smart constructor.
rdsDataSpec :: RDSDatabase -> Text -> RDSDatabaseCredentials -> Text -> Text -> Text -> Text -> [Text] -> RDSDataSpec
rdsDataSpec pDatabaseInformation pSelectSqlQuery pDatabaseCredentials pS3StagingLocation pResourceRole pServiceRole pSubnetId pSecurityGroupIds = RDSDataSpec'{_rDataSchemaURI = Nothing, _rDataSchema = Nothing, _rDataRearrangement = Nothing, _rDatabaseInformation = pDatabaseInformation, _rSelectSqlQuery = pSelectSqlQuery, _rDatabaseCredentials = pDatabaseCredentials, _rS3StagingLocation = pS3StagingLocation, _rResourceRole = pResourceRole, _rServiceRole = pServiceRole, _rSubnetId = pSubnetId, _rSecurityGroupIds = pSecurityGroupIds};

-- | The Amazon S3 location of the @DataSchema@.
rDataSchemaURI :: Lens' RDSDataSpec (Maybe Text)
rDataSchemaURI = lens _rDataSchemaURI (\ s a -> s{_rDataSchemaURI = a});

-- | A JSON string that represents the schema. This is not required if
-- @DataSchemaUri@ is specified.
rDataSchema :: Lens' RDSDataSpec (Maybe Text)
rDataSchema = lens _rDataSchema (\ s a -> s{_rDataSchema = a});

-- | DataRearrangement - A JSON string that represents the splitting
-- requirement of a @DataSource@.
--
-- Sample -
-- @ \"{\\\"randomSeed\\\":\\\"some-random-seed\\\", \\\"splitting\\\":{\\\"percentBegin\\\":10,\\\"percentEnd\\\":60}}\"@
rDataRearrangement :: Lens' RDSDataSpec (Maybe Text)
rDataRearrangement = lens _rDataRearrangement (\ s a -> s{_rDataRearrangement = a});

-- | Describes the @DatabaseName@ and @InstanceIdentifier@ of an an Amazon
-- RDS database.
rDatabaseInformation :: Lens' RDSDataSpec RDSDatabase
rDatabaseInformation = lens _rDatabaseInformation (\ s a -> s{_rDatabaseInformation = a});

-- | The query that is used to retrieve the observation data for the
-- @DataSource@.
rSelectSqlQuery :: Lens' RDSDataSpec Text
rSelectSqlQuery = lens _rSelectSqlQuery (\ s a -> s{_rSelectSqlQuery = a});

-- | The AWS Identity and Access Management (IAM) credentials that are used
-- connect to the Amazon RDS database.
rDatabaseCredentials :: Lens' RDSDataSpec RDSDatabaseCredentials
rDatabaseCredentials = lens _rDatabaseCredentials (\ s a -> s{_rDatabaseCredentials = a});

-- | The Amazon S3 location for staging Amazon RDS data. The data retrieved
-- from Amazon RDS using @SelectSqlQuery@ is stored in this location.
rS3StagingLocation :: Lens' RDSDataSpec Text
rS3StagingLocation = lens _rS3StagingLocation (\ s a -> s{_rS3StagingLocation = a});

-- | The role (DataPipelineDefaultResourceRole) assumed by an Amazon Elastic
-- Compute Cloud (Amazon EC2) instance to carry out the copy operation from
-- Amazon RDS to an Amazon S3 task. For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates>
-- for data pipelines.
rResourceRole :: Lens' RDSDataSpec Text
rResourceRole = lens _rResourceRole (\ s a -> s{_rResourceRole = a});

-- | The role (DataPipelineDefaultRole) assumed by AWS Data Pipeline service
-- to monitor the progress of the copy task from Amazon RDS to Amazon S3.
-- For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates>
-- for data pipelines.
rServiceRole :: Lens' RDSDataSpec Text
rServiceRole = lens _rServiceRole (\ s a -> s{_rServiceRole = a});

-- | The subnet ID to be used to access a VPC-based RDS DB instance. This
-- attribute is used by Data Pipeline to carry out the copy task from
-- Amazon RDS to Amazon S3.
rSubnetId :: Lens' RDSDataSpec Text
rSubnetId = lens _rSubnetId (\ s a -> s{_rSubnetId = a});

-- | The security group IDs to be used to access a VPC-based RDS DB instance.
-- Ensure that there are appropriate ingress rules set up to allow access
-- to the RDS DB instance. This attribute is used by Data Pipeline to carry
-- out the copy operation from Amazon RDS to an Amazon S3 task.
rSecurityGroupIds :: Lens' RDSDataSpec [Text]
rSecurityGroupIds = lens _rSecurityGroupIds (\ s a -> s{_rSecurityGroupIds = a});

instance ToJSON RDSDataSpec where
        toJSON RDSDataSpec'{..}
          = object
              ["DataSchemaUri" .= _rDataSchemaURI,
               "DataSchema" .= _rDataSchema,
               "DataRearrangement" .= _rDataRearrangement,
               "DatabaseInformation" .= _rDatabaseInformation,
               "SelectSqlQuery" .= _rSelectSqlQuery,
               "DatabaseCredentials" .= _rDatabaseCredentials,
               "S3StagingLocation" .= _rS3StagingLocation,
               "ResourceRole" .= _rResourceRole,
               "ServiceRole" .= _rServiceRole,
               "SubnetId" .= _rSubnetId,
               "SecurityGroupIds" .= _rSecurityGroupIds]

-- | /See:/ 'rdsDatabase' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdsInstanceIdentifier'
--
-- * 'rdsDatabaseName'
data RDSDatabase = RDSDatabase'{_rdsInstanceIdentifier :: Text, _rdsDatabaseName :: Text} deriving (Eq, Read, Show)

-- | 'RDSDatabase' smart constructor.
rdsDatabase :: Text -> Text -> RDSDatabase
rdsDatabase pInstanceIdentifier pDatabaseName = RDSDatabase'{_rdsInstanceIdentifier = pInstanceIdentifier, _rdsDatabaseName = pDatabaseName};

-- | The ID of an RDS DB instance.
rdsInstanceIdentifier :: Lens' RDSDatabase Text
rdsInstanceIdentifier = lens _rdsInstanceIdentifier (\ s a -> s{_rdsInstanceIdentifier = a});

-- | FIXME: Undocumented member.
rdsDatabaseName :: Lens' RDSDatabase Text
rdsDatabaseName = lens _rdsDatabaseName (\ s a -> s{_rdsDatabaseName = a});

instance FromJSON RDSDatabase where
        parseJSON
          = withObject "RDSDatabase"
              (\ x ->
                 RDSDatabase' <$>
                   x .: "InstanceIdentifier" <*> x .: "DatabaseName")

instance ToJSON RDSDatabase where
        toJSON RDSDatabase'{..}
          = object
              ["InstanceIdentifier" .= _rdsInstanceIdentifier,
               "DatabaseName" .= _rdsDatabaseName]

-- | /See:/ 'rdsDatabaseCredentials' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdsUsername'
--
-- * 'rdsPassword'
data RDSDatabaseCredentials = RDSDatabaseCredentials'{_rdsUsername :: Text, _rdsPassword :: Text} deriving (Eq, Read, Show)

-- | 'RDSDatabaseCredentials' smart constructor.
rdsDatabaseCredentials :: Text -> Text -> RDSDatabaseCredentials
rdsDatabaseCredentials pUsername pPassword = RDSDatabaseCredentials'{_rdsUsername = pUsername, _rdsPassword = pPassword};

-- | FIXME: Undocumented member.
rdsUsername :: Lens' RDSDatabaseCredentials Text
rdsUsername = lens _rdsUsername (\ s a -> s{_rdsUsername = a});

-- | FIXME: Undocumented member.
rdsPassword :: Lens' RDSDatabaseCredentials Text
rdsPassword = lens _rdsPassword (\ s a -> s{_rdsPassword = a});

instance ToJSON RDSDatabaseCredentials where
        toJSON RDSDatabaseCredentials'{..}
          = object
              ["Username" .= _rdsUsername,
               "Password" .= _rdsPassword]

-- | /See:/ 'rdsMetadata' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rmDatabase'
--
-- * 'rmSelectSqlQuery'
--
-- * 'rmDataPipelineId'
--
-- * 'rmDatabaseUserName'
--
-- * 'rmResourceRole'
--
-- * 'rmServiceRole'
data RDSMetadata = RDSMetadata'{_rmDatabase :: Maybe RDSDatabase, _rmSelectSqlQuery :: Text, _rmDataPipelineId :: Text, _rmDatabaseUserName :: Text, _rmResourceRole :: Text, _rmServiceRole :: Text} deriving (Eq, Read, Show)

-- | 'RDSMetadata' smart constructor.
rdsMetadata :: Text -> Text -> Text -> Text -> Text -> RDSMetadata
rdsMetadata pSelectSqlQuery pDataPipelineId pDatabaseUserName pResourceRole pServiceRole = RDSMetadata'{_rmDatabase = Nothing, _rmSelectSqlQuery = pSelectSqlQuery, _rmDataPipelineId = pDataPipelineId, _rmDatabaseUserName = pDatabaseUserName, _rmResourceRole = pResourceRole, _rmServiceRole = pServiceRole};

-- | The database details required to connect to an Amazon RDS.
rmDatabase :: Lens' RDSMetadata (Maybe RDSDatabase)
rmDatabase = lens _rmDatabase (\ s a -> s{_rmDatabase = a});

-- | The SQL query that is supplied during CreateDataSourceFromRDS. Returns
-- only if @Verbose@ is true in @GetDataSourceInput@.
rmSelectSqlQuery :: Lens' RDSMetadata Text
rmSelectSqlQuery = lens _rmSelectSqlQuery (\ s a -> s{_rmSelectSqlQuery = a});

-- | The ID of the Data Pipeline instance that is used to carry to copy data
-- from Amazon RDS to Amazon S3. You can use the ID to find details about
-- the instance in the Data Pipeline console.
rmDataPipelineId :: Lens' RDSMetadata Text
rmDataPipelineId = lens _rmDataPipelineId (\ s a -> s{_rmDataPipelineId = a});

-- | FIXME: Undocumented member.
rmDatabaseUserName :: Lens' RDSMetadata Text
rmDatabaseUserName = lens _rmDatabaseUserName (\ s a -> s{_rmDatabaseUserName = a});

-- | The role (DataPipelineDefaultResourceRole) assumed by an Amazon EC2
-- instance to carry out the copy task from Amazon RDS to Amazon S3. For
-- more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates>
-- for data pipelines.
rmResourceRole :: Lens' RDSMetadata Text
rmResourceRole = lens _rmResourceRole (\ s a -> s{_rmResourceRole = a});

-- | The role (DataPipelineDefaultRole) assumed by the Data Pipeline service
-- to monitor the progress of the copy task from Amazon RDS to Amazon S3.
-- For more information, see
-- <http://docs.aws.amazon.com/datapipeline/latest/DeveloperGuide/dp-iam-roles.html Role templates>
-- for data pipelines.
rmServiceRole :: Lens' RDSMetadata Text
rmServiceRole = lens _rmServiceRole (\ s a -> s{_rmServiceRole = a});

instance FromJSON RDSMetadata where
        parseJSON
          = withObject "RDSMetadata"
              (\ x ->
                 RDSMetadata' <$>
                   x .:? "Database" <*> x .: "SelectSqlQuery" <*>
                     x .: "DataPipelineId"
                     <*> x .: "DatabaseUserName"
                     <*> x .: "ResourceRole"
                     <*> x .: "ServiceRole")

-- | /See:/ 'realtimeEndpointInfo' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'reiCreatedAt'
--
-- * 'reiEndpointURL'
--
-- * 'reiEndpointStatus'
--
-- * 'reiPeakRequestsPerSecond'
data RealtimeEndpointInfo = RealtimeEndpointInfo'{_reiCreatedAt :: Maybe POSIX, _reiEndpointURL :: Maybe Text, _reiEndpointStatus :: Maybe RealtimeEndpointStatus, _reiPeakRequestsPerSecond :: Maybe Int} deriving (Eq, Read, Show)

-- | 'RealtimeEndpointInfo' smart constructor.
realtimeEndpointInfo :: RealtimeEndpointInfo
realtimeEndpointInfo = RealtimeEndpointInfo'{_reiCreatedAt = Nothing, _reiEndpointURL = Nothing, _reiEndpointStatus = Nothing, _reiPeakRequestsPerSecond = Nothing};

-- | The time that the request to create the real-time endpoint for the
-- @MLModel@ was received. The time is expressed in epoch time.
reiCreatedAt :: Lens' RealtimeEndpointInfo (Maybe UTCTime)
reiCreatedAt = lens _reiCreatedAt (\ s a -> s{_reiCreatedAt = a}) . mapping _Time;

-- | The URI that specifies where to send real-time prediction requests for
-- the @MLModel@.
--
-- Note
--
-- The application must wait until the real-time endpoint is ready before
-- using this URI.
reiEndpointURL :: Lens' RealtimeEndpointInfo (Maybe Text)
reiEndpointURL = lens _reiEndpointURL (\ s a -> s{_reiEndpointURL = a});

-- | The current status of the real-time endpoint for the @MLModel@. This
-- element can have one of the following values:
--
-- -   NONE - Endpoint does not exist or was previously deleted.
-- -   READY - Endpoint is ready to be used for real-time predictions.
-- -   UPDATING - Updating\/creating the endpoint.
reiEndpointStatus :: Lens' RealtimeEndpointInfo (Maybe RealtimeEndpointStatus)
reiEndpointStatus = lens _reiEndpointStatus (\ s a -> s{_reiEndpointStatus = a});

-- | The maximum processing rate for the real-time endpoint for @MLModel@,
-- measured in incoming requests per second.
reiPeakRequestsPerSecond :: Lens' RealtimeEndpointInfo (Maybe Int)
reiPeakRequestsPerSecond = lens _reiPeakRequestsPerSecond (\ s a -> s{_reiPeakRequestsPerSecond = a});

instance FromJSON RealtimeEndpointInfo where
        parseJSON
          = withObject "RealtimeEndpointInfo"
              (\ x ->
                 RealtimeEndpointInfo' <$>
                   x .:? "CreatedAt" <*> x .:? "EndpointUrl" <*>
                     x .:? "EndpointStatus"
                     <*> x .:? "PeakRequestsPerSecond")

data RealtimeEndpointStatus = RESUpdating | RESReady | RESFailed | RESNone deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText RealtimeEndpointStatus where
    parser = takeLowerText >>= \case
        "FAILED" -> pure RESFailed
        "NONE" -> pure RESNone
        "READY" -> pure RESReady
        "UPDATING" -> pure RESUpdating
        e -> fail ("Failure parsing RealtimeEndpointStatus from " ++ show e)

instance ToText RealtimeEndpointStatus where
    toText = \case
        RESFailed -> "FAILED"
        RESNone -> "NONE"
        RESReady -> "READY"
        RESUpdating -> "UPDATING"

instance Hashable RealtimeEndpointStatus
instance ToQuery RealtimeEndpointStatus
instance ToHeader RealtimeEndpointStatus

instance FromJSON RealtimeEndpointStatus where
    parseJSON = parseJSONText "RealtimeEndpointStatus"

-- | /See:/ 'redshiftDataSpec' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdsDataSchemaURI'
--
-- * 'rdsDataSchema'
--
-- * 'rdsDataRearrangement'
--
-- * 'rdsDatabaseInformation'
--
-- * 'rdsSelectSqlQuery'
--
-- * 'rdsDatabaseCredentials'
--
-- * 'rdsS3StagingLocation'
data RedshiftDataSpec = RedshiftDataSpec'{_rdsDataSchemaURI :: Maybe Text, _rdsDataSchema :: Maybe Text, _rdsDataRearrangement :: Maybe Text, _rdsDatabaseInformation :: RedshiftDatabase, _rdsSelectSqlQuery :: Text, _rdsDatabaseCredentials :: RedshiftDatabaseCredentials, _rdsS3StagingLocation :: Text} deriving (Eq, Read, Show)

-- | 'RedshiftDataSpec' smart constructor.
redshiftDataSpec :: RedshiftDatabase -> Text -> RedshiftDatabaseCredentials -> Text -> RedshiftDataSpec
redshiftDataSpec pDatabaseInformation pSelectSqlQuery pDatabaseCredentials pS3StagingLocation = RedshiftDataSpec'{_rdsDataSchemaURI = Nothing, _rdsDataSchema = Nothing, _rdsDataRearrangement = Nothing, _rdsDatabaseInformation = pDatabaseInformation, _rdsSelectSqlQuery = pSelectSqlQuery, _rdsDatabaseCredentials = pDatabaseCredentials, _rdsS3StagingLocation = pS3StagingLocation};

-- | Describes the schema location for an Amazon Redshift @DataSource@.
rdsDataSchemaURI :: Lens' RedshiftDataSpec (Maybe Text)
rdsDataSchemaURI = lens _rdsDataSchemaURI (\ s a -> s{_rdsDataSchemaURI = a});

-- | Describes the schema for an Amazon Redshift @DataSource@.
rdsDataSchema :: Lens' RedshiftDataSpec (Maybe Text)
rdsDataSchema = lens _rdsDataSchema (\ s a -> s{_rdsDataSchema = a});

-- | Describes the splitting specifications for a @DataSource@.
rdsDataRearrangement :: Lens' RedshiftDataSpec (Maybe Text)
rdsDataRearrangement = lens _rdsDataRearrangement (\ s a -> s{_rdsDataRearrangement = a});

-- | Describes the @DatabaseName@ and @ClusterIdentifier@ for an Amazon
-- Redshift @DataSource@.
rdsDatabaseInformation :: Lens' RedshiftDataSpec RedshiftDatabase
rdsDatabaseInformation = lens _rdsDatabaseInformation (\ s a -> s{_rdsDatabaseInformation = a});

-- | Describes the SQL Query to execute on an Amazon Redshift database for an
-- Amazon Redshift @DataSource@.
rdsSelectSqlQuery :: Lens' RedshiftDataSpec Text
rdsSelectSqlQuery = lens _rdsSelectSqlQuery (\ s a -> s{_rdsSelectSqlQuery = a});

-- | Describes AWS Identity and Access Management (IAM) credentials that are
-- used connect to the Amazon Redshift database.
rdsDatabaseCredentials :: Lens' RedshiftDataSpec RedshiftDatabaseCredentials
rdsDatabaseCredentials = lens _rdsDatabaseCredentials (\ s a -> s{_rdsDatabaseCredentials = a});

-- | Describes an Amazon S3 location to store the result set of the
-- @SelectSqlQuery@ query.
rdsS3StagingLocation :: Lens' RedshiftDataSpec Text
rdsS3StagingLocation = lens _rdsS3StagingLocation (\ s a -> s{_rdsS3StagingLocation = a});

instance ToJSON RedshiftDataSpec where
        toJSON RedshiftDataSpec'{..}
          = object
              ["DataSchemaUri" .= _rdsDataSchemaURI,
               "DataSchema" .= _rdsDataSchema,
               "DataRearrangement" .= _rdsDataRearrangement,
               "DatabaseInformation" .= _rdsDatabaseInformation,
               "SelectSqlQuery" .= _rdsSelectSqlQuery,
               "DatabaseCredentials" .= _rdsDatabaseCredentials,
               "S3StagingLocation" .= _rdsS3StagingLocation]

-- | /See:/ 'redshiftDatabase' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdDatabaseName'
--
-- * 'rdClusterIdentifier'
data RedshiftDatabase = RedshiftDatabase'{_rdDatabaseName :: Text, _rdClusterIdentifier :: Text} deriving (Eq, Read, Show)

-- | 'RedshiftDatabase' smart constructor.
redshiftDatabase :: Text -> Text -> RedshiftDatabase
redshiftDatabase pDatabaseName pClusterIdentifier = RedshiftDatabase'{_rdDatabaseName = pDatabaseName, _rdClusterIdentifier = pClusterIdentifier};

-- | FIXME: Undocumented member.
rdDatabaseName :: Lens' RedshiftDatabase Text
rdDatabaseName = lens _rdDatabaseName (\ s a -> s{_rdDatabaseName = a});

-- | FIXME: Undocumented member.
rdClusterIdentifier :: Lens' RedshiftDatabase Text
rdClusterIdentifier = lens _rdClusterIdentifier (\ s a -> s{_rdClusterIdentifier = a});

instance FromJSON RedshiftDatabase where
        parseJSON
          = withObject "RedshiftDatabase"
              (\ x ->
                 RedshiftDatabase' <$>
                   x .: "DatabaseName" <*> x .: "ClusterIdentifier")

instance ToJSON RedshiftDatabase where
        toJSON RedshiftDatabase'{..}
          = object
              ["DatabaseName" .= _rdDatabaseName,
               "ClusterIdentifier" .= _rdClusterIdentifier]

-- | /See:/ 'redshiftDatabaseCredentials' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdcUsername'
--
-- * 'rdcPassword'
data RedshiftDatabaseCredentials = RedshiftDatabaseCredentials'{_rdcUsername :: Text, _rdcPassword :: Text} deriving (Eq, Read, Show)

-- | 'RedshiftDatabaseCredentials' smart constructor.
redshiftDatabaseCredentials :: Text -> Text -> RedshiftDatabaseCredentials
redshiftDatabaseCredentials pUsername pPassword = RedshiftDatabaseCredentials'{_rdcUsername = pUsername, _rdcPassword = pPassword};

-- | FIXME: Undocumented member.
rdcUsername :: Lens' RedshiftDatabaseCredentials Text
rdcUsername = lens _rdcUsername (\ s a -> s{_rdcUsername = a});

-- | FIXME: Undocumented member.
rdcPassword :: Lens' RedshiftDatabaseCredentials Text
rdcPassword = lens _rdcPassword (\ s a -> s{_rdcPassword = a});

instance ToJSON RedshiftDatabaseCredentials where
        toJSON RedshiftDatabaseCredentials'{..}
          = object
              ["Username" .= _rdcUsername,
               "Password" .= _rdcPassword]

-- | /See:/ 'redshiftMetadata' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'redRedshiftDatabase'
--
-- * 'redSelectSqlQuery'
--
-- * 'redDatabaseUserName'
data RedshiftMetadata = RedshiftMetadata'{_redRedshiftDatabase :: Maybe RedshiftDatabase, _redSelectSqlQuery :: Text, _redDatabaseUserName :: Text} deriving (Eq, Read, Show)

-- | 'RedshiftMetadata' smart constructor.
redshiftMetadata :: Text -> Text -> RedshiftMetadata
redshiftMetadata pSelectSqlQuery pDatabaseUserName = RedshiftMetadata'{_redRedshiftDatabase = Nothing, _redSelectSqlQuery = pSelectSqlQuery, _redDatabaseUserName = pDatabaseUserName};

-- | FIXME: Undocumented member.
redRedshiftDatabase :: Lens' RedshiftMetadata (Maybe RedshiftDatabase)
redRedshiftDatabase = lens _redRedshiftDatabase (\ s a -> s{_redRedshiftDatabase = a});

-- | The SQL query that is specified during CreateDataSourceFromRedshift.
-- Returns only if @Verbose@ is true in GetDataSourceInput.
redSelectSqlQuery :: Lens' RedshiftMetadata Text
redSelectSqlQuery = lens _redSelectSqlQuery (\ s a -> s{_redSelectSqlQuery = a});

-- | FIXME: Undocumented member.
redDatabaseUserName :: Lens' RedshiftMetadata Text
redDatabaseUserName = lens _redDatabaseUserName (\ s a -> s{_redDatabaseUserName = a});

instance FromJSON RedshiftMetadata where
        parseJSON
          = withObject "RedshiftMetadata"
              (\ x ->
                 RedshiftMetadata' <$>
                   x .:? "RedshiftDatabase" <*> x .: "SelectSqlQuery"
                     <*> x .: "DatabaseUserName")

-- | /See:/ 's3DataSpec' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'sdsDataSchema'
--
-- * 'sdsDataSchemaLocationS3'
--
-- * 'sdsDataRearrangement'
--
-- * 'sdsDataLocationS3'
data S3DataSpec = S3DataSpec'{_sdsDataSchema :: Maybe Text, _sdsDataSchemaLocationS3 :: Maybe Text, _sdsDataRearrangement :: Maybe Text, _sdsDataLocationS3 :: Text} deriving (Eq, Read, Show)

-- | 'S3DataSpec' smart constructor.
s3DataSpec :: Text -> S3DataSpec
s3DataSpec pDataLocationS3 = S3DataSpec'{_sdsDataSchema = Nothing, _sdsDataSchemaLocationS3 = Nothing, _sdsDataRearrangement = Nothing, _sdsDataLocationS3 = pDataLocationS3};

-- | Describes the schema for an Amazon S3 @DataSource@.
sdsDataSchema :: Lens' S3DataSpec (Maybe Text)
sdsDataSchema = lens _sdsDataSchema (\ s a -> s{_sdsDataSchema = a});

-- | Describes the schema Location in Amazon S3.
sdsDataSchemaLocationS3 :: Lens' S3DataSpec (Maybe Text)
sdsDataSchemaLocationS3 = lens _sdsDataSchemaLocationS3 (\ s a -> s{_sdsDataSchemaLocationS3 = a});

-- | Describes the splitting requirement of a @Datasource@.
sdsDataRearrangement :: Lens' S3DataSpec (Maybe Text)
sdsDataRearrangement = lens _sdsDataRearrangement (\ s a -> s{_sdsDataRearrangement = a});

-- | The location of the data file(s) used by a @DataSource@. The URI
-- specifies a data file or an Amazon Simple Storage Service (Amazon S3)
-- directory or bucket containing data files.
sdsDataLocationS3 :: Lens' S3DataSpec Text
sdsDataLocationS3 = lens _sdsDataLocationS3 (\ s a -> s{_sdsDataLocationS3 = a});

instance ToJSON S3DataSpec where
        toJSON S3DataSpec'{..}
          = object
              ["DataSchema" .= _sdsDataSchema,
               "DataSchemaLocationS3" .= _sdsDataSchemaLocationS3,
               "DataRearrangement" .= _sdsDataRearrangement,
               "DataLocationS3" .= _sdsDataLocationS3]

data SortOrder = Dsc | Asc deriving (Eq, Ord, Read, Show, Enum, Generic)

instance FromText SortOrder where
    parser = takeLowerText >>= \case
        "asc" -> pure Asc
        "dsc" -> pure Dsc
        e -> fail ("Failure parsing SortOrder from " ++ show e)

instance ToText SortOrder where
    toText = \case
        Asc -> "asc"
        Dsc -> "dsc"

instance Hashable SortOrder
instance ToQuery SortOrder
instance ToHeader SortOrder

instance ToJSON SortOrder where
    toJSON = toJSONText
