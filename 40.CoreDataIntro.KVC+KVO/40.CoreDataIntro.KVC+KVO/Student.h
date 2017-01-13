//
//  Student.h
//  40.CoreDataIntro.KVC+KVO
//
//  Created by Vladimir Ananko on 1/13/17.
//  Copyright © 2017 Vladimir Ananko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, VAGenderType) {
    VAGenderTypeMale,
    VAGenderTypeFemale
};

@interface Student : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSDate *dateOfBirth;
@property (assign, nonatomic) VAGenderType *genderType;
@property (assign, nonatomic) NSInteger grade;

@end
