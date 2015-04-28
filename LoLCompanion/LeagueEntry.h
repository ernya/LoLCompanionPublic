//
//  LeagueEntry.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 18/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MiniSeries;

@interface LeagueEntry : NSManagedObject

@property (nonatomic, retain) NSString * division;
@property (nonatomic, retain) NSNumber * isFreshBlood;
@property (nonatomic, retain) NSNumber * isHotStreak;
@property (nonatomic, retain) NSNumber * isInactive;
@property (nonatomic, retain) NSNumber * isVeteran;
@property (nonatomic, retain) NSNumber * leaguePoints;
@property (nonatomic, retain) NSNumber * losses;
@property (nonatomic, retain) NSString * playerOrTeamId;
@property (nonatomic, retain) NSString * playerOrTeamName;
@property (nonatomic, retain) NSNumber * wins;
@property (nonatomic, retain) MiniSeries *miniSeries;

@end
