//
//  MMDatePickerView.m
//  MMDatePicker Demo
//
//  Created by Manuel de la Mata Sáez on 02/08/13.
//  Copyright (c) 2013 mms. All rights reserved.
//

#import "MMDatePicker.h"

#define UIDATEPICKER_STANDARD_SIZE CGSizeMake(320,216)
#define TOOLBAR_STANDARD_SIZE CGSizeMake(320,44)

@interface MMDatePicker ()

@property(nonatomic, strong) UIToolbar *toolbar;
@property(nonatomic, strong) UIBarButtonItem *cancelButton;
@property(nonatomic, strong) UIBarButtonItem *acceptButton;

-(void)setDefaultConfig;
-(void)dismissButtonPressed;
-(void)acceptButtonPressed;

@end


@implementation MMDatePicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDefaultConfig];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setDefaultConfig];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //creates the toolbar
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, TOOLBAR_STANDARD_SIZE.height)];
    
    //moves all subviews to get some space for the toolbar
    for (UIView *v in self.subviews) {
        [v setFrame:CGRectMake(v.frame.origin.x, v.frame.origin.y+self.toolbar.frame.size.height, v.frame.size.width, v.frame.size.height)];
    }
    //now can add the toolbar
    [self addSubview:self.toolbar];

    //this is the tricky part. Because iOS newer versions no longer allows to change the frame of UIDatePicker
    //then calculates and provides the new height in another property.
    self.height = self.frame.size.height + self.toolbar.frame.size.height;
    
    
    //ATTEMPS TO CHANGE THE FRAME SIZE (NOT POSSIBLE AT THE MOMENT, TRY IT)
//    CGRect frame = self.frame;
//    frame.size.height += self.toolbar.frame.size.height;
//    [self setFrame:frame];
//
//    NSLog(@"sum %f, realFrame %f", frame.size.height, self.frame.size.height );
        
 
    //buttons of toolbar
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:self.cancelTitleButton style:UIBarButtonItemStyleBordered target:self action:@selector(dismissButtonPressed)];
    self.acceptButton = [[UIBarButtonItem alloc] initWithTitle:self.acceptTitleButton style:UIBarButtonItemStyleBordered target:self action:@selector(acceptButtonPressed)];

    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];

    //adds them
    [self.toolbar setItems:[NSArray arrayWithObjects:self.cancelButton,flexibleSpace,self.acceptButton, nil]];
    
}

//default configuration
-(void)setDefaultConfig{
    
    self.cancelTitleButton = @"Dismiss";
    self.acceptTitleButton = @"Select";
    
    self.toolBarStyle = UIBarStyleBlackTranslucent;
}


//customizing subviews
-(void)layoutSubviews{
    
    //customizes the toolbar
    [self.toolbar setBarStyle:self.toolBarStyle];
    
    //if there is a custom acceptTitleButton it will be set up
    if (self.acceptTitleButton) {
        [self.acceptButton setTitle:self.acceptTitleButton];
    }
    //if there is a custom  cancelTitleButton it will be set up    
    if (self.cancelTitleButton) {
        [self.cancelButton setTitle:self.cancelTitleButton];
    }
  
}

//Method that calls the delegate for dismissButton
-(void)dismissButtonPressed{
    if (self.delegate && [self.delegate respondsToSelector:@selector(didPressDismissButtonOfDatePicker:)]) {
        [self.delegate didPressDismissButtonOfDatePicker:self];
    }
}

//Method that calls the delegate for actionButton
-(void)acceptButtonPressed{
    if (self.delegate && [self.delegate respondsToSelector:@selector(datePicker:didSelectDate:)]) {
        [self.delegate datePicker:self didSelectDate:self.date];
    }
}
@end
