//
//  IOGBaseFormViewController.h
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import <UIKit/UIKit.h>
#import "US2ValidatorUIDelegate.h"

@class RDVKeyboardAvoidingScrollView;
@class IOGBaseFormViewController;

typedef void (^IOGValidationCallback)(IOGBaseFormViewController *formViewController);

@interface IOGBaseFormViewController : UIViewController<US2ValidatorUIDelegate>

@property (strong, nonatomic) NSMutableArray *textFields;


@property (nonatomic) BOOL isValid;

@property (nonatomic,strong)  NSMutableString *errorString;

- (void) validateForm;
- (void) showAlertIfInvalidWithCompletion:(IOGValidationCallback)completion;

@end
