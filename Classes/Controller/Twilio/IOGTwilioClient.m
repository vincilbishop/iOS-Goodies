//
//  IOGTwilioClient.m
//  Pods
//
//  Created by Vincil Bishop on 3/6/14.
//
//

#import "IOGTwilioClient.h"

@implementation IOGTwilioClient

static IOGTwilioClient *_sharedClient;
static NSString *_capabilityToken;

+ (IOGTwilioClient*) sharedClient
{
    if (!_sharedClient) {
        _sharedClient = [[IOGTwilioClient alloc] init];
    }
    
    return _sharedClient;
}

+ (void) setCapabilityToken:(NSString*)token
{
    _capabilityToken = token;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        
        DDLogVerbose(@"CapabilityToken: %@",_capabilityToken);
        
        self.device = [[TCDevice alloc] initWithCapabilityToken:_capabilityToken delegate:nil];
    }
    
    
    return self;
}

- (void) connect
{
    self.connection = [self.device connect:nil delegate:nil];
}

- (void) disconnect
{
    [self.connection disconnect];
    self.connection = nil;
}

@end
