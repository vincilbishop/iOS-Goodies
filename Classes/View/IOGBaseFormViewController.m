//
//  IOGBaseFormViewController.m
//  Pods
//
//  Created by Vincil Bishop on 12/13/13.
//
//

#import "IOGBaseFormViewController.h"

@interface IOGBaseFormViewController ()

@end

@implementation IOGBaseFormViewController

static NSArray *_textFields;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Overrides -

- (NSArray*) textFields
{
    if (!_textFields) {
        
        
            
            _textFields = [[NSMutableArray alloc] init];
            
            for (UIView *view in self.view.subviews.reverseObjectEnumerator) {
                
                if ([view isKindOfClass:[UITextField class]]) {
                    
                    UITextField *textField = (UITextField*)view;
                    [_textFields addObject:textField];
                    
                }
                
            }
            
        
    }
    
    return _textFields;
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSInteger textFieldIndex = [self.textFields indexOfObject:textField];
    
    if (textFieldIndex < self.textFields.count - 1) {
        [(UITextField *)self.textFields[textFieldIndex + 1] becomeFirstResponder];
    } else {
        [textField resignFirstResponder];
    }
    
    return YES;
}

@end
