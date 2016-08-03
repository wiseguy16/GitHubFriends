//
//  Friend.h
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *login;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *avatar_url;
@property (nonatomic) NSNumber *public_repos;

+ (Friend *)friendWithDictionary:(NSDictionary *)friendDict;


@end
