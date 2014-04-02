//
//  IOGErrorHelper.m
//  Pods
//
//  Created by Vincil Bishop on 2/26/14.
//
//

#import "IOGErrorHelper.h"
#import "UIAlertView+Blocks.h"

@implementation IOGErrorHelper

static IOGErrorHelper *_sharedHelper;

+ (IOGErrorHelper*) sharedHelper
{
    if (!_sharedHelper) {
        _sharedHelper = [[IOGErrorHelper alloc] init];
    }
    
    return _sharedHelper;
}

- (id) init
{
    self = [super init];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleError:) name:IOGErrorHelper_ErrorReceived_Notification object:nil];
    }
    
    return self;
}

#pragma mark - Helper -

- (void) showErrorAlert:(NSError*)error
{
    NSString *message = nil;
    
    if ([error.userInfo objectForKey:@"error"]) { // Parse Error
        message = [error.userInfo objectForKey:@"error"];
    } else if ([error.userInfo objectForKey:@"NSLocalizedRecoverySuggestion"]) {
        message = [error.userInfo objectForKey:@"NSLocalizedRecoverySuggestion"];
    } else {
        message = [error localizedDescription];
    }
    
    [UIAlertView showWithTitle:@"Error" message:message cancelButtonTitle:@"Ok" otherButtonTitles:nil tapBlock:NULL];
}

#pragma mark - Notification -

- (void) handleError:(NSNotification*)notification
{
    NSError *error = notification.object;
    
    [self showErrorAlert:error];
}

@end
