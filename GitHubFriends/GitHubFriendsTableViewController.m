//
//  GitHubFriendsTableViewController.m
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "GitHubFriendsTableViewController.h"
#import "SeachFriendsViewController.h"
#import "APIController.h"
#import "Friend.h"
#import "DetailFriendViewController.h"

@interface GitHubFriendsTableViewController () <APIControllerProtocol, SearchTextFieldDelegate>

// private interface

@property(strong, nonatomic) NSMutableArray *friends;

@end

@implementation GitHubFriendsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GitHub Friends";
    
    self.friends = [[NSMutableArray alloc] init];
//    APIController *apiController = [[APIController alloc] init];
//    apiController.delegate = self;
//    [apiController searchGitHubFor:@"wiseguy16"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GenericCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Friend *aFriend = self.friends[indexPath.row];
    
    cell.textLabel.text = aFriend.name;
    cell.detailTextLabel.text = aFriend.login;
    
    return cell;
}

// *******************WE WILL NEED METHOD didSelectRowAtIndexPath****************

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    DetailFriendViewController *newFriendVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendDetailVC"];
    [[self navigationController] pushViewController:newFriendVC animated:YES];
    
    Friend *selectedFriend = self.friends[indexPath.row];
    newFriendVC.friend = selectedFriend;
    
    
}



- (void)loadFriends
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor:@"wiseguy16"];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SearchGitHubSegue"])
    {
        SeachFriendsViewController *setDateVC = [segue destinationViewController];
        setDateVC.delegate = self;
    }

}

#pragma mark - Date Set delegate

-(void)searchWasTyped:(NSString *)userToLookUp
{
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor:userToLookUp];
    [self.tableView reloadData];
    
}



-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse
{
    Friend *aFriend = [Friend friendWithDictionary:gitHubResponse];
    [self.friends addObject:aFriend];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

@end












