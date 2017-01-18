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

- (void)resetProperties {
    [self willChangeValueForKey:@"firstName"];
    _firstName = @"";
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _lastName = @"";
    [self didChangeValueForKey:@"lastName"];

    [self willChangeValueForKey:@"dateOfBirth"];
    _dateOfBirth = @"1980-01-01";
    [self didChangeValueForKey:@"dateOfBirth"];

    [self willChangeValueForKey:@"genderType"];
    _genderType = 0;
    [self didChangeValueForKey:@"genderType"];

    [self willChangeValueForKey:@"grade"];
    _grade = 0.f;
    [self didChangeValueForKey:@"grade"];
}

@end
