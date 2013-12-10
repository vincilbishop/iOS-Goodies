//
//  IOGBasePickerViewController.h
//  ValetIt
//
//  Created by Vincil Bishop on 12/3/13.
//  Copyright (c) 2013 All rights reserved.
//

#import <UIKit/UIKit.h>

typedef id (^IOGBasePickerView_DataSourceBlock)();
typedef void (^IOGBasePickerView_DoneBlock)(NSInteger selectedIndex, NSString *selectedTitle);
typedef void (^IOGBasePickerView_CancelBlock)();

@interface IOGBasePickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,strong) NSArray *titles;
@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;

@property (nonatomic,copy) IOGBasePickerView_DoneBlock doneBlock;
@property (nonatomic,copy) IOGBasePickerView_CancelBlock cancelBlock;

+ (void) displayInViewController:(UIViewController*)viewController
                      titles:(NSArray*)titles
                            done:(IOGBasePickerView_DoneBlock)doneBlock
                          cancel:(IOGBasePickerView_CancelBlock)cancelBlock;

@end
