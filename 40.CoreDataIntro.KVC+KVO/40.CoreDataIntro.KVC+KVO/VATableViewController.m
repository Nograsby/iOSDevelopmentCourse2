//
//  VATableViewController.m
//  40.CoreDataIntro.KVC+KVO
//
//  Created by Vladimir Ananko on 1/13/17.
//  Copyright © 2017 Vladimir Ananko. All rights reserved.
//

#import "VATableViewController.h"
#import "Student.h"

@interface VATableViewController () <UITextFieldDelegate, UIPickerViewDelegate>

@property (strong, nonatomic) Student *student;

@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *gradeField;

@end

@implementation VATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Student *student = [[Student alloc] init];
    student.firstName = @"Boris";
    student.lastName = @"Ivanov";
    student.dateOfBirth = @"2000-01-10";
    student.genderType = VAGenderTypeMale;
    student.grade = 4.0;
    
    self.student = student;
    
    self.firstNameField.text = student.firstName;
    self.lastNameField.text = student.lastName;
    self.segmentedControl.selectedSegmentIndex = student.genderType;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.datePicker.date = [formatter dateFromString:student.dateOfBirth];
    self.gradeField.text = [NSString stringWithFormat:@"%f", student.grade];
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 0:
            self.student.firstName = textField.text;
            break;
        case 1:
            self.student.lastName = textField.text;
            break;
        case 2:
            self.student.grade = textField.text.floatValue;
            break;
        default:
            break;
    }
    NSLog(@"%@", self.student);
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField.tag == 0) || (textField.tag == 1)) {
        UITextField *nextTextField = (UITextField *)[self.view viewWithTag:(textField.tag + 1)];
        [nextTextField becomeFirstResponder];
        return YES;
    }
    else {
        [textField resignFirstResponder];
        return YES;
    }
}

- (IBAction)dateChanged:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.student.dateOfBirth = [formatter stringFromDate:self.datePicker.date];
    NSLog(@"%@", self.student);
}

- (IBAction)genderTypeChanged:(UISegmentedControl *)sender {
    self.student.genderType = sender.selectedSegmentIndex;
    NSLog(@"%@", self.student);

}

@end
