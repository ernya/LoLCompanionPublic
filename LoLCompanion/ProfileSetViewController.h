//
//  ProfileSetViewController.h
//  LoLCompanion
//
//  Created by Alexandre ERNY on 16/02/15.
//  Copyright (c) 2015 noraj.fr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"

@interface ProfileSetViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *summonerName;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (getter=getPvc,setter=setPvc:, weak, nonatomic) ProfileViewController *pvc;

- (IBAction)saveSummoner:(id)sender;

@end
