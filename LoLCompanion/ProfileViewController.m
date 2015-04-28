//
//  ProfileViewController.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <RestKit.h>
#import "Summoner.h"
#import "AppDelegate.h"
#import "PlayerStatsSummary.h"
#import "AggregatedStats.h"
#import "ApplicationSingleton.h"
#import "ProfileViewController.h"
#import "ProfileStatsViewController.h"
#import "ProfileSetViewController.h"

@interface ProfileViewController ()

@property (strong, nonatomic) NSString *summonerName;
@property (strong, nonatomic) Summoner *summoner;
@property (nonatomic) bool profileLoaded;
@property (weak, nonatomic) NSUserDefaults *userParameters;
@property (weak, nonatomic) ProfileStatsViewController *statsController;

- (void)loadProfile;
- (void)toggleSetProfile;

@end

@implementation ProfileViewController

@synthesize informationLabel, summonerName, profileLoaded, userParameters, fetchedResultsController, editButton, summoner, refreshButton, profileIcon, summonerLabel, expFill, expBorder, levelLabel, widthFilling, iconBorder, statsSwitch, statsController;

- (void)viewDidUnload {
    self.fetchedResultsController = nil;
}
- (void)saveSummonerName: (NSString *) name
{
    summonerName = name;
    [userParameters setObject:name forKey:@"summonerName"];
    [userParameters synchronize];
}

- (void)loadStats
{
    [statsController fetchStatsForSummonerID:[summoner.id stringValue]];
}

- (void)setSummonerIcon: (NSString *) cdn withVersion: (NSString *) version
{
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@/img/profileicon/%@.png", cdn, version, summoner.profileIconId]];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.profileIcon.image = [UIImage imageWithData:imageData];
            [informationLabel setHidden:true];
            profileLoaded = true;
            [summonerLabel setText:summoner.name];
            [levelLabel setText:[NSString stringWithFormat:@"Level %@", summoner.summonerLevel]];
            [widthFilling setConstant:179.0f * summoner.summonerLevel.floatValue / 30.0f];
            [expBorder setHidden:NO];
            [iconBorder setHidden:NO];
            [editButton setHidden:false];
            [refreshButton setHidden:NO];
            if (summoner.summonerLevel.intValue < 30)
            {
                [statsSwitch setSelectedSegmentIndex:0];
                [statsSwitch setEnabled:NO forSegmentAtIndex:1];
            }
            else
            {
                [statsSwitch setSelectedSegmentIndex:1];
                [statsSwitch setEnabled:YES forSegmentAtIndex:1];
            }
            [statsSwitch setHidden:NO];
            [expFill setHidden:NO];
            expFill.clipsToBounds = YES;
            [summonerLabel setHidden:NO];
            [levelLabel setHidden:NO];
            [self.profileIcon setHidden:NO];
        });
        [self loadStats];
    });
}

- (void)finishLoadProfile
{
    [[[ApplicationSingleton sharedInstance] api] getRealm:^(Realm *mappingResult) {
        NSDictionary *versions = mappingResult.n;
        [self setSummonerIcon:mappingResult.cdn withVersion:[versions valueForKey:@"profileicon"]];
    } withFailure:^(NSError *mappingResult) {
        informationLabel.text = @"Could not fetch profile !";
        [refreshButton setHidden:NO];
        [editButton setHidden:false];
    }];
}

- (void)hideProfile
{
    [refreshButton setHidden:YES];
    [expFill setHidden:YES];
    [levelLabel setHidden:YES];
    [expBorder setHidden:YES];
    [editButton setHidden:YES];
    [statsSwitch setHidden:YES];
    [profileIcon setHidden:YES];
    [iconBorder setHidden:YES];
    [summonerLabel setHidden:YES];
    [profileIcon setImage:nil];
    [statsController hideAll];
    informationLabel.text = @"Loading profile...";
}

- (void)loadProfile
{
    [self hideProfile];
    [informationLabel setHidden:NO];
    
    [[[ApplicationSingleton sharedInstance] api] getSummonersByName:summonerName withSuccess:^(NSArray *mappingResult) {
        summoner = mappingResult.firstObject;
        [self finishLoadProfile];
    } withFailure:^(NSError *mappingResult) {
        informationLabel.text = @"Could not fetch profile !";
        [refreshButton setHidden:NO];
        [editButton setHidden:false];
    }];


    
}

- (IBAction)refresh:(id)sender
{
    [self loadProfile];
}

- (IBAction)editSummoner:(id)sender
{
    profileLoaded = NO;
    summonerName = nil;
    [self hideProfile];
    [self toggleSetProfile];
}

- (void)toggleSetProfile
{
    [self performSegueWithIdentifier:@"setProfile" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"setProfile"])
    {
        [(ProfileSetViewController *)segue.destinationViewController setPvc:self];
    }
    else if ([[segue identifier] isEqualToString:@"profileStats"])
    {
        statsController = segue.destinationViewController;
        statsController.switchControl = statsSwitch;
        [statsController setSwitchCall];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    profileLoaded = NO;
    informationLabel.text = @"Loading profile...";
    ApplicationSingleton *instance = [ApplicationSingleton sharedInstance];
    userParameters = instance.userParameters;
    summonerName = [userParameters stringForKey:@"summonerName"];
    if (summonerName && [userParameters stringForKey:@"shardName"])
    {
        profileLoaded = YES;
        [self loadProfile];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    if (!summonerName || ![userParameters stringForKey:@"shardName"])
        [self toggleSetProfile];
    else if (!profileLoaded)
        [self loadProfile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
