//
//  IOGBasePickerViewController.m
//  ValetIt
//
//  Created by Vincil Bishop on 12/3/13.
//  Copyright (c) 2013 All rights reserved.
//

#import "IOGBasePickerViewController.h"
#import "NSBundle+IOSGoodiesResourceBundle.h"

@interface IOGBasePickerViewController ()

// TODO: Add blocks for done / cancel / etc. to make this super generic

@end

@implementation IOGBasePickerViewController


#pragma mark - Convenience Class Methods -

+ (void) displayInViewController:(UIViewController*)viewController
                          titles:(NSArray*)titles
                            done:(IOGBasePickerView_DoneBlock)doneBlock
                          cancel:(IOGBasePickerView_CancelBlock)cancelBlock
{
    IOGBasePickerViewController *pickerViewController = [[IOGBasePickerViewController alloc] initWithNibName:@"IOGBasePickerViewController" bundle:[NSBundle IOSGoodiesResourceBundle]];

    pickerViewController.titles = titles;
    pickerViewController.doneBlock = doneBlock;
    pickerViewController.cancelBlock = cancelBlock;
    
    pickerViewController.pickerView.delegate = pickerViewController;
    pickerViewController.pickerView.dataSource = pickerViewController;
    
    [viewController presentViewController:pickerViewController animated:YES completion:nil];
    
    
}

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

#pragma mark - IBAction Methods -

- (IBAction) cancelPressed:(id)sender
{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    
}

- (IBAction) donePressed:(id)sender
{
    if (self.doneBlock) {
        
        NSInteger selectedIndex = [self.pickerView selectedRowInComponent:0];
        NSString *selectedTitle = self.titles[selectedIndex];
        self.doneBlock(selectedIndex,selectedTitle);
        
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - UIPickerView Data Source Methods -

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.titles count];
}

#pragma mark -UIPickerView Delegate Methods -

// these methods return either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component.
// for the view versions, we cache any hidden and thus unused views and pass them back for reuse.
// If you return back a different object, the old one will be released. the view will be centered in the row rect
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.titles[row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
