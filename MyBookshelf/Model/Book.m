//
//  Book.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import "Book.h"
@implementation Book
 
- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary
{
    self = [super init];
    if (self) {
        for (NSString* key in JSONDictionary) {
            [self setValue:[JSONDictionary valueForKey:key] forKey:key];
        }
    }
    return self;
}

@end
