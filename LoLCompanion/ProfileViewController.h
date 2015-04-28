//
//  ProfileViewController.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIImageView *profileIcon;
@property (weak, nonatomic) IBOutlet UIImageView *expFill;
@property (weak, nonatomic) IBOutlet UIImageView *expBorder;
@property (weak, nonatomic) IBOutlet UIImageView *iconBorder;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
@property (weak, nonatomic) IBOutlet UILabel *informationLabel;
@property (weak, nonatomic) IBOutlet UILabel *summonerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *statsSwitch;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthFilling;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

- (IBAction)editSummoner:(id)sender;
- (IBAction)refresh:(id)sender;

- (void) saveSummonerName: (NSString *) name;

@end
