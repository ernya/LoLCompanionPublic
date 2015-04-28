//
//  Shard.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Shard : NSManagedObject

@property (nonatomic, retain) NSString * hostname;
@property (nonatomic, retain) id locales;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * region_tag;
@property (nonatomic, retain) NSString * slug;

@end
