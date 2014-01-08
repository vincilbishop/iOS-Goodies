//
//  IOGLocationController.m
//  Pods
//
//  Created by Vincil Bishop on 1/8/14.
//
//

#import "IOGLocationController.h"

@implementation IOGLocationController

static IOGLocationController *_sharedController;

+ (IOGLocationController*) sharedController
{
    if (!_sharedController) {
        _sharedController = [[IOGLocationController alloc] init];
    }
    
    return _sharedController;
}

@end
