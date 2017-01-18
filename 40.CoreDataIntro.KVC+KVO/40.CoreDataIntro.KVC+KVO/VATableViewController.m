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
    
    [self addObserver:self
           forKeyPath:@"student.firstName"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    [self addObserver:self
           forKeyPath:@"student.lastName"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    [self addObserver:self
           forKeyPath:@"student.dateOfBirth"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    [self addObserver:self
           forKeyPath:@"student.genderType"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    [self addObserver:self
           forKeyPath:@"student.grade"
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:nil];
    
    [self reloadData];
    
    [NSTimer scheduledTimerWithTimeInterval:5.f repeats:NO block:^(NSTimer * _Nonnull timer) {
        [student resetProperties];
    }];
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"student.firstName"];
    [self removeObserver:self forKeyPath:@"student.lastName"];
    [self removeObserver:self forKeyPath:@"student.dateOfBirth"];
    [self removeObserver:self forKeyPath:@"student.genderType"];
    [self removeObserver:self forKeyPath:@"student.grade"];
}

- (void)reloadData {
    self.firstNameField.text = self.student.firstName;
    self.lastNameField.text = self.student.lastName;
    self.segmentedControl.selectedSegmentIndex = self.student.genderType;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.datePicker.date = [formatter dateFromString:self.student.dateOfBirth];
    self.gradeField.text = [NSString stringWithFormat:@"%f", self.student.grade];
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

#pragma mark - Actions

- (IBAction)dateChanged:(UIDatePicker *)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.student.dateOfBirth = [formatter stringFromDate:self.datePicker.date];
}

- (IBAction)genderTypeChanged:(UISegmentedControl *)sender {
    self.student.genderType = sender.selectedSegmentIndex;
}

#pragma mark - Observer

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    NSLog(@"\nProperty - %@. \nChanged from - %@ to - %@", keyPath, change[@"old"], change[@"new"]);
    [self reloadData];
}

@end
