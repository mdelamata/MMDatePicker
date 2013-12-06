MMDatePicker
============

UIDatePicker subclass with a Toolbar with two buttons for Select and Dismiss the DatePicker.

![alt tag](https://raw.github.com/mdelamata/MMDatePicker/master/MMDatePicker%20Demo/capture.png)


How to use it? There's nothing to it! Firstly, import the .h :

    #import "MMDatePicker.h"

Then declare it as a property if you want to access to it properly:

    @property (nonatomic, strong) MMDatePicker *theDatePicker;

Instantiate it and add it to the desired view as usual:

    //creates and adds the datepicker at the edge of the application frame.
    self.theDatePicker = [[MMDatePicker alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] applicationFrame].size.height, self.view.frame.size.width, 260)];
    [self.view addSubview:self.theDatePicker];
    
    
   
Delegate Methods
------------

TheMMDatePicker provides a protocol called MMDatePickerDelegate with the following methods:

    //triggered when the dismiss button is pressed
    -(void)didPressDismissButtonOfDatePicker:(MMDatePicker*)datePicker;
    
    //triggered when the select button is pressed. It will return the selected date.
    -(void)datePicker:(MMDatePicker*)datePicker didSelectDate:(NSDate*)date;
    
   
Customizing MMDatePicker
------------

It has a UIDatePicker as a property called `datePicker`, all methods are available described [here] [1] in Apple's Documentation.
[1]: http://developer.apple.com/library/ios/#documentation/uikit/reference/UIDatePicker_Class/Reference/UIDatePicker.html        "UIDatePicker Class Reference"



Also you can access to the following additional properties:

* cancelTitleButton -> Title of dismiss/cancel button.
* acceptTitleButton -> Title of accept or select button.
* toolBarStyle -> UIBarStyle parameter.
 





    
