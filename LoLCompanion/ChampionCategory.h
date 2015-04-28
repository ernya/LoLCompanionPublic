//
//  ChampionCategory.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 08/03/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChampionCategory : NSManagedObject

@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSSet *proSummoners;
@end

@interface ChampionCategory (CoreDataGeneratedAccessors)

- (void)addProSummonersObject:(NSManagedObject *)value;
- (void)removeProSummonersObject:(NSManagedObject *)value;
- (void)addProSummoners:(NSSet *)values;
- (void)removeProSummoners:(NSSet *)values;

@end
