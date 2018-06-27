//
//  ViewController.m
//  Tipster
//
//  Created by Jonathan Cabrera on 6/26/18.
//  Copyright © 2018 Jonathan Cabrera. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//(returnType)methodName:(argumentType)argumentName
- (IBAction)onTap:(id)sender {
    // Use NSLog to output to log
    NSLog(@"hello");
    //Goofy square brackets!
    //in swift booleans are YES and NO.
    
    //In Java: self.view.endEditing(YES);
    [self.view endEditing:YES];
}

//value changed by right clicking radio and dragging it into this function
- (IBAction)onEdit:(id)sender {
    
    double bill = [self.mealBillField.text doubleValue];
    
    //Creates an NSArray of NS numbers! lets get it!!!!
    NSArray* percentages = @[@(0.15), @(0.2), @(0.22)];
    
    //Gives the correct index of the selcted Segment section v
    //Similar to percentages[self.tipControl.selectedSegementIndex.doubleValue()
    //Converts to primiative double.
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]
                            doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

// Allows to change position when user edits textfield
- (IBAction)onEditingBegin:(id)sender {
    
    self.mealBillField.frame = CGRectMake(self.mealBillField.frame.origin.x, self.mealBillField.frame.origin.y + 30, self.mealBillField.frame.size.width, self.mealBillField.frame.size.height);
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -= 30;
    
    // LETS GIVE THIS SOME ANIMATIONS
    [UIView animateWithDuration:2 animations:^{
        self.mealBillField.frame = newFrame;
        self.tipLabel.alpha = 1;
    }];
}

@end
