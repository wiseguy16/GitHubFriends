//
//  GitHubFriendsTableViewController.h
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APIControllerProtocol

-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse;

@end

@interface GitHubFriendsTableViewController : UITableViewController

@end
