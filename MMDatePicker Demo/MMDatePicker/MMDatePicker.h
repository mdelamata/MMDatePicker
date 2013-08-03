//
//  MMDatePickerView.h
//  MMDatePicker
//
//  Created by Manuel de la Mata Sáez on 02/08/13.
//  Copyright (c) 2013 mms. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDatePicker;

@protocol MMDatePickerDelegate <NSObject>

-(void)didPressDismissButtonOfDatePicker:(MMDatePicker*)datePicker;
-(void)datePicker:(MMDatePicker*)datePicker didSelectDate:(NSDate*)date;

@end

@interface MMDatePicker : UIDatePicker

@property(nonatomic, strong) NSString *cancelTitleButton;
@property(nonatomic, strong) NSString *acceptTitleButton;
@property(nonatomic, strong) UIFont *toolBarFont;

@property(nonatomic, assign) UIBarStyle toolBarStyle;
@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) IBOutlet id<MMDatePickerDelegate>delegate;

@end
