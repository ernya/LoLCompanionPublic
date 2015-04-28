//
//  PlayerStatsSummary.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 17/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AggregatedStats.h"


@interface PlayerStatsSummary : NSManagedObject

@property (nonatomic, retain) NSNumber * losses;
@property (nonatomic, retain) NSNumber * modifyDate;
@property (nonatomic, retain) NSString * playerStatSummaryType;
@property (nonatomic, retain) NSNumber * wins;
@property (nonatomic, retain) AggregatedStats *aggregatedStats;

@end
