//
//  IOGTwilioClient.h
//  Pods
//
//  Created by Vincil Bishop on 3/6/14.
//
//

#import <Foundation/Foundation.h>

@interface IOGTwilioClient : NSObject

@property (nonatomic,strong) TCDevice* device;
@property (nonatomic,strong) TCConnection* connection;

+ (void) setCapabilityToken:(NSString*)token;
+ (IOGTwilioClient*) sharedClient;

- (void) connect;
- (void) disconnect;

@end