//
//  UIApplication+IOG_Additions.m
//  Pods
//
//  Created by Vincil Bishop on 2/19/14.
//
//

#import "UIApplication+IOG_Additions.h"

@implementation UIApplication (IOG_Additions)

- (UIViewController*) presentedViewController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end
