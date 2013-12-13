//
//  IOGBaseFormViewController.h
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import <UIKit/UIKit.h>

@interface IOGBaseFormViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *textFields;
@property (strong, nonatomic) IBOutlet RDVKeyboardAvoidingScrollView *scrollView;

@end
