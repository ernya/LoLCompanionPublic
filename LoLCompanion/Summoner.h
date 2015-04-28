//
//  Summoner.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Summoner : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * profileIconId;
@property (nonatomic, retain) NSNumber * revisionDate;
@property (nonatomic, retain) NSNumber * summonerLevel;

@end
