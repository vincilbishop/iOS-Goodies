//
//  VIBasePickerViewController.h
//  ValetIt
//
//  Created by Vincil Bishop on 12/3/13.
//  Copyright (c) 2013 Valet-It. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VIBasePickerViewController : UIViewController

@property (nonatomic,strong) NSArray *collection;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@end
