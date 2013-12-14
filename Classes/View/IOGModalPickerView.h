//
//  IOGModalPickerView.h
//  CustomPicker
//
//

#import <UIKit/UIKit.h>
#import "IOGModalPickerBase.h"

@interface IOGModalPickerView : IOGModalPickerBase <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, strong) NSString *selectedValue;
@property (nonatomic, strong) NSArray *values;

+ (IOGModalPickerView*) pickerWithValues:(NSArray*)values block:(IOGModalPickerViewCallback)callback;

/* Initializes a new instance of the picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithValues:(NSArray *)values;

@end
