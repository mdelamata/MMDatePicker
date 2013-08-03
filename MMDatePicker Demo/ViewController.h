//
//  ViewController.h
//  MMDatePicker Demo
//
//  Created by Manuel de la Mata Sáez on 02/08/13.
//  Copyright (c) 2013 mms. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDatePicker.h"

@interface ViewController : UIViewController<MMDatePickerDelegate>
@property (nonatomic, strong) MMDatePicker *theDatePicker;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

- (IBAction)displayDatePickerPressed:(id)sender;
@end
