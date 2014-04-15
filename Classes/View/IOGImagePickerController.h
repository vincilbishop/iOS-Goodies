//
//  IOGImagePickerController.h
//  Pods
//
//  Created by Vincil Bishop on 2/18/14.
//
//

#import <UIKit/UIKit.h>

typedef void (^IOGImagePickerBlock)(id sender, BOOL didPickImage, NSError *error, NSDictionary *info, UIImage *originalImage);

@interface IOGImagePickerController : UIImagePickerController<UIImagePickerControllerDelegate>

+ (void) presentPickerWithCompletion:(IOGImagePickerBlock)completionBlock;

@end
