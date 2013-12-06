//
//  ViewController.m
//  MMDatePicker Demo
//
//  Created by Manuel de la Mata Sáez on 02/08/13.
//  Copyright (c) 2013 mms. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.theDatePicker = [[MMDatePicker alloc] initWithFrame:CGRectMake(0,
                                                                        [[UIScreen mainScreen] applicationFrame].size.height,
                                                                        [[UIScreen mainScreen] applicationFrame].size.width,
                                                                        400)]; //height is not important, it will be overwritten
    [self.theDatePicker setDelegate:self];
    [self.theDatePicker.datePicker setDatePickerMode:UIDatePickerModeDate];
    [self.theDatePicker setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.theDatePicker];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MMDatePickerDelegate Methods

-(void)didPressDismissButtonOfDatePicker:(MMDatePicker *)datePicker{
    NSLog(@">> Did press cancel Button...");
    
    [UIView animateWithDuration:0.3 animations:^{
        [datePicker setTransform:CGAffineTransformIdentity];
    }completion:^(BOOL finished) {
    }];
}

-(void)datePicker:(MMDatePicker *)datePicker didSelectDate:(NSDate *)date{
    NSLog(@">> Did press select Button... with date %@",date);
    [self.dateLabel setText:[NSString stringWithFormat:@"%@",date]];
}


#pragma mark - IBAction Methods

- (IBAction)displayDatePickerPressed:(id)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.theDatePicker setTransform:CGAffineTransformMakeTranslation(0, -self.theDatePicker.frame.size.height)];
    }completion:^(BOOL finished) {
    }];
    
}


@end
