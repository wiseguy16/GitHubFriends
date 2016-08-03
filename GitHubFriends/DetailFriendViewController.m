//
//  DetailFriendViewController.m
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "DetailFriendViewController.h"

@interface DetailFriendViewController ()

// ADD PROPERTIES AND CONECTIONS HERE!!!!

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *friendImageView;

- (void)configureView;

@end

@implementation DetailFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureView];
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

#pragma mark - Managing the detail view

- (void)setFriend:(Friend *)newFriend
{
    if (_friend != newFriend)
    {
        _friend = newFriend;
        
        // Update the view.
        [self configureView];
    }
}



#pragma mark - Configure the view

- (void)configureView
{
     if (self.friend)
     {
         self.title = [NSString stringWithFormat: @"GitHub Friend"];
         self.nameLabel.text = self.friend.name;
         self.loginLabel.text = self.friend.login;
         self.locationLabel.text = self.friend.location;
         NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.friend.avatar_url]];
        // cell.image = [UIImage imageWithData: imageData];
         
         self.friendImageView.image = [UIImage imageWithData: imageData];
        // [imageData release];
         
         
     }

}
    
@end
