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
@property(strong, nonatomic) NSString *searchWord;

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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
   // self.searchWord = userToLookUp;
    APIController *apiController = [[APIController alloc] init];
    apiController.delegate = self;
    [apiController searchGitHubFor:userToLookUp];
    //[APIController searchGitHubFor:self.searchWord];
    [self.tableView reloadData];
    
    //  jcgohlke
}



-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse
{
    /*
    for (NSDictionary *result in gitHubResponse)
    {
        NSString *name = result[@"name"];
                [self.friends addObject:name];
    }
     
     @property (nonatomic) NSString *login;
     @property (nonatomic) NSString *location;
     @property (nonatomic) NSString *avatar_url;
     @property (nonatomic) NSNumber *public_repos;
     
     
     
     */
    Friend *aFriend = [Friend friendWithDictionary:gitHubResponse];
    [self.friends addObject:aFriend];
    
    
//    NSString *resultName = gitHubResponse[@"name"];
//    [self.friends addObject:resultName];
//    NSString *resultLogin = gitHubResponse[@"login"];
//    [self.friends addObject:resultLogin];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

@end












