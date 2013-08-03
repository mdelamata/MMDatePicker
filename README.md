MMDatePicker
============

UIDatePicker subclas with a Toolbar with two buttons for Select and Dismiss the DaePicker.

How to use it? There's nothing to it, import the .h

    #import "MMDatePicker.h"

Then declare it as a property if you want to access to it properly:

    @property (nonatomic, strong) MMDatePicker *theDatePicker;

Instantiate it and add it to the desired view as normal:

    //creates and adds the datepicker at the edge of the application frame.
    self.theDatePicker = [[MMDatePicker alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] applicationFrame].size.height, self.view.frame.size.width, 260)];
    [self.view addSubview:self.theDatePicker];
    


Because the frame cannot be modified for UIDatePicker you could use this init method:

    self.theDatePicker = [[MMDatePicker alloc] initAtPosition:CGPointMake(0, [[UIScreen mainScreen] applicationFrame].size.height)];
    
    
 Delegate methods

MMDatePicker provides a protocol called MMDatePickerDelegate with the following methods:

    //triggered when the dismiss button is pressed
    -(void)didPressDismissButtonOfDatePicker:(MMDatePicker*)datePicker;
    
    //triggered when the select button is pressed. It will return the selected date.
    -(void)datePicker:(MMDatePicker*)datePicker didSelectDate:(NSDate*)date;
    
    
Customizing the DatePicker
_________________

Given the fact that this component is a Subclass of Apple's UIDatePicker, all methods are available described [here] [1] in Apple's Documentation.

  [1]: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIDatePicker_Class/Reference/UIDatePicker.html        "UIDatePicke Class Reference"




    
