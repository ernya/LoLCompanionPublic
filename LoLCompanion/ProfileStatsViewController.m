//
//  ProfileStatsViewController.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 18/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import "ApplicationSingleton.h"
#import "PlayerStatsSummary.h"
#import "AggregatedStats.h"
#import "League.h"
#import "LeagueEntry.h"
#import "ProfileStatsViewController.h"

@interface ProfileStatsViewController ()

@property (strong, nonatomic) NSDictionary *stats;
@property (nonatomic) int ranking3s;
@property (nonatomic) int rankingYoloQ;
@property (nonatomic) int ranking5s;
@end

@implementation ProfileStatsViewController

@synthesize stats, loadingLabel, label3s, label5s, labelYoloQ, image3s, image5s, imageYoloQ, switchControl, ranking3s, ranking5s, rankingYoloQ;

- (IBAction)switchStats:(id)sender
{
    [self showStats];
}

- (void)setSwitchCall
{
    [switchControl addTarget:self action:@selector(switchStats:) forControlEvents:UIControlEventValueChanged];
}

- (void)hideAll
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view setHidden:true];
    });
}

- (void)showAll
{
    dispatch_async(dispatch_get_main_queue(), ^{
        loadingLabel.text = @"Loading stats...";
        loadingLabel.hidden = NO;
        label3s.hidden = YES;
        label5s.hidden = YES;
        labelYoloQ.hidden = YES;
        imageYoloQ.hidden = YES;
        image5s.hidden = YES;
        image3s.hidden = YES;
        [self.view setHidden:false];
    });
}

- (void)showStats
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (switchControl.selectedSegmentIndex == 0)
        {
            // Normals
            PlayerStatsSummary *statsSummary = [stats valueForKey:@"Unranked"];
            AggregatedStats *normalStats = statsSummary.aggregatedStats;
            label3s.text = @"Takedowns";
            labelYoloQ.text = @"Monster kills";
            label5s.text = @"Wins";
            int takedowns = normalStats.totalChampionKills.intValue + normalStats.totalAssists.intValue + normalStats.totalTurretsKilled.intValue;
            int monsterKills = normalStats.totalMinionKills.intValue + normalStats.totalNeutralMinionsKilled.intValue;
            int wins = statsSummary.wins.intValue;
            if (takedowns < 100)
                image3s.image = [UIImage imageNamed:@"NoMedal"];
            else if (takedowns < 500)
                image3s.image = [UIImage imageNamed:@"BronzeBase"];
            else if (takedowns < 2500)
                image3s.image = [UIImage imageNamed:@"SilverBase"];
            else if (takedowns < 5000)
                image3s.image = [UIImage imageNamed:@"GoldBase"];
            else if (takedowns < 10000)
                image3s.image = [UIImage imageNamed:@"PlatiniumBase"];
            else if (takedowns >= 10000)
                image3s.image = [UIImage imageNamed:@"DiamondBase"];
            if (monsterKills < 2000)
                imageYoloQ.image = [UIImage imageNamed:@"NoMedal"];
            else if (monsterKills < 10000)
                imageYoloQ.image = [UIImage imageNamed:@"BronzeBase"];
            else if (monsterKills < 50000)
                imageYoloQ.image = [UIImage imageNamed:@"SilverBase"];
            else if (monsterKills < 100000)
                imageYoloQ.image = [UIImage imageNamed:@"GoldBase"];
            else if (monsterKills < 200000)
                imageYoloQ.image = [UIImage imageNamed:@"PlatiniumBase"];
            else if (monsterKills >= 200000)
                imageYoloQ.image = [UIImage imageNamed:@"DiamondBase"];
            if (wins < 10)
                image5s.image = [UIImage imageNamed:@"NoMedal"];
            else if (wins < 25)
                image5s.image = [UIImage imageNamed:@"BronzeBase"];
            else if (wins < 100)
                image5s.image = [UIImage imageNamed:@"SilverBase"];
            else if (wins < 300)
                image5s.image = [UIImage imageNamed:@"GoldBase"];
            else if (wins < 600)
                image5s.image = [UIImage imageNamed:@"PlatiniumBase"];
            else if (wins >= 600)
                image5s.image = [UIImage imageNamed:@"DiamondBase"];
        }
        else if (switchControl.selectedSegmentIndex == 1)
        {
            // Rankeds
            label3s.text = @"3v3 Premade";
            labelYoloQ.text = @"Solo queue";
            label5s.text = @"5v5 Premade";
            
            if (ranking3s == 0)
                image3s.image = [UIImage imageNamed:@"MasterBase"];
            else if (ranking3s == -1)
                image3s.image = [UIImage imageNamed:@"ChallengerBase"];
            else if (ranking3s == 42)
                image3s.image = [UIImage imageNamed:@"NoMedal"];
            else
                image3s.image = [UIImage imageNamed:[NSString stringWithFormat:@"Medal%d.png", ranking3s]];
            
            if (ranking5s == 0)
                image5s.image = [UIImage imageNamed:@"MasterBase"];
            else if (ranking5s == -1)
                image5s.image = [UIImage imageNamed:@"ChallengerBase"];
            else if (ranking5s == 42)
                image5s.image = [UIImage imageNamed:@"NoMedal"];
            else
                image5s.image = [UIImage imageNamed:[NSString stringWithFormat:@"Medal%d.png", ranking5s]];
            
            if (rankingYoloQ == 0)
                imageYoloQ.image = [UIImage imageNamed:@"MasterBase"];
            else if (rankingYoloQ == -1)
                imageYoloQ.image = [UIImage imageNamed:@"ChallengerBase"];
            else if (rankingYoloQ == 42)
                imageYoloQ.image = [UIImage imageNamed:@"NoMedal"];
            else
                imageYoloQ.image = [UIImage imageNamed:[NSString stringWithFormat:@"Medal%d.png", rankingYoloQ]];
            
        }
        label3s.hidden = FALSE;
        labelYoloQ.hidden = FALSE;
        label5s.hidden = FALSE;
        image3s.hidden = FALSE;
        image5s.hidden = FALSE;
        imageYoloQ.hidden = FALSE;
        loadingLabel.hidden = TRUE;
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)divisionToInt:(NSString *)division
{
    // THANK YOU VERY MUCH RITO FOR USING ROMANS NUMERALS HERE !
    
    if ([division isEqualToString:@"I"])
        return 1;
    else if ([division isEqualToString:@"II"])
        return 2;
    else if ([division isEqualToString:@"III"])
        return 3;
    else if ([division isEqualToString:@"IV"])
        return 4;
    else if ([division isEqualToString:@"V"])
        return 5;
    else // FUCK YOU YOU'RE DIVISION 5
        return 5;
}

