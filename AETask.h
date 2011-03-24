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
    NSMutableArray  *Tags;
    NSDate          *DueDate;
    int              Priority;
    
@private
    
}

/*******************************************************************************
 *                              Properties                                     *
 ******************************************************************************/

@property (readwrite,assign)    int priority;
@property (readwrite,assign)    AETState state;
@property (readonly)            NSString *taglist;

/*******************************************************************************
 *                          Instance Functions                                 *
 ******************************************************************************/

/* creators */

- (id) initWithName:(NSString *)name;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio;
- (id) initWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tagList;

/* modifiers */
- (void) addSubTask:(AETask *)subTask;
- (void) addTag:(NSString *)tag;


/*******************************************************************************
 *                              Class Functions                                *
 ******************************************************************************/

/* creators */
+ (id) TaskWithName:(NSString *)name;
+ (id) TaskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate;
+ (id) TaskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio;
+ (id) TaskWithName:(NSString *)name 
            DueDate:(NSDate *)dueDate 
           Priority:(int)prio 
            TagList:(NSArray *)tagList;


@end
