//
//  ProfileSetViewController.m
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import "ApplicationSingleton.h"
#import "Shard.h"
#import "ProfileSetViewController.h"

@interface ProfileSetViewController ()

@property NSArray *shardsArray;
@property NSString *infomsg;

@end

@implementation ProfileSetViewController

@synthesize summonerName, pvc, picker, shardsArray, infomsg, button;

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

- (void)switchButton
{
    [button setTitle:@"Reload" forState:UIControlStateNormal];
}

- (NSAttributedString *) pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (shardsArray)
    {
        Shard *shard = shardsArray[row];
        return [[NSAttributedString alloc] initWithString:shard.name];
    }
    return [[NSAttributedString alloc] initWithString:infomsg];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (shardsArray)
        return shardsArray.count;
    return 1;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (void)loadShards {
    shardsArray = nil;
    infomsg = @"Loading shards...";
    [picker reloadComponent:0];
    [[[ApplicationSingleton sharedInstance] api] getShardsList:^(NSArray *mappingResult) {
        shardsArray = mappingResult;
        [picker reloadAllComponents];
        [button setEnabled:YES];
        
    } withFailure:^(NSError *mappingResult) {
        infomsg = @"Cannot fetch shards status !";
        [picker reloadComponent:0];
        [self switchButton];
        [button setEnabled:YES];
    }];
    [button setEnabled:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    picker.delegate = self;
    picker.dataSource = self;
    shardsArray = nil;
    [self loadShards];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToProfile:(id)sender
{
    [pvc saveSummonerName:[[[ApplicationSingleton sharedInstance] userParameters] stringForKey:@"summonerName"]];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)saveSummoner:(id)sender
{
    if (!shardsArray)
    {
        [self loadShards];
        return ;
    }
    Shard *shard = shardsArray[[picker selectedRowInComponent:0]];
    [[[ApplicationSingleton sharedInstance] api] setShardName:shard.slug];
    [[[ApplicationSingleton sharedInstance] userParameters] setObject:shard.slug forKey:@"shardName"];
    [[[ApplicationSingleton sharedInstance] userParameters] synchronize];
    [pvc saveSummonerName:summonerName.text];
    [self.navigationController popToRootViewControllerAnimated:YES];
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
