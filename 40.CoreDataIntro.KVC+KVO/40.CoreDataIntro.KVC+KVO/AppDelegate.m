//
//  AppDelegate.m
//  40.CoreDataIntro.KVC+KVO
//
//  Created by Vladimir Ananko on 1/13/17.
//  Copyright © 2017 Vladimir Ananko. All rights reserved.
//
//
//Ученик.
//
//1. Создайте класс студента с пропертисами firstName, lastName, dateOfBirth, gender, grade
//2. Также создайте статическую таблицу куда все эти данные выводятся и где их можно менять (с текст филдами, сенгментед контролами и тд)
//3. Пропертисы вашего студента меняйте тем же образом что и в предыдущих уроках (через делегаты и акшины)
//
//Студент.
//
//4. Повесте обсервера на все пропертисы студента и выводите в консоль каждый раз, когда проперти меняется
//5. Также сделайте метод "сброс", который сбрасывает все пропертисы, а в самом методе не используйте сеттеры, сделайте все через айвары, но сделайте так, чтобы обсервер узнал когда и что меняется. (типо как в уроке)
//
//Мастер.
//
//забудьте про UI
//
//6. Создайте несколько студентов и положите их в массив, но обсервер оставьте только на одном из них
//7. У студентов сделайте weak проперти "friend". Сделайте цепочку из нескольких студентов, чтобы один был друг второму, второй третьему, тот четвертому, а тот первому :)
//8. Используя метод setValue: forKeyPath: начните с одного студента (не того, что с обсервером) и переходите на его друга, меняя ему проперти, потом из того же студента на друга его друга и тд (то есть путь для последнего студента получится очень длинный)
//9. Убедитесь что на каком-то из друзей, когда меняется какой-то проперти, срабатывает ваш обсервер
//
//Супермен
//
//10. Добавьте побольше студентов
//11. Используя операторы KVC создайте массив имен всех студентов
//12. Определите саммый поздний и саммый ранний годы рождения
//13. Определите сумму всех баллов студентов и средний бал всех студентов
//

#import "AppDelegate.h"
#import "Student.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    Student *student1 = [[Student alloc] init];
    student1.firstName = @"Boris";
    student1.lastName = @"Ivanov";
    student1.dateOfBirth = @"2000-01-10";
    student1.genderType = VAGenderTypeMale;
    student1.grade = 4.0;
    
    Student *student2 = [[Student alloc] init];
    student2.firstName = @"Igor";
    student2.lastName = @"Bobrov";
    student2.dateOfBirth = @"1985-01-12";
    student2.genderType = VAGenderTypeMale;
    student2.grade = 3.5;
    
    Student *student3 = [[Student alloc] init];
    student3.firstName = @"Masha";
    student3.lastName = @"Petrova";
    student3.dateOfBirth = @"1987-05-07";
    student3.genderType = VAGenderTypeFemale;
    student3.grade = 4.5;
    
    Student *student4 = [[Student alloc] init];
    student4.firstName = @"Petr";
    student4.lastName = @"Fedorov";
    student4.dateOfBirth = @"1968-04-04";
    student4.genderType = VAGenderTypeMale;
    student4.grade = 3.0;
    
    student1.friend = student2;
    student2.friend = student3;
    student3.friend = student4;
    student4.friend = student1;

    NSMutableArray *studentsArray = [NSMutableArray arrayWithObjects:student1, student2, student3, student4, nil];
    for (Student *student in studentsArray) {
        [student.friend setValue:@2.1 forKeyPath:@"grade"];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
