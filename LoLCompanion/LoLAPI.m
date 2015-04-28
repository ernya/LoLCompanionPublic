//
//  LoLAPI.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import "LoLAPI.h"
#import "Shard.h"
#import "AggregatedStats.h"
#import "Summoner.h"
#import "ApplicationSingleton.h"

@interface LoLAPI ()

@property (weak, nonatomic) NSUserDefaults *userParams;
@property (strong, nonatomic) RKObjectManager *shardObjectManager;
@property (strong, nonatomic) RKObjectManager *globalObjectManager;
@property (strong, nonatomic) RKObjectManager *statusObjectManager;
@property (strong, nonatomic) RKManagedObjectStore *managedObjectStore;
@property (strong, nonatomic) NSString *api_key;

- (void) loadObjectModel;
- (void) loadPreferences;
- (void) setStatusMapping;
- (void) setGlobalMapping;
- (void) setShardMapping;

@end

@implementation LoLAPI

@synthesize managedObjectContext, shardName, userParams, globalObjectManager, statusObjectManager, shardObjectManager, api_key, managedObjectStore;

- (void) setShardName:(NSString *)shardName_
{
    shardName = shardName_;
    [self setShardMapping];
    [self setGlobalMapping];
}

- (void)getLeagueByIds:(NSString *)ids withSuccess:(arraySignature) successBlock withFailure:(failureSignature) failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult * result) {
        successBlock(((NSDictionary *)result.array[0]).allValues);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    [shardObjectManager getObjectsAtPath:[NSString stringWithFormat:@"/api/lol/%@/%@/league/by-summoner/%@/entry", shardName, LEAGUEVERSION, ids] parameters:@{ @"api_key":api_key }  success:success failure:failure];
}

- (void)getStatsSummaryById:(NSString *)idS withSuccess:(dictionarySignature) successBlock withFailure:(failureSignature) failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult * result) {
        PlayerStatsSummaryList *list = result.array.firstObject;
        NSArray *array = list.playerStatSummaries.allObjects;

        successBlock([NSDictionary dictionaryWithObjects:array forKeys:[array valueForKey:@"playerStatSummaryType"]]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    [shardObjectManager getObjectsAtPath:[NSString stringWithFormat:@"/api/lol/%@/%@/stats/by-summoner/%@/summary", shardName, STATSVERSION, idS] parameters:@{ @"api_key":api_key }  success:success failure:failure];
}

- (void)getRealm:(realmSignature) successBlock withFailure:(failureSignature) failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult * result) {
        successBlock(result.array[0]);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    [globalObjectManager getObjectsAtPath:[NSString stringWithFormat:@"/api/lol/static-data/%@/%@/realm", shardName, LOLSTATICDATAVERSION] parameters:@{ @"api_key":api_key }  success:success failure:failure];
}

- (void)getSummonersByName:(NSString *) names withSuccess:(arraySignature) successBlock withFailure:(failureSignature) failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult * result) {
        successBlock(((NSDictionary *)result.array[0]).allValues);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    [shardObjectManager getObjectsAtPath:[NSString stringWithFormat:@"/api/lol/%@/%@/summoner/by-name/%@", shardName, SUMMONERVERSION, [names stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet]] parameters:@{ @"api_key":api_key }  success:success failure:failure];
}

- (void)getShardsList:(arraySignature)successBlock withFailure:(failureSignature)failureBlock
{
    void (^success)(RKObjectRequestOperation*, RKMappingResult*) = ^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        successBlock(result.array);
    };
    void (^failure)(RKObjectRequestOperation *operation, NSError *error) = ^(RKObjectRequestOperation *operation, NSError *error) {
        failureBlock(error);
    };
    [statusObjectManager getObjectsAtPath:@"/shards" parameters:nil success:success failure:failure];
}

- (void) loadPreferences
{
    shardName = [userParams stringForKey:@"shardName"];
}

