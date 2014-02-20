//
//  IOGImagePickerController.m
//  Pods
//
//  Created by Vincil Bishop on 2/18/14.
//
//

#import "IOGImagePickerController.h"
#import "UIApplication+IOG_Additions.h"

@interface IOGImagePickerController ()

@property (nonatomic,copy) IOGImagePickerBlock completionBlock;

@end

@implementation IOGImagePickerController

+ (void) presentPickerWithCompletion:(IOGImagePickerBlock)completionBlock
{
    IOGImagePickerController *imagePicker = [[IOGImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    imagePicker.completionBlock = completionBlock;
    
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    [[UIApplication sharedApplication].presentedViewController presentViewController:imagePicker animated:YES completion:NULL];
    
    //[[[[UIApplication sharedApplication] delegate] window].rootViewController presentViewController:imagePicker animated:YES completion:NULL];
}

#pragma mark - UIImagePickerControllerDelegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (self.completionBlock) {
        self.completionBlock(self,YES,info,info[UIImagePickerControllerOriginalImage]);
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if (self.completionBlock) {
        self.completionBlock(self,NO,nil,nil);
    }
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

@end
