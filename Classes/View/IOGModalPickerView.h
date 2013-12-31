//
//  IOGModalPickerView.h
//  CustomPicker
//
//

#import <UIKit/UIKit.h>
#import "IOGModalPickerBase.h"

@interface IOGModalPickerView : IOGModalPickerBase <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) NSUInteger selectedIndex;
@property (nonatomic, strong) id selectedValue;
@property (nonatomic, strong) NSString *selectedTitle;
@property (nonatomic, strong) NSArray *titles;

+ (IOGModalPickerView*) pickerWithValues:(NSArray*)values
                                  titles:(NSArray*)titles
                                   block:(IOGModalPickerViewCallback)callback;

/* Initializes a new instance of the picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithTitles:(NSArray *)values;

@end
