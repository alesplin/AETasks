//
//  AETask.h
//  AETasks
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardIncludes.h"


@interface AETask : NSObject {
    
    NSString        *TaskName;
    NSString        *Category;
    AETState         State;
    NSMutableArray  *SubTaskList;
    NSMutableArray  *TagList;
    NSDate          *DueDate;
    int              Priority;
    
@private
    
}

#pragma mark Properties

@property (readwrite,retain)    NSString    *name;
@property (readwrite,assign)    int         priority;
@property (readwrite,assign)    AETState    state;
@property (readwrite,retain)    NSDate      *dueDate;
@property (readonly)            NSString    *tagList;

#pragma mark Instance Initialization

- (id) initWithName:(NSString *)name;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState) state;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState) state 
           Category:(NSString *)category;

#pragma mark Class Initialization

+ (id) taskWithName:(NSString *)name;
+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate;
+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio;
+ (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags;
- (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState)state;
- (id) taskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tags 
              State:(AETState)state 
           Category:(NSString *)category;

#pragma mark Task Modifiers

- (void) addSubTask:(AETask *)  subTask;
- (void) addTag:(NSString *)    tag;
- (void) removeTag:(NSString *) tag;

#pragma mark Task Identifiers

- (BOOL)                hasTag:(NSString *)     tag;
- (BOOL)                isEqual:(id)            other;
- (NSComparisonResult)  compareTo:(id)    other;

@end




