- (void)leagueToRankings:(NSArray *)leagues
{
    ranking3s = 42;
    ranking5s = 42;
    rankingYoloQ = 42;
    for (League *league in leagues)
    {
        int queue = [league.queue isEqualToString:@"RANKED_SOLO_5x5"] ? 1 : ([league.queue isEqualToString:@"RANKED_TEAM_3x3"] ? 0 : 2);
        int curvalue = queue == 0 ? ranking3s : (queue == 1 ? rankingYoloQ : ranking5s);
        int value = 42;
        if ([league.tier isEqualToString:@"CHALLENGER"])
            value = -1;
        else if ([league.tier isEqualToString:@"MASTER"])
            value = 0;
        else if ([league.tier isEqualToString:@"DIAMOND"])
            value = 1;
        else if ([league.tier isEqualToString:@"PLATINUM"])
            value = 6;
        else if ([league.tier isEqualToString:@"GOLD"])
            value = 11;
        else if ([league.tier isEqualToString:@"SILVER"])
            value = 16;
        else if ([league.tier isEqualToString:@"BRONZE"])
            value = 21;
        if (value <= 0 && value <= curvalue)
        {
            if (queue == 0)
                ranking3s = value;
            else if (queue == 1)
                rankingYoloQ = value;
            else if (queue == 2)
                ranking5s = value;
        }
        else if (value > 0)
        {
            LeagueEntry *entry = league.entries.allObjects[0];
            value += [self divisionToInt:entry.division] - 1;
            if (value <= curvalue)
            {
                if (queue == 0)
                    ranking3s = value;
                else if (queue == 1)
                    rankingYoloQ = value;
                else if (queue == 2)
                    ranking5s = value;
            }
        }
    }
}

- (void)fetchStatsForSummonerID:(NSString *) sId
{
    [self showAll];
    [[[ApplicationSingleton sharedInstance] api] getStatsSummaryById:sId withSuccess:^(NSDictionary *mappingResult) {
        [switchControl setEnabled:YES];
        stats = mappingResult;
        if (![switchControl isEnabledForSegmentAtIndex:1])
            [self showStats];
        else
            [[[ApplicationSingleton sharedInstance] api] getLeagueByIds:sId withSuccess:^(NSArray *mappingResult) {
                [self leagueToRankings:mappingResult[0]];
                [self showStats];
            } withFailure:^(NSError *mappingResult) {
                /*
                 * TODO : Proper error checking (error code, has the user not played any ranked (404 IMO), or did the request failed because of rate or anything (other codes) ?)
                 */
                
                ranking5s = 42;
                ranking3s = 42;
                rankingYoloQ = 42;
                [self showStats];
            }];
    } withFailure:^(NSError *mappingResult) {
        dispatch_async(dispatch_get_main_queue(), ^{
            loadingLabel.text = @"Could not load stats !";
            [switchControl setEnabled:NO];
        });
    }];
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
