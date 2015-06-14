{-# LANGUAGE RecordWildCards   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE OverloadedStrings #-}

-- Module      : Network.AWS.Lambda.UpdateFunctionConfiguration
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

-- | Updates the configuration parameters for the specified Lambda function
-- by using the values provided in the request. You provide only the
-- parameters you want to change. This operation must only be used on an
-- existing Lambda function and cannot be used to update the function\'s
-- code.
--
-- This operation requires permission for the
-- @lambda:UpdateFunctionConfiguration@ action.
--
-- <http://docs.aws.amazon.com/lambda/latest/dg/API_UpdateFunctionConfiguration.html>
module Network.AWS.Lambda.UpdateFunctionConfiguration
    (
    -- * Request
      UpdateFunctionConfiguration
    -- ** Request constructor
    , updateFunctionConfiguration
    -- ** Request lenses
    , ufcRole
    , ufcHandler
    , ufcDescription
    , ufcFunctionName
    , ufcMemorySize
    , ufcTimeout

    -- * Response
    , FunctionConfiguration
    -- ** Response constructor
    , functionConfiguration
    -- ** Response lenses
    , fcRuntime
    , fcFunctionARN
    , fcRole
    , fcCodeSize
    , fcHandler
    , fcLastModified
    , fcDescription
    , fcMemorySize
    , fcFunctionName
    , fcTimeout
    ) where

import Network.AWS.Request
import Network.AWS.Response
import Network.AWS.Prelude
import Network.AWS.Lambda.Types

-- | /See:/ 'updateFunctionConfiguration' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'ufcRole'
--
-- * 'ufcHandler'
--
-- * 'ufcDescription'
--
-- * 'ufcFunctionName'
--
-- * 'ufcMemorySize'
--
-- * 'ufcTimeout'
data UpdateFunctionConfiguration = UpdateFunctionConfiguration'{_ufcRole :: Maybe Text, _ufcHandler :: Maybe Text, _ufcDescription :: Maybe Text, _ufcFunctionName :: Text, _ufcMemorySize :: Nat, _ufcTimeout :: Nat} deriving (Eq, Read, Show)

-- | 'UpdateFunctionConfiguration' smart constructor.
updateFunctionConfiguration :: Text -> Natural -> Natural -> UpdateFunctionConfiguration
updateFunctionConfiguration pFunctionName pMemorySize pTimeout = UpdateFunctionConfiguration'{_ufcRole = Nothing, _ufcHandler = Nothing, _ufcDescription = Nothing, _ufcFunctionName = pFunctionName, _ufcMemorySize = _Nat # pMemorySize, _ufcTimeout = _Nat # pTimeout};

-- | The Amazon Resource Name (ARN) of the IAM role that Lambda will assume
-- when it executes your function.
ufcRole :: Lens' UpdateFunctionConfiguration (Maybe Text)
ufcRole = lens _ufcRole (\ s a -> s{_ufcRole = a});

-- | The function that Lambda calls to begin executing your function. For
-- Node.js, it is the /module-name.export/ value in your function.
ufcHandler :: Lens' UpdateFunctionConfiguration (Maybe Text)
ufcHandler = lens _ufcHandler (\ s a -> s{_ufcHandler = a});

-- | A short user-defined function description. AWS Lambda does not use this
-- value. Assign a meaningful description as you see fit.
ufcDescription :: Lens' UpdateFunctionConfiguration (Maybe Text)
ufcDescription = lens _ufcDescription (\ s a -> s{_ufcDescription = a});

-- | The name of the Lambda function.
--
-- You can specify an unqualified function name (for example,
-- \"Thumbnail\") or you can specify Amazon Resource Name (ARN) of the
-- function (for example,
-- \"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\"). AWS Lambda
-- also allows you to specify only the account ID qualifier (for example,
-- \"account-id:Thumbnail\"). Note that the length constraint applies only
-- to the ARN. If you specify only the function name, it is limited to 64
-- character in length.
ufcFunctionName :: Lens' UpdateFunctionConfiguration Text
ufcFunctionName = lens _ufcFunctionName (\ s a -> s{_ufcFunctionName = a});

-- | The amount of memory, in MB, your Lambda function is given. AWS Lambda
-- uses this memory size to infer the amount of CPU allocated to your
-- function. Your function use-case determines your CPU and memory
-- requirements. For example, a database operation might need less memory
-- compared to an image processing function. The default value is 128 MB.
-- The value must be a multiple of 64 MB.
ufcMemorySize :: Lens' UpdateFunctionConfiguration Natural
ufcMemorySize = lens _ufcMemorySize (\ s a -> s{_ufcMemorySize = a}) . _Nat;

-- | The function execution time at which AWS Lambda should terminate the
-- function. Because the execution time has cost implications, we recommend
-- you set this value based on your expected execution time. The default is
-- 3 seconds.
ufcTimeout :: Lens' UpdateFunctionConfiguration Natural
ufcTimeout = lens _ufcTimeout (\ s a -> s{_ufcTimeout = a}) . _Nat;

instance AWSRequest UpdateFunctionConfiguration where
        type Sv UpdateFunctionConfiguration = Lambda
        type Rs UpdateFunctionConfiguration =
             FunctionConfiguration
        request = putJSON
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders UpdateFunctionConfiguration where
        toHeaders = const mempty

instance ToJSON UpdateFunctionConfiguration where
        toJSON UpdateFunctionConfiguration'{..}
          = object
              ["Role" .= _ufcRole, "Handler" .= _ufcHandler,
               "Description" .= _ufcDescription,
               "MemorySize" .= _ufcMemorySize,
               "Timeout" .= _ufcTimeout]

instance ToPath UpdateFunctionConfiguration where
        toPath UpdateFunctionConfiguration'{..}
          = mconcat
              ["/2015-03-31/functions/", toText _ufcFunctionName,
               "/versions/HEAD/configuration"]

instance ToQuery UpdateFunctionConfiguration where
        toQuery = const mempty
