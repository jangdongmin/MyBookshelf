//
//  SearchResult.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Book.h"

@interface SearchResult : NSObject

@property (nonatomic, assign) int total;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) int error;
@property (nonatomic, copy) NSMutableArray <Book *> *books;

- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary;
- (void)appendJson:(NSDictionary *)JSONDictionary;
@end
