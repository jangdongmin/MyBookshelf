//
//  BookSearchViewModel.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "BookSearchViewModel.h"
#import "NetworkingApi.h"
#import "SaveData.h"

#define LIST 0
#define APPEND 1
#define DETAIL 2

@interface BookSearchViewModel ()

@end

@implementation BookSearchViewModel

-(id) init {
    self = [super init];
    if(!self) return nil;

    self.searchText = @"";
    
    self.searchCommand = [[RACCommand alloc] initWithSignalBlock:^(id sender) {
        [self fetchBookList:self.searchText];
        [self saveData:self.searchText];
        return [RACSignal empty];
    }];
    
    
    return self;
}

-(void) fetchBookList:(NSString *)keyword {
    self.searchText = keyword;
    NSString *url = [self makeUrl:keyword page:0 mode:LIST];
    [self fetchBookInfo:url mode:LIST];
}

-(void) nexPage {
    NSString *url = [self makeUrl:self.searchText page:(self.searchResult.page+1) mode:APPEND];
    [self fetchBookInfo:url mode:APPEND];
}

-(void) fetchBookInfo:(NSString *)bookID {
    NSString *url = [self makeUrl:bookID page:0 mode:DETAIL];
    [self fetchBookInfo:url mode:DETAIL];
}

-(NSString *) makeUrl:(NSString *)keyword page:(int)page mode:(int)mode {
    NSString *ApiUrl = @"https://api.itbook.store/1.0/";
    if(mode == DETAIL) {
        return [NSString stringWithFormat:@"%@books/%@", ApiUrl, keyword];
    } else {
        return [NSString stringWithFormat:@"%@search/%@/%d", ApiUrl, keyword, page];
    }
}

-(void) fetchBookInfo:(NSString *)url mode:(int)mode {
    [NetworkingApi.sharedInstance search:url completion:^(NSDictionary *json) {
        NSLog(@"json = %@",json);
        if(json != nil) {
            [self jsonPaser:mode json:json];
        }
    }];
}

-(void) jsonPaser:(int)mode json:(NSDictionary *) json {
    if(mode == LIST) {
        self.searchResult = [[SearchResult alloc] initWithJSONString:json];
    } else if(mode == APPEND) {
        [self.searchResult appendJson:json];
        self.searchResult = self.searchResult;
    } else {
        self.bookDetail = [[BookDetail alloc] initWithJSONString:json];
    }
}


-(void) loadData {
    self.historyArr = [SaveData getSearchKeyWord];
}

-(void) saveData:(NSString *)value {
    if(![value isEqualToString:@""]) {
        [SaveData insertSearchKeyWord:value];
        [self loadData];
    }
}

@end
