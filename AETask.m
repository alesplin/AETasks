//
//  AETask.m
//  AETasks
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//

#import "AETask.h"


@implementation AETask


/*******************************************************************************
 *                              Properties                                     *
 ******************************************************************************/
@synthesize priority=Priority;
@synthesize state=State;

/**
 Return a ", " delimited list of tags belonging to this task
 
 @param None
 @return NSString
 */
- (NSString *)taglist {
    int tIndex;
    
    NSMutableString *tl = [[NSString alloc] initWithFormat:@""];
    
    for (tIndex = 0; tIndex < [Tags count]; tIndex++) {
        [tl appendFormat:@"%@",[Tags objectAtIndex:tIndex]];
        if (tIndex < [Tags count] - 1) {
            [tl appendFormat:@", "];
        }
    }
    
    return tl;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
