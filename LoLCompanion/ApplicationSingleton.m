//
//  ApplicationSingleton.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import "ApplicationSingleton.h"

@implementation ApplicationSingleton

@synthesize userParameters, api, db;

#pragma mark Singleton Methods

+ (id)sharedInstance
{
    static ApplicationSingleton *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init])
    {
        userParameters = [NSUserDefaults standardUserDefaults];
        api = [[LoLAPI alloc] initWithUserParams:userParameters];
        db = [[LocalDB alloc] init];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end