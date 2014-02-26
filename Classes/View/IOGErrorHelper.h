//
//  IOGErrorHelper.h
//  Pods
//
//  Created by Vincil Bishop on 2/26/14.
//
//

#import <Foundation/Foundation.h>

#define IOGErrorHelper_ErrorReceived_Notification @"IOGErrorHelper_ErrorReceived_Notification"

@interface IOGErrorHelper : NSObject

+ (IOGErrorHelper*) sharedHelper;

- (void) showErrorAlert:(NSError*)error;

@end
