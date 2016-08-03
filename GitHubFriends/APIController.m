//
//  APIController.m
//  GitHubFriends
//
//  Created by Gregory Weiss on 8/3/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "APIController.h"

@implementation APIController

-(void)searchGitHubFor:(NSString *)searchTerm
{
    
    NSString *gitHubSearchTerm = [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *escapedSearchTerm = [gitHubSearchTerm stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet alphanumericCharacterSet]];
    

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@", escapedSearchTerm]];

    NSURLSession *session =[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"Could not communicate to iTunes: %@", [error localizedDescription]);
                                          }
                                          else
                                          {
                                              NSError *parseError = nil;
                                              NSDictionary *gitHubResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
                                             // NSArray *results = gitHubResponse[@"results"];
                                              [self.delegate didReceiveAPIResults:gitHubResponse];
                                          }
                                          
                                      }];
    
    [dataTask resume];
}


@end

//  https://api.github.com/users/wiseguy16