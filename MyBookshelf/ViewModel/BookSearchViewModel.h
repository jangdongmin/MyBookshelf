//
//  BookSearchViewModel.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import "ReactiveObjC.h"
#import "SearchResult.h"
#import "BookDetail.h"
@interface BookSearchViewModel : NSObject


@property (nonatomic, strong) BookDetail *bookDetail;
@property (nonatomic, copy) NSString *searchText;
@property SearchResult *searchResult;
@property NSMutableArray *historyArr;

@property (nonatomic, strong) RACCommand *searchCommand;

-(void) nexPage;
-(void) fetchBookList:(NSString *)keyword;
-(void) fetchBookInfo:(NSString *)bookID;
-(void) loadData;

@end
