//
//  Friend.m
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "Friend.h"

@implementation Friend

+ (Friend *)friendWithDictionary:(NSDictionary *)friendDict
{
    Friend *aFriend = nil;
    if (friendDict)
    {
        aFriend = [[Friend alloc] init];
        aFriend.name = friendDict[@"name"];
        aFriend.login = friendDict[@"login"];
        aFriend.location = friendDict[@"location"];
        aFriend.avatar_url = friendDict[@"avatar_url"];
        aFriend.public_repos = friendDict[@"public_repos"];
    }
    
    return aFriend;
}




@end
