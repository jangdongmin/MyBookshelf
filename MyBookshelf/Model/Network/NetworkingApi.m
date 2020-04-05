//
//  NetworkingApi.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkingApi.h"
#import "ReactiveObjC.h"

@implementation NetworkingApi

+ (instancetype)sharedInstance {
    static NetworkingApi *shared = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[NetworkingApi alloc] init];
    });

    return shared;
}

//https://api.itbook.store/1.0/search/mongodb
- (void) search:(NSString *)getURL completion:(void (^)(NSDictionary *))completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:getURL]];
    [request setHTTPMethod:@"GET"];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data != nil) {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            completion(json);
        } else {
            NSLog(@"error");
            completion(nil);
        }
    }] resume];
}


@end
