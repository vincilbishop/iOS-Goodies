//
//  IOGBasePickerViewController.h
//  ValetIt
//
//  Created by Vincil Bishop on 12/3/13.
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSArray (^IOGBasePickerView_DataSourceBlock)();
typedef void (^IOGBasePickerView_DoneBlock)(id selectedObject);
typedef void (^IOGBasePickerView_CancelBlock)();

@interface IOGBasePickerViewController : UIViewController

@property (nonatomic,strong) NSArray *dataSource;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic,copy) IOGBasePickerView_DataSourceBlock dataSourceBlock;
@property (nonatomic,copy) IOGBasePickerView_DoneBlock doneBlock;
@property (nonatomic,copy) IOGBasePickerView_CancelBlock cancelBlock;

+ (void) displayInViewController:(UIViewController*)viewController
                      dataSource:(IOGBasePickerView_DataSourceBlock)dataSource
                            done:(IOGBasePickerView_DoneBlock)doneBlock
                          cancel:(IOGBasePickerView_CancelBlock)cancelBlock;

@end
