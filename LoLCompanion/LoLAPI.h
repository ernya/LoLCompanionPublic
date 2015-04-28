//
//  LoLAPI.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Realm.h"
#import "PlayerStatsSummaryList.h"

#define CHAMPIONVERSION @"v1.2"
#define CURRENTGAMEVERSION @"v1.0"
#define FEATUREDGAMESVERSION @"v1.0"
#define GAMEVERSION @"v1.3"
#define LEAGUEVERSION @"v2.5"
#define LOLSTATICDATAVERSION @"v1.2"
#define LOLSTATUSVERSION @"v1.0"
#define MATCHVERSION @"v2.2"
#define MATCHHISTORYVERSION @"v2.2"
#define STATSVERSION @"v1.3"
#define SUMMONERVERSION @"v1.4"
#define TEAMVERSION @"v2.4"

typedef void(^arraySignature)(NSArray *mappingResult);
typedef void(^realmSignature)(Realm *mappingResult);
typedef void(^dictionarySignature)(NSDictionary *mappingResult);
typedef void(^failureSignature)(NSError *mappingResult);

@interface LoLAPI : NSObject

@property (strong, nonatomic) NSString *shardName;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void) setShardName:(NSString *)shardName;

- (LoLAPI *) initWithUserParams:(NSUserDefaults*) userParameters;

- (void)getShardsList:(arraySignature) success withFailure:(failureSignature) failure;

- (void)getSummonersByName:(NSString *)names withSuccess:(arraySignature) success withFailure:(failureSignature) failure;

- (void)getRealm:(realmSignature) success withFailure:(failureSignature) failure;

- (void)getStatsSummaryById:(NSString *)idS withSuccess:(dictionarySignature) success withFailure:(failureSignature) failure;

- (void)getLeagueByIds:(NSString *)ids withSuccess:(arraySignature) success withFailure:(failureSignature) failure;

@end
