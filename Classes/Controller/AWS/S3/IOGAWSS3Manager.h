//
//  IOGAWSS3Manager.h
//
//  Created by Vincil Bishop on 2/3/14.
//  Copyright (c) 2014 All rights reserved.
//

#import <Foundation/Foundation.h>

// Runtime
#import "AmazonAbstractJsonWebServiceClient.h"
#import "AmazonAbstractWebServiceClient.h"
#import "AmazonAuthUtils.h"
#import "AmazonClientException.h"
#import "AmazonCredentials.h"
#import "AmazonCredentialsProvider.h"
#import "AmazonEndpoints.h"
#import "AmazonErrorHandler.h"
#import "AmazonJSON.h"
#import "AmazonLogger.h"
#import "AmazonMD5Util.h"
#import "AmazonRequestDelegate.h"
#import "AmazonSDKUtil.h"
#import "AmazonServiceException.h"
#import "AmazonServiceRequest.h"
#import "AmazonServiceRequestConfig.h"
#import "AmazonServiceResponse.h"
#import "AmazonSignatureException.h"
#import "AmazonStaticCredentialsProvider.h"
#import "AmazonURLRequest.h"
#import "AmazonWebServiceClient.h"
#import "AWS_SBJson.h"

// S3
#import "AmazonS3Client.h"
#import "S3TransferManager.h"

@interface IOGAWSS3Manager : NSObject<AmazonServiceRequestDelegate>

+ (IOGAWSS3Manager*) sharedManager;

+ (void) initSharedManagerWithAccessKeyID:(NSString*)accessKeyID secretKey:(NSString*)secretKey;

- (S3TransferManager*) s3TransferManager;

- (void) setAccessKeyID:(NSString*)accessKeyID;
- (void) setSecretKey:(NSString*)secretKey;

@end
