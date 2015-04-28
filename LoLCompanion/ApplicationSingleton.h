//
//  ApplicationSingleton.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <foundation/Foundation.h>
#import "LoLAPI.h"
#import "LocalDB.h"

@interface ApplicationSingleton : NSObject

@property (strong, nonatomic) NSUserDefaults *userParameters;
@property (strong, nonatomic) LoLAPI *api;
@property (strong, nonatomic) LocalDB *db;

+ (id)sharedInstance;

@end
