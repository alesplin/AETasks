//
//  AETasksTests.m
//  AETasksTests
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import "AETasksTests.h"


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
    [tn1 release];
    [tn2 release];
    [tn3 release];
    [tn4 release];
    [tn5 release];
    
    [tag1 release];
    [tag2 release];
    [tag3 release];
    [tag4 release];
    [tag5 release];
    
    [tc1 release];
    [tc2 release];
    [tc3 release];
    [tc4 release];
    
    [nowDate release];
    [fd1 release];
    [fd2 release];
    [fd3 release];
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in AETasksTests");
}

@end
