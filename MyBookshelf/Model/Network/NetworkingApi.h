//
//  NetworkingApi.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

@interface NetworkingApi : NSObject

+ (instancetype)sharedInstance;
- (void) search:(NSString *)getURL completion:(void (^)(NSDictionary *))completion;
@end
