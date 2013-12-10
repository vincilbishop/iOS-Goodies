//
//  NSBundle+IOSGoodiesResourceBundle.m
//  Pods
//
//  Created by Vincil Bishop on 12/10/13.
//
//

#import "NSBundle+IOSGoodiesResourceBundle.h"

@implementation NSBundle (IOSGoodiesResourceBundle)

+ (NSBundle*) IOSGoodiesResourceBundle
{
    NSURL *urlForResource = [[NSBundle mainBundle] URLForResource:@"IOSGoodiesResources" withExtension:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithURL:urlForResource];
    return resourceBundle;
}

@end
