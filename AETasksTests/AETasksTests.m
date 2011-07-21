//
//  AETasksTests.m
//  AETasksTests
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import "AETasksTests.h"
#import "AETask.h"


@implementation AETasksTests

- (void)setUp
{
    [super setUp];
    
    tn1 = [NSString stringWithFormat:@"task1"];
    tn2 = [NSString stringWithFormat:@"task2"];
    tn3 = [NSString stringWithFormat:@"task3"];
    tn4 = [NSString stringWithFormat:@"task4"];
    tn5 = [NSString stringWithFormat:@"task5"];
    
    tag1 = [NSString stringWithFormat:@"tag1"];
    tag2 = [NSString stringWithFormat:@"tag2"];
    tag3 = [NSString stringWithFormat:@"tag3"];
    tag4 = [NSString stringWithFormat:@"tag4"];
    tag5 = [NSString stringWithFormat:@"tag5"];
    
    tl1 = [NSMutableArray arrayWithObjects:tag1,tag2,tag3,tag4,tag5, nil];
    tl2 = [NSMutableArray arrayWithObjects:tag1,tag3,tag5, nil];
    tl3 = [NSMutableArray arrayWithObjects:tag2,tag4, nil];
    tl4 = [NSMutableArray arrayWithObjects:tag1,tag2,tag3,tag5, nil];
    
    tc1 = [NSString stringWithFormat:@"category1"];
    tc2 = [NSString stringWithFormat:@"category2"];
    tc3 = [NSString stringWithFormat:@"category3"];
    tc4 = [NSString stringWithFormat:@"category4"];
    
    nowDate = [NSDate date];
    fd1 = [NSDate dateWithTimeIntervalSinceNow:3600];       /* 1 hour in future */
    fd2 = [NSDate dateWithTimeIntervalSinceNow:3600*24];    /* 1 day in future */
    fd3 = [NSDate dateWithTimeIntervalSinceNow:3600*18];    /* 18 hours in future */
}

- (void)tearDown
{    
    [super tearDown];
}

- (void)testInit {
    task1 = [[AETask alloc] initWithName:tn1];
    task2 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate];
    task3 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100];
    task4 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100 
                                 TagList:tl1];
    task5 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100 
                                 TagList:tl1 
                                   State:AETStateInProgress];
    task6 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100 
                                 TagList:tl1 
                                   State:AETStateInProgress 
                                Category:tc1];
    
    STAssertEqualObjects(task1.name, 
                   tn1, 
                   @"Expected: %@ Actual: %@",
                   tn1,task1.name);
    STAssertTrue(task1.priority == NO_PRIORITY, 
                 @"Expected: %d Actual: %d", NO_PRIORITY,task1.priority);
    STAssertTrue([task1.dueDate isEqualToDate:[NSDate distantFuture]], 
                 @"Expcted: %@ Actual: %@", [NSDate distantFuture], task1.dueDate);
    STAssertTrue((task1.tagList != nil) && ([task1.tagList count] == 0), 
                 @"task1.tagList nil or has items...");
    STAssertTrue(task1.state == AETStateNone, 
                 @"Expected: %d Actual: %d", AETStateNone,task1.state);
    STAssertTrue([task1.category isEqualToString:@"None"], 
                 @"Expected: %@ Actual: %@", @"None",task1.category);
    STAssertEqualObjects(task2.dueDate, 
                   nowDate, 
                   @"Expected: %@ Actual: %@", 
                   nowDate,task2.dueDate);
    STAssertEquals(task3.priority, 
                   100, 
                   @"Expected: %d Actual: %d", 
                   100,task3.priority);
    
    for (int i = 0; i < [task4.tagList count]; i++) {
        NSString *actual = [task4.tagList objectAtIndex:i];
        NSString *expected = [tl1 objectAtIndex:i];
        STAssertEqualObjects(actual, expected, @"Expected: %@ Actual: %@", expected,actual);
    }
    
    STAssertEquals(task5.state, 
                   AETStateInProgress, 
                   @"Expected: %d Actual: %d", 
                   AETStateInProgress,task5.state);
    STAssertEqualObjects(task6.category, 
                   tc1, 
                   @"Expected:%@ Actual: %@", 
                   tc1,task6.category);
}

