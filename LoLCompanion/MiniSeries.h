//
//  MiniSeries.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 18/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MiniSeries : NSManagedObject

@property (nonatomic, retain) NSNumber * losses;
@property (nonatomic, retain) NSString * progress;
@property (nonatomic, retain) NSNumber * target;
@property (nonatomic, retain) NSNumber * wins;

@end
