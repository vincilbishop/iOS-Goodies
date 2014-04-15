//
//  IOGImagePickerController.m
//  Pods
//
//  Created by Vincil Bishop on 2/18/14.
//
//

#import "IOGImagePickerController.h"
#import "UIApplication+IOG_Additions.h"
#import "UIActionSheet+Blocks.h"
#import "IOGCategories.h"

@interface IOGImagePickerController ()

@property (nonatomic,copy) IOGImagePickerBlock completionBlock;

@end

@implementation IOGImagePickerController

+ (void) presentPickerWithCompletion:(IOGImagePickerBlock)completionBlock
{
    [UIActionSheet showInView:[UIApplication sharedApplication].presentedViewController.view withTitle:@"Camera" cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@[@"Camera",@"Photo Album"] tapBlock:^(UIActionSheet *actionSheet, NSInteger buttonIndex) {
        
        IOGImagePickerController *imagePicker = [[IOGImagePickerController alloc] init];
        imagePicker.delegate = imagePicker;
        
        switch (buttonIndex) {
            case 0:{
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                break;

            }
            case 1:{
                //imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                break;
            }
            case 2:{
                
                if (completionBlock) {
                    completionBlock(self,NO,nil,nil,nil);
                }
                
                return;
            }
            default:
                break;
        }
        
        
        
        imagePicker.completionBlock = completionBlock;
        
        UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
        
        while (topController.presentedViewController) {
            topController = topController.presentedViewController;
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [[UIApplication sharedApplication].presentedViewController presentViewController:imagePicker animated:YES completion:NULL];

                   } afterDelay:.5];
        
    }];
        //[[[[UIApplication sharedApplication] delegate] window].rootViewController presentViewController:imagePicker animated:YES completion:NULL];
}

#pragma mark - UIImagePickerControllerDelegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            if (self.completionBlock) {
                self.completionBlock(self,YES,nil,info,info[UIImagePickerControllerOriginalImage]);
            }
        }];
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
        [self dismissViewControllerAnimated:YES completion:^{
            
            if (self.completionBlock) {
                self.completionBlock(self,NO,nil,nil,nil);
            }
        }];
    }];
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
