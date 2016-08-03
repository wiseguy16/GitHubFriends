//
//  SeachFriendsViewController.h
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitHubFriendsTableViewController.h"

@interface SeachFriendsViewController : UIViewController

@property (nonatomic) id<SearchTextFieldDelegate> delegate;

@end
