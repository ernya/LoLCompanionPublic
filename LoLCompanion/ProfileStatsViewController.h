//
//  ProfileStatsViewController.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 18/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileStatsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *loadingLabel;

@property (weak, nonatomic) IBOutlet UILabel *label3s;
@property (weak, nonatomic) IBOutlet UILabel *labelYoloQ;
@property (weak, nonatomic) IBOutlet UILabel *label5s;

@property (weak, nonatomic) IBOutlet UIImageView *image3s;
@property (weak, nonatomic) IBOutlet UIImageView *imageYoloQ;
@property (weak, nonatomic) IBOutlet UIImageView *image5s;

@property (weak, nonatomic) IBOutlet UISegmentedControl *switchControl;

- (IBAction)switchStats:(id) sender;

- (void)hideAll;

- (void)showAll;

- (void)fetchStatsForSummonerID:(NSString *) sId;

- (void)setSwitchCall;

@end
