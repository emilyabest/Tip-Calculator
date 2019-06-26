//
//  ViewController.m
//  Tip Calculator
//
//  Created by emilyabest on 6/25/19.
//  Copyright © 2019 emilyabest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// Close the keyboard when user taps anywhere on the screen
- (IBAction)onTap:(id)sender {
//    NSLog(@"Hello world");
    [self.view endEditing:YES];
}

// Take user's inputed bill and calculate/update tip/total
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

// Animation
- (IBAction)onEditingBegin:(id)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        // One way to change frames
        self.billField.frame = CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y + 30, self.billField.frame.size.width, self.billField.frame.size.height);
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 0;
    }];

}

// Animation
- (IBAction)onEditingEnd:(id)sender {
    // Another way to change frames (undoes action in onEditingBegin)
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billField.frame = newFrame;
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}

@end
