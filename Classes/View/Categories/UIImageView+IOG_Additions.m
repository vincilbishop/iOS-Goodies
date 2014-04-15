//
//  UIImageView+IOG_Additions.m
//  Pods
//
//  Created by Vincil Bishop on 2/20/14.
//
//

#import "UIImageView+IOG_Additions.h"

@implementation UIImageView (IOG_Additions)

- (void) showPlaceholderImage
{
    self.image = [UIImageView placeholderImage];
}

+ (UIImage*) placeholderImage
{
    return [UIImage imageNamed:@"IOGPlaceholderImage.png"];;
}

@end
