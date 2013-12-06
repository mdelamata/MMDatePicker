//
//  MMDatePickerView.m
//  MMDatePicker Demo
//
//  Created by Manuel de la Mata Sáez on 02/08/13.
//  Copyright (c) 2013 mms. All rights reserved.
//

#import "MMDatePicker.h"

#define UIDATEPICKER_STANDARD_SIZE CGSizeMake(320,236)
#define TOOLBAR_STANDARD_SIZE CGSizeMake(320,44)

@interface MMDatePicker ()

@property(nonatomic, strong) UIToolbar *toolbar;
@property(nonatomic, strong) UIBarButtonItem *cancelButton;
@property(nonatomic, strong) UIBarButtonItem *acceptButton;

-(void)setDefaultConfig;
-(void)configureView;
-(void)dismissButtonPressed;
-(void)acceptButtonPressed;

@end


@implementation MMDatePicker

- (id)initAtPosition:(CGPoint)origin{
    
    self = [super initWithFrame:CGRectMake(origin.x, origin.y, self.frame.size.width, TOOLBAR_STANDARD_SIZE.height+UIDATEPICKER_STANDARD_SIZE.height)];
    if (self) {
        // Initialization code
        [self setDefaultConfig];
        [self configureView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setDefaultConfig];
        [self configureView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setDefaultConfig];
        [self configureView];
    }
    return self;
}


//
//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    
//    
//}

//default configuration
-(void)setDefaultConfig{
    
    self.cancelTitleButton = @"Dismiss";
    self.acceptTitleButton = @"Select";
    
    self.toolBarStyle = UIBarStyleBlackTranslucent;
    
}

-(void)configureView{
    // Drawing code
    
    //creates the toolbar
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, TOOLBAR_STANDARD_SIZE.height)];
    
    //now can add the toolbar
    [self addSubview:self.toolbar];
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, TOOLBAR_STANDARD_SIZE.height, self.frame.size.width, UIDATEPICKER_STANDARD_SIZE.height)];
    //now can add the datePicker
    [self addSubview:self.datePicker];
    
    //buttons of toolbar
    self.cancelButton = [[UIBarButtonItem alloc] initWithTitle:self.cancelTitleButton style:UIBarButtonItemStyleBordered target:self action:@selector(dismissButtonPressed)];
    self.acceptButton = [[UIBarButtonItem alloc] initWithTitle:self.acceptTitleButton style:UIBarButtonItemStyleBordered target:self action:@selector(acceptButtonPressed)];
    
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //adds them
    [self.toolbar setItems:[NSArray arrayWithObjects:self.cancelButton,flexibleSpace,self.acceptButton, nil]];
    
    
    [self setBounds:CGRectMake(0,0, self.frame.size.width, TOOLBAR_STANDARD_SIZE.height+UIDATEPICKER_STANDARD_SIZE.height)];
    NSLog(@"%f,%f",self.frame.size.width,self.frame.size.height);

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
        [self.delegate datePicker:self didSelectDate:self.datePicker.date];
    }
}
@end
