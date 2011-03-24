//
//  StandardIncludes.h
//  AETasks
//
//  Created by Alexander Esplin on 3/24/11.
//  Copyright 2011 Alex Esplin. All rights reserved.
//


/*******************************************************************************
 *                              Constants                                      *
 ******************************************************************************/
#define MAX_PRIORITY 100
#define MIN_PRIORITY 0
#define NO_PRIORITY -1

/*******************************************************************************
 *                          Enumerated Types                                   *
 ******************************************************************************/

typedef enum {
    AETStateNone = 0,
    AETStateInProgress,
    AETStateComplete,
    AETStateLast
} AETState;



/*******************************************************************************
 *                          Generic functions                                  *
 ******************************************************************************/

void QuietLog (NSString *format, ...);