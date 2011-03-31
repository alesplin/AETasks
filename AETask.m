//
//  AETask.m
//  AETasks
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import "AETask.h"


@implementation AETask


#pragma mark Properties
@synthesize name=TaskName;
@synthesize priority=Priority;
@synthesize state=State;
@synthesize dueDate=DueDate;

/**
 Return a ", " delimited list of tags belonging to this task
 
 @param None
 @return NSString
 */
- (NSString *)tagList {
    int tIndex;
    
    NSMutableString *tl = [[NSString alloc] initWithFormat:@""];
    
    for (tIndex = 0; tIndex < [TagList count]; tIndex++) {
        
        [tl appendFormat:@"%@",[TagList objectAtIndex:tIndex]];
        if (tIndex < [TagList count] - 1) {
            [tl appendFormat:@", "];
        }
    }
    
    return tl;
}

#pragma mark Instance Initializers

/**
 Abbreviated init functions
 */
- (id) init
{
    return [self initWithName:nil 
                      DueDate:nil 
                     Priority:NO_PRIORITY 
                      TagList:nil 
                        State:AETStateNone 
                     Category:nil];
}

- (id) initWithName:(NSString *)name 
{
    return [self initWithName:name 
                      DueDate:nil 
                     Priority:NO_PRIORITY 
                      TagList:nil 
                        State:AETStateNone 
                     Category:nil];
}

- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
{
    return [self initWithName:name 
                      DueDate:dueDate 
                     Priority:NO_PRIORITY 
                      TagList:nil 
                        State:AETStateNone 
                     Category:nil];
}

- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
{
    return [self initWithName:name 
                      DueDate:dueDate 
                     Priority:prio 
                      TagList:nil 
                        State:AETStateNone 
                     Category:nil];
}

- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags
{
    return [self initWithName:name 
                      DueDate:dueDate 
                     Priority:prio 
                      TagList:tags 
                        State:AETStateNone 
                     Category:nil];
}

- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState)state
{
    return [self initWithName:name 
                      DueDate:dueDate 
                     Priority:prio 
                      TagList:tags 
                        State:state 
                     Category:nil];
}

/**
 Actual init function that does the work
 
 @param name    -- the name of the task
 @param dueData -- the date the task will be due
 @param prio    -- the priority of the task
 @param tags    -- a list of tags to that the task can be referenced by
 */
- (id) initWithName:(NSString *)name 
           DueDate:(NSDate *)dueDate 
          Priority:(int)prio 
           TagList:(NSArray *)tags 
             State:(AETState)state 
          Category:(NSString *)category 
{    
    self = [super init];
    if (self) {
        TaskName = (name != nil) ? [name retain] : [[NSString alloc] 
                                                    initWithFormat:@"New Task"];
        DueDate = (dueDate != nil) ? [dueDate retain] : [NSDate distantFuture];
        Priority = prio;
        //Tags = [[NSMutableArray alloc] initWithCapacity:[tags count]];
        TagList = (tags != nil) ? [tags mutableCopy] : [[NSMutableArray alloc] 
                                                     initWithCapacity:10];
        State = state;
        Category = (category != nil) ? [category retain] : [[NSString alloc] 
                                                            initWithFormat:@"None"];
        SubTaskList = [[NSMutableArray alloc] initWithCapacity:10];
    }
    
    return self;
}

#pragma mark Class Initializers

+ (id) taskWithName:(NSString *)name
{
    return [[AETask alloc] initWithName:name];
}

+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate
{
    return [[AETask alloc] initWithName:name 
                                DueDate:dueDate];
}

+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio
{
    return [[AETask alloc] initWithName:name 
                                DueDate:dueDate 
                               Priority:prio];
}

+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags
{
    return [[AETask alloc] initWithName:name 
                                DueDate:dueDate 
                               Priority:prio 
                                TagList:tags];
}

+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState)state
{
    return [[AETask alloc] initWithName:name 
                                DueDate:dueDate 
                               Priority:prio 
                                TagList:tags 
                                  State:state];
}

+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState)state 
           Category:(NSString *)category
{
    return [[AETask alloc] initWithName:name 
                                DueDate:dueDate 
                               Priority:prio 
                                TagList:tags 
                                  State:state 
                               Category:category];
}

#pragma mark Task Modifiers

/**
 Add a subtask.
 
 @param subTask -- the subtask to add
 
 @return none
 */
- (void) addSubTask:(AETask *)subTask {
    [SubTaskList addObject:subTask];
}

/**
 Add a tag to the tag list
 
 @param tag -- the tag to add
 
 @return none
 */
- (void) addTag:(NSString *)tag {
    [TagList addObject:tag];
}

/**
 Remove a tag from the tag list
 
 @param tag -- the tag to remove
 
 @return none
 */
- (void) removeTag:(NSString *)tag {
    [TagList removeObject:tag];
}

#pragma mark Task Identifiers

/**
 Check to see if this task is associated with the given tag
 
 @param tag -- the tag we're checking
 
 @return    True if this task has the given tag
            False otherwise
 */
- (BOOL) hasTag:(NSString *)tag {
    if ([TagList containsObject:tag]) {
        return YES;
    }
    return NO;
}

/**
 Check to see if this task is the same as the other task
 
 @param other -- the task we're checking
 
 @return    True if this task has the same name as the other task
            False otherwise
 */
- (BOOL) isEqual:(id)other {
    AETask *otherTask = (AETask *)other;
    
    if ([TaskName isEqualToString:otherTask.name]) {
        return YES;
    }
    return NO;
}

/**
 Compare this task to another to determine ordering
 
 @param other -- the task we're comparing to
 
 @return    -NSOrderedAscending if this task's name is lexicographically before 
             the other task's
            -NSOrderedSame if this task's name is the same as the other tasks's
            -NSOrderedDescending if this task's name is lexicographically after 
             the other task's
 */
- (NSComparisonResult) compareTo:(id)other {
    AETask *otherTask = (AETask *)other;
    
    return [TaskName localizedCompare:otherTask.name];
}

#pragma mark Bookkeeping
- (void)dealloc
{
    [super dealloc];
}

@end





















