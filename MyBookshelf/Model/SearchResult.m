//
//  SearchResult.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//


#import "SearchResult.h"

@implementation SearchResult
 
- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary {
    self = [super init];
    if (self) {
        for (NSString* key in JSONDictionary) {
            if([key isEqualToString:@"books"]){
                NSDictionary *DictBook = [JSONDictionary valueForKey:key];
                NSMutableArray <Book *> *bookArr = [[NSMutableArray alloc] init];
                for (NSDictionary* bookDict in DictBook) {
                    Book *book = [[Book alloc] initWithJSONString:bookDict];
                    [bookArr addObject:book];
                }
                [self setValue:bookArr forKey:key];
            } else {
                [self setValue:[JSONDictionary valueForKey:key] forKey:key];
            }
        }
    }
    return self;
}

- (void)appendJson:(NSDictionary *)JSONDictionary {
    if(self.books != nil) {
        for (NSString* key in JSONDictionary) {
            if([key isEqualToString:@"books"]){
                NSDictionary *DictBook = [JSONDictionary valueForKey:key];
                NSMutableArray <Book *> *bookArr  = [NSMutableArray arrayWithArray:self.books];
                for (NSDictionary* bookDict in DictBook) {
                    Book *book = [[Book alloc] initWithJSONString:bookDict];
                    [bookArr addObject:book];
                }
                [self setValue:bookArr forKey:key];
            } else {
                [self setValue:[JSONDictionary valueForKey:key] forKey:key];
            }
        }
    }
}

@end
