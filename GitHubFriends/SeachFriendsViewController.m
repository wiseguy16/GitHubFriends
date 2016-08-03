//
//  SeachFriendsViewController.m
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "SeachFriendsViewController.h"

@interface SeachFriendsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *searchGitHubTextField;


@end

@implementation SeachFriendsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Action Handlers

- (IBAction)searchTapped:(UIButton *)sender
{
    [self.delegate searchWasTyped:self.searchGitHubTextField.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)dismissTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
