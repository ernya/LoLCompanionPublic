//
//  League.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 18/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LeagueEntry;

@interface League : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * participantId;
@property (nonatomic, retain) NSString * queue;
@property (nonatomic, retain) NSString * tier;
@property (nonatomic, retain) NSSet *entries;
@end

@interface League (CoreDataGeneratedAccessors)

- (void)addEntriesObject:(LeagueEntry *)value;
- (void)removeEntriesObject:(LeagueEntry *)value;
- (void)addEntries:(NSSet *)values;
- (void)removeEntries:(NSSet *)values;

@end
