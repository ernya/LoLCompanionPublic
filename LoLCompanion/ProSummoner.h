//
//  ProSummoner.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 08/03/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ChampionCategory;

@interface ProSummoner : NSManagedObject

@property (nonatomic, retain) NSNumber * enabled;
@property (nonatomic, retain) NSNumber * idSummoner;
@property (nonatomic, retain) NSString * region;
@property (nonatomic, retain) NSString * summonerName;
@property (nonatomic, retain) NSSet *categories;
@end

@interface ProSummoner (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(ChampionCategory *)value;
- (void)removeCategoriesObject:(ChampionCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

@end
