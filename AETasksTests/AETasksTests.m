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
    
    STAssertEquals(task1.name, 
                   tn1, 
                   @"Expected: %@ Actual: %@",
                   tn1,task1.name);
    STAssertEquals(task2.dueDate, 
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
        STAssertEquals(actual, expected, @"Expected: %@ Actual: %@", expected,actual);
    }
    
    STAssertEquals(task5.state, 
                   AETStateInProgress, 
                   @"Expected: %d Actual: %d", 
                   AETStateInProgress,task5.state);
    STAssertEquals(task6.category, 
                   tc1, 
                   @"Expected:%@ Actual: %@", 
                   tc1,task6.category);
}

@end






















