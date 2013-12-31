//
//  IOGModalPickerView.m
//  CustomPicker
//
//

#import "IOGModalPickerView.h"

@interface IOGModalPickerView ()

@property (nonatomic) NSUInteger indexSelectedBeforeDismissal;

@end

@implementation IOGModalPickerView

#pragma mark - Static Convenience Methods -

+ (IOGModalPickerView*) pickerWithValues:(NSArray*)values
                                  titles:(NSArray*)titles
                                   block:(IOGModalPickerViewCallback)callback
{
    IOGModalPickerView *picker = [[IOGModalPickerView alloc] initWithValues:values];
    picker.titles = titles;
    picker.picker.backgroundColor =[UIColor whiteColor];
    picker.callbackBlock = callback;
    [picker presentInWindow];
    
    return picker;
}

#pragma mark - Designated Initializer

- (id)initWithValues:(NSArray *)values {
    self = [super init];
    if (self) {
        self.titles = values;
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark - Custom Getters

- (UIView *)pickerWithFrame:(CGRect)pickerFrame {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:self.selectedIndex inComponent:0 animated:NO];
    return pickerView;
}

- (NSString *)selectedTitle {
    return [self.titles objectAtIndex:self.selectedIndex];
}

- (id)selectedValue {
    return [self.values objectAtIndex:self.selectedIndex];
}

#pragma mark - Custom Setters

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    if (_titles) {
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView reloadAllComponents];
            self.selectedIndex = 0;
        }
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    if (_selectedIndex != selectedIndex) {
        _selectedIndex = selectedIndex;
        if (self.picker) {
            UIPickerView *pickerView = (UIPickerView *)self.picker;
            [pickerView selectRow:selectedIndex inComponent:0 animated:YES];
        }
    }
}

- (void)setSelectedValue:(NSString *)selectedValue {
    NSInteger index = [self.titles indexOfObject:selectedValue];
    [self setSelectedIndex:index];
}

#pragma mark - Event Handler

- (void)onDone:(id)sender {
    self.selectedIndex = self.indexSelectedBeforeDismissal;
    [super onDone:sender];
}

#pragma mark - Picker View Data Source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.titles.count;
}

#pragma mark - Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.titles objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.indexSelectedBeforeDismissal = row;
}

@end
