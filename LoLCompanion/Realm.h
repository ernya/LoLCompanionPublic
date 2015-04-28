//
//  Realm.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 17/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Realm : NSManagedObject

@property (nonatomic, retain) NSString * cdn;
@property (nonatomic, retain) NSString * css;
@property (nonatomic, retain) NSString * dd;
@property (nonatomic, retain) NSString * l;
@property (nonatomic, retain) NSString * lg;
@property (nonatomic, retain) id n;
@property (nonatomic, retain) NSNumber * profileiconmax;
@property (nonatomic, retain) NSString * store;
@property (nonatomic, retain) NSString * v;

@end
