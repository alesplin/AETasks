//
//  AETask.h
//  AETasks
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AETask : NSObject {
    
    NSString        *TaskName;
    NSString        *Category;
    NSMutableArray  *SubTaskList;
    NSMutableArray  *Tags;
    NSDate          *DueDate;
    int              Priority;
    
@private
    
}

@end