- (void) testClassInit {
    task1 = [AETask taskWithName:tn1];
    task2 = [AETask taskWithName:tn1 
                         DueDate:nowDate];
    task3 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100];
    task4 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl1];
    task5 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl1 
                           State:AETStateInProgress];
    task6 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl1 
                           State:AETStateInProgress 
                        Category:tc1];
    
    STAssertEqualObjects(task1.name, 
                   tn1, 
                   @"Expected: %@ Actual: %@",
                   tn1,task1.name);
    STAssertTrue(task1.priority == NO_PRIORITY, 
                 @"Expected: %d Actual: %d", NO_PRIORITY,task1.priority);
    STAssertTrue([task1.dueDate isEqualToDate:[NSDate distantFuture]], 
                 @"Expcted: %@ Actual: %@", [NSDate distantFuture], task1.dueDate);
    STAssertTrue((task1.tagList != nil) && ([task1.tagList count] == 0), 
                 @"task1.tagList nil or has items...");
    STAssertTrue(task1.state == AETStateNone, 
                 @"Expected: %d Actual: %d", AETStateNone,task1.state);
    STAssertTrue([task1.category isEqualToString:@"None"], 
                 @"Expected: %@ Actual: %@", @"None",task1.category);
    STAssertEqualObjects(task2.dueDate, 
                   nowDate, 
                   @"Expected: %@ Actual: %@", 
                   nowDate,task2.dueDate);
    STAssertEquals(task3.priority, 
                   100, 
                   @"Expected: %d Actual: %d", 
                   100,task3.priority);
    
    for (int i = 0; i < [task4.tagList count]; i++) {
        NSString *actual = [task4.tagList objectAtIndex:i];
        NSString *expected = [tl1 objectAtIndex:i];
        STAssertEqualObjects(actual, expected, @"Expected: %@ Actual: %@", expected,actual);
    }
    
    STAssertEquals(task5.state, 
                   AETStateInProgress, 
                   @"Expected: %d Actual: %d", 
                   AETStateInProgress,task5.state);
    STAssertEqualObjects(task6.category, 
                   tc1, 
                   @"Expected:%@ Actual: %@", 
                   tc1,task6.category);
}

- (void) testTaskCopy {
    task1 = [AETask taskWithName:tn1];
    task2 = [task1 copy];
    
    STAssertEqualObjects(task2.name, 
                   task1.name, 
                   @"Expected: %@ Actual: %@",
                   task1.name,task2.name);
    STAssertTrue(task2.priority == NO_PRIORITY, 
                 @"Expected: %d Actual: %d", NO_PRIORITY,task2.priority);
    STAssertTrue([task2.dueDate isEqualToDate:[NSDate distantFuture]], 
                 @"Expcted: %@ Actual: %@", [NSDate distantFuture], task1.dueDate);
    STAssertTrue((task2.tagList != nil) && ([task2.tagList count] == 0), 
                 @"task1.tagList nil or has items...");
    STAssertTrue(task2.state == AETStateNone, 
                 @"Expected: %d Actual: %d", AETStateNone,task2.state);
    STAssertTrue([task2.category isEqualToString:@"None"], 
                 @"Expected: %@ Actual: %@", @"None",task2.category);
    
    task3 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl1 
                           State:AETStateInProgress 
                        Category:tc1];
    task4 = [task3 copy];
    
    STAssertEqualObjects(task3.name,
                   task4.name,
                   @"Expected: %@ Actual: %@",
                   task3.name,task4.name);
    STAssertTrue(task4.priority == task3.priority, 
                 @"Expected: %d Actual: %d", task3.priority,task4.priority);
    STAssertEqualObjects(task4.dueDate,
                   task3.dueDate, 
                   @"Expected: %@ Actual: %@",
                   task3.dueDate,task4.dueDate);
}

- (void) testTaskIsEqual {
    task1 = [AETask taskWithName:tn1 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl2 
                           State:AETStateInProgress 
                        Category:tc1];
    task2 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100 
                                 TagList:tl2 
                                   State:AETStateInProgress 
                                Category:tc1];
    task3 = [[AETask alloc] initWithName:tn1 
                                 DueDate:fd2 
                                Priority:100 
                                 TagList:tl2 
                                   State:AETStateInProgress 
                                Category:tc1];
    task4 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:100 
                                 TagList:tl2 
                                   State:AETStateInProgress 
                                Category:tc2];
    task5 = [[AETask alloc] initWithName:tn1 
                                 DueDate:nowDate 
                                Priority:0 
                                 TagList:nil 
                                   State:AETStateNone 
                                Category:tc1];
    task6 = [AETask taskWithName:tn2 
                         DueDate:nowDate 
                        Priority:100 
                         TagList:tl2 
                           State:AETStateInProgress 
                        Category:tc1];
    
    STAssertTrue([task1 isEqualToTask:task2], @"Expected: %d, Actual: %d", YES,NO);
    STAssertTrue([task1 isEqualToTask:task5], @"Expected: %d, Actual: %d", YES,NO);
    
    STAssertFalse([task1 isEqualToTask:task3], @"Expected %d, Actual: %d", YES,NO);
    STAssertFalse([task1 isEqualToTask:task4], @"Expected %d, Actual: %d", YES,NO);
    STAssertFalse([task1 isEqualToTask:task6], @"Expected %d, Actual: %d", YES,NO);
    
}

@end






















