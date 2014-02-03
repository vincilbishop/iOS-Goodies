//
//  IOGAWSS3Manager.m
//
//  Created by Vincil Bishop on 2/3/14.
//  Copyright (c) 2014 All rights reserved.
//

#import "IOGAWSS3Manager.h"

@interface IOGAWSS3Manager ()

@property (nonatomic,strong) AmazonS3Client *s3Client;
@property (nonatomic, strong) S3TransferManager *s3TransferManager;

@end

@implementation IOGAWSS3Manager

static IOGAWSS3Manager *_sharedManager;
static NSString *_accessKeyID;
static NSString *_secretKey;

+ (IOGAWSS3Manager*) sharedManager
{
    if (!_sharedManager) {
        _sharedManager = [[IOGAWSS3Manager alloc] init];
    }
    
    return _sharedManager;
}

+ (void) initSharedManagerWithAccessKeyID:(NSString*)accessKeyID secretKey:(NSString*)secretKey
{
    _accessKeyID = accessKeyID;
    _secretKey = secretKey;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

+ (void) setAccessKeyID:(NSString*)accessKeyID
{
    _accessKeyID = accessKeyID;
}

+ (void) setSecretKey:(NSString*)secretKey
{
    _secretKey = secretKey;
}

- (S3TransferManager*) s3TransferManager
{
    if (!_s3TransferManager) {
        // Initialize the S3 Client.
        AmazonS3Client *s3 = [[AmazonS3Client alloc] initWithAccessKey:_accessKeyID
                                                         withSecretKey:_secretKey];
        
        s3.endpoint = [AmazonEndpoints s3Endpoint:US_EAST_1];
        
        // Initialize the TransferManager
        _s3TransferManager = [S3TransferManager new];
        _s3TransferManager.s3 = s3;
        _s3TransferManager.delegate = self;
    }
    
    return _s3TransferManager;
}

#pragma mark - AmazonServiceRequestDelegate

-(void)request:(AmazonServiceRequest *)request didReceiveResponse:(NSURLResponse *)response
{

    DDLogVerbose(@"didReceiveResponse called: %@", response);

}

- (void)request:(AmazonServiceRequest *)request didReceiveData:(NSData *)data
{

    DDLogVerbose(@"%@",@"didReceiveData called");

}

-(void)request:(AmazonServiceRequest *)request didCompleteWithResponse:(AmazonServiceResponse *)response
{

    DDLogVerbose(@"didCompleteWithResponse called: %@", response);

}

-(void)request:(AmazonServiceRequest *)request didFailWithError:(NSError *)error
{

    DDLogVerbose(@"didFailWithError called: %@", error);

}

-(void)request:(AmazonServiceRequest *)request didFailWithServiceException:(NSException *)exception
{

    DDLogVerbose(@"didFailWithServiceException called: %@", exception);

}


@end
