//
//  IOGModalDatePickerView.h
//  CustomPicker
//
//

#import "IOGModalPickerBase.h"

@interface IOGModalDatePickerView : IOGModalPickerBase

@property (nonatomic, strong) NSDate *selectedDate;
@property (nonatomic) UIDatePickerMode mode;
@property (nonatomic) BOOL showTodayButton;


+ (IOGModalDatePickerView*) pickerWithDate:(NSDate*)date block:(IOGModalDatePickerViewCallback)callback;

/* Initializes a new instance of the date picker with the values to present to the user.
 (Note: call presentInView:withBlock: or presentInWindowWithBlock: to display the control)
 */
- (id)initWithDate:(NSDate *)date;


@end
