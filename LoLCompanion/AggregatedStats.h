//
//  AggregatedStats.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 17/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AggregatedStats : NSManagedObject

@property (nonatomic, retain) NSNumber * averageAssists;
@property (nonatomic, retain) NSNumber * averageChampionsKilled;
@property (nonatomic, retain) NSNumber * averageCombatPlayerScore;
@property (nonatomic, retain) NSNumber * averageNodeCapture;
@property (nonatomic, retain) NSNumber * averageNodeCaptureAssist;
@property (nonatomic, retain) NSNumber * averageNodeNeutralize;
@property (nonatomic, retain) NSNumber * averageNodeNeutralizeAssist;
@property (nonatomic, retain) NSNumber * averageNumDeaths;
@property (nonatomic, retain) NSNumber * averageObjectivePlayerScore;
@property (nonatomic, retain) NSNumber * averageTeamObjective;
@property (nonatomic, retain) NSNumber * averageTotalPlayerScore;
@property (nonatomic, retain) NSNumber * botGamesPlayed;
@property (nonatomic, retain) NSNumber * killingSpree;
@property (nonatomic, retain) NSNumber * maxAssists;
@property (nonatomic, retain) NSNumber * maxChampionsKilled;
@property (nonatomic, retain) NSNumber * maxCombatPlayerScore;
@property (nonatomic, retain) NSNumber * maxLargestCriticalStrike;
@property (nonatomic, retain) NSNumber * maxLargestKillingSpree;
@property (nonatomic, retain) NSNumber * maxNodeCapture;
@property (nonatomic, retain) NSNumber * maxNodeCaptureAssist;
@property (nonatomic, retain) NSNumber * maxNodeNeutralize;
@property (nonatomic, retain) NSNumber * maxNodeNeutralizeAssist;
@property (nonatomic, retain) NSNumber * maxNumDeaths;
@property (nonatomic, retain) NSNumber * maxObjectivePlayerScore;
@property (nonatomic, retain) NSNumber * maxTeamObjective;
@property (nonatomic, retain) NSNumber * maxTimePlayed;
@property (nonatomic, retain) NSNumber * maxTimeSpentLiving;
@property (nonatomic, retain) NSNumber * maxTotalPlayerScore;
@property (nonatomic, retain) NSNumber * mostChampionKillsPerSession;
@property (nonatomic, retain) NSNumber * mostSpellsCast;
@property (nonatomic, retain) NSNumber * normalGamesPlayed;
@property (nonatomic, retain) NSNumber * rankedPremadeGamesPlayed;
@property (nonatomic, retain) NSNumber * rankedSoloGamesPlayed;
@property (nonatomic, retain) NSNumber * totalAssists;
@property (nonatomic, retain) NSNumber * totalChampionKills;
@property (nonatomic, retain) NSNumber * totalDamageDealt;
@property (nonatomic, retain) NSNumber * totalDamageTaken;
@property (nonatomic, retain) NSNumber * totalDeathsPerSession;
@property (nonatomic, retain) NSNumber * totalDoubleKills;
@property (nonatomic, retain) NSNumber * totalFirstBlood;
@property (nonatomic, retain) NSNumber * totalGoldEarned;
@property (nonatomic, retain) NSNumber * totalHeal;
@property (nonatomic, retain) NSNumber * totalMagicDamageDealt;
@property (nonatomic, retain) NSNumber * totalMinionKills;
@property (nonatomic, retain) NSNumber * totalNeutralMinionsKilled;
@property (nonatomic, retain) NSNumber * totalNodeCapture;
@property (nonatomic, retain) NSNumber * totalNodeNeutralize;
@property (nonatomic, retain) NSNumber * totalPentaKills;
@property (nonatomic, retain) NSNumber * totalPhysicalDamageDealt;
@property (nonatomic, retain) NSNumber * totalQuadraKills;
@property (nonatomic, retain) NSNumber * totalSessionsLost;
@property (nonatomic, retain) NSNumber * totalSessionsPlayed;
@property (nonatomic, retain) NSNumber * totalSessionsWon;
@property (nonatomic, retain) NSNumber * totalTripleKills;
@property (nonatomic, retain) NSNumber * totalTurretsKilled;
@property (nonatomic, retain) NSNumber * totalUnrealKills;

@end