- (void) setStatusMapping
{
    RKEntityMapping *shardMapping = [RKEntityMapping mappingForEntityForName:@"Shard" inManagedObjectStore:statusObjectManager.managedObjectStore];
    [shardMapping addAttributeMappingsFromArray:[[[NSEntityDescription entityForName:@"Shard" inManagedObjectContext:managedObjectContext] propertiesByName] allKeys]];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:shardMapping method:RKRequestMethodGET pathPattern:@"/shards" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [statusObjectManager addResponseDescriptor:responseDescriptor];
}

- (void) setShardMapping
{
    if (!shardName)
        return;
    shardObjectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://%@.api.pvp.net", shardName]]];
    shardObjectManager.managedObjectStore = managedObjectStore;
    
    // Summoner mapping
    
    RKEntityMapping *summonerMapping = [RKEntityMapping mappingForEntityForName:@"Summoner" inManagedObjectStore:shardObjectManager.managedObjectStore];
    RKDynamicMapping *dynamicSummonerMapping;
    [summonerMapping addAttributeMappingsFromArray:[[[NSEntityDescription entityForName:@"Summoner" inManagedObjectContext:managedObjectContext] propertiesByName] allKeys]];
    dynamicSummonerMapping = [[RKDynamicMapping alloc] init];
    [dynamicSummonerMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSString *summonerID in summonerIDs)
         {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:summonerID mapping:summonerMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    RKResponseDescriptor *summonerResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping method:RKRequestMethodGET pathPattern:[NSString stringWithFormat:@"/api/lol/%@/%@/summoner/by-name/:summonerNames", shardName, SUMMONERVERSION] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    RKResponseDescriptor *summonerResponseDescriptor2 = [RKResponseDescriptor responseDescriptorWithMapping:dynamicSummonerMapping method:RKRequestMethodGET pathPattern:[NSString stringWithFormat:@"/api/lol/%@/%@/summoner/:summonerIds", shardName, SUMMONERVERSION] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [shardObjectManager addResponseDescriptor:summonerResponseDescriptor];
    [shardObjectManager addResponseDescriptor:summonerResponseDescriptor2];
    
    // Stats Mapping
    
    RKEntityMapping *aggregatedStatsMapping = [RKEntityMapping mappingForEntityForName:@"AggregatedStats" inManagedObjectStore:managedObjectStore];
    [aggregatedStatsMapping addAttributeMappingsFromArray:[[[NSEntityDescription entityForName:@"AggregatedStats" inManagedObjectContext:managedObjectContext] propertiesByName] allKeys]];
    RKEntityMapping *playerStatsSummaryMapping = [RKEntityMapping mappingForEntityForName:@"PlayerStatsSummary" inManagedObjectStore:managedObjectStore];
    [playerStatsSummaryMapping addAttributeMappingsFromArray:@[ @"wins", @"playerStatSummaryType", @"modifyDate", @"losses"]];
    [playerStatsSummaryMapping addRelationshipMappingWithSourceKeyPath:@"aggregatedStats" mapping:aggregatedStatsMapping];
    RKEntityMapping *playerStatsSummaryList = [RKEntityMapping mappingForEntityForName:@"PlayerStatsSummaryList" inManagedObjectStore:managedObjectStore];
    [playerStatsSummaryList addAttributeMappingsFromArray:@[@"summonerId"]];
    [playerStatsSummaryList addRelationshipMappingWithSourceKeyPath:@"playerStatSummaries" mapping:playerStatsSummaryMapping];
    RKResponseDescriptor *statsSummaryResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:playerStatsSummaryList method:RKRequestMethodGET pathPattern:[NSString stringWithFormat:@"/api/lol/%@/%@/stats/by-summoner/:summonerId/summary", shardName, STATSVERSION] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [shardObjectManager addResponseDescriptor:statsSummaryResponseDescriptor];
    
    // League Mapping
    RKEntityMapping *miniSeriesMapping = [RKEntityMapping mappingForEntityForName:@"MiniSeries" inManagedObjectStore:managedObjectStore];
    [miniSeriesMapping addAttributeMappingsFromArray:[[[NSEntityDescription entityForName:@"MiniSeries" inManagedObjectContext:managedObjectContext] propertiesByName] allKeys]];
    RKEntityMapping *leagueEntryMapping = [RKEntityMapping mappingForEntityForName:@"LeagueEntry" inManagedObjectStore:managedObjectStore];
    [leagueEntryMapping addAttributeMappingsFromArray:@[ @"division", @"isFreshBlood", @"isHotStreak", @"isInactive", @"isVeteran", @"leaguePoints", @"losses", @"playerOrTeamId", @"playerOrTeamName", @"wins"]];
    [leagueEntryMapping addRelationshipMappingWithSourceKeyPath:@"miniSeries" mapping:miniSeriesMapping];
    RKEntityMapping *leagueMapping = [RKEntityMapping mappingForEntityForName:@"League" inManagedObjectStore:managedObjectStore];
    [leagueMapping addAttributeMappingsFromArray:@[ @"name", @"participantId", @"queue", @"tier"]];
    [leagueMapping addRelationshipMappingWithSourceKeyPath:@"entries" mapping:leagueEntryMapping];
    RKDynamicMapping *dynamicLeagueMapping = [[RKDynamicMapping alloc] init];
    [dynamicLeagueMapping setObjectMappingForRepresentationBlock:^RKObjectMapping*(id representation)
     {
         NSArray* summonerIDs = [representation allKeys];
         RKObjectMapping *summonerIDAsKeyMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
         
         
         for (NSString *summonerID in summonerIDs)
         {
             [summonerIDAsKeyMapping addRelationshipMappingWithSourceKeyPath:summonerID mapping:leagueMapping];
         }
         
         return summonerIDAsKeyMapping;
     }];
    RKResponseDescriptor *leagueResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:dynamicLeagueMapping method:RKRequestMethodGET pathPattern:[NSString stringWithFormat:@"/api/lol/%@/%@/league/by-summoner/:summonerIds/entry", shardName, LEAGUEVERSION] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [shardObjectManager addResponseDescriptor:leagueResponseDescriptor];
}

- (void) setGlobalMapping
{
    if (!shardName)
        return;
    globalObjectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"https://global.api.pvp.net"]];
    globalObjectManager.managedObjectStore = managedObjectStore;
    
    RKEntityMapping *realmMapping = [RKEntityMapping mappingForEntityForName:@"Realm" inManagedObjectStore:globalObjectManager.managedObjectStore];
    [realmMapping addAttributeMappingsFromArray:[[[NSEntityDescription entityForName:@"Realm" inManagedObjectContext:managedObjectContext] propertiesByName] allKeys]];
    RKResponseDescriptor *realmResponseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:realmMapping method:RKRequestMethodGET pathPattern:[NSString stringWithFormat:@"/api/lol/static-data/%@/%@/realm", shardName, LOLSTATICDATAVERSION] keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [globalObjectManager addResponseDescriptor:realmResponseDescriptor];
}

