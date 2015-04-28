//
//  PlayerStatsSummaryList.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 17/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PlayerStatsSummary;

@interface PlayerStatsSummaryList : NSManagedObject

@property (nonatomic, retain) NSNumber * summonerId;
@property (nonatomic, retain) NSSet *playerStatSummaries;
@end

@interface PlayerStatsSummaryList (CoreDataGeneratedAccessors)

- (void)addPlayerStatSummariesObject:(PlayerStatsSummary *)value;
- (void)removePlayerStatSummariesObject:(PlayerStatsSummary *)value;
- (void)addPlayerStatSummaries:(NSSet *)values;
- (void)removePlayerStatSummaries:(NSSet *)values;

@end
