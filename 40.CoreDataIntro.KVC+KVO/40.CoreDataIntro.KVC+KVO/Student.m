//
//  Student.m
//  40.CoreDataIntro.KVC+KVO
//
//  Created by Vladimir Ananko on 1/13/17.
//  Copyright © 2017 Vladimir Ananko. All rights reserved.
//

#import "Student.h"

@implementation Student

- (NSString *)description {
    return [NSString stringWithFormat:@"\nfirstName - %@,\nlastName - %@,\ndateOfBirth - %@,\ngenderType - %d,\ngrade - %f,", _firstName, _lastName, _dateOfBirth, _genderType, _grade];
}

@end