- (void) loadObjectModel
{
    NSError *error = nil;
    NSURL *modelURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"LoLAPI" ofType:@"momd"]];
    
    NSManagedObjectModel *managedObjectModel = [[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL] mutableCopy];
    managedObjectStore = [[RKManagedObjectStore alloc] initWithManagedObjectModel:managedObjectModel];
    
    [managedObjectStore createPersistentStoreCoordinator];
    NSPersistentStore __unused *persistentStore = [managedObjectStore addInMemoryPersistentStore:&error];
    NSAssert(persistentStore, @"Failed to add persistent store: %@", error);
    
    [managedObjectStore createManagedObjectContexts];
    
    // Set the default store shared instance
    [RKManagedObjectStore setDefaultStore:managedObjectStore];
    
    managedObjectContext = managedObjectStore.mainQueueManagedObjectContext;
    statusObjectManager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://status.leagueoflegends.com"]];
    statusObjectManager.managedObjectStore = managedObjectStore;
    [self setStatusMapping];
    [self setGlobalMapping];
    [self setShardMapping];
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
}

- (LoLAPI *) initWithUserParams:(NSUserDefaults*) userParameters
{
    self = [super init];
    if (self)
    {
        userParams = userParameters;
        api_key = @"replaceAPIkeyHere";
        [self loadPreferences];
        [self loadObjectModel];
    }
    return self;
}

@end