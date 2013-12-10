//
//  VIBasePickerViewController.m
//  ValetIt
//
//  Created by Vincil Bishop on 12/3/13.
//  Copyright (c) 2013 Valet-It. All rights reserved.
//

#import "VIBasePickerViewController.h"

@interface VIBasePickerViewController ()

// TODO: Add blocks for done / cancel / etc. to make this super generic

@end

@implementation VIBasePickerViewController

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
    // TODO: Make this execute a block
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction) donePressed:(id)sender
{
    // TODO: Make this execute a block
}

#pragma mark - UIPickerView Methods -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
