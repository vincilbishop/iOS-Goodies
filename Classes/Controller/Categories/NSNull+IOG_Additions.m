//
//  NSNull+IOG_Additions.m
//  Pods
//
//  Created by Vincil Bishop on 2/18/14.
//
//

#import "NSNull+IOG_Additions.h"

@implementation NSNull (IOG_Additions)

+ (id) objectOrNull:(id)object
{
    if (object) {
        return object;
    } else {
        return [NSNull null];
    }
}

@end
