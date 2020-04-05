//
//  SearchHistoryTableView.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import "SearchHistoryTableView.h"
#import "SearchHistoryCustomCell.h"
 
@interface SearchHistoryTableView ()

@property BookSearchViewModel *viewModel;

@end

@implementation SearchHistoryTableView

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:(NSCoder *)aDecoder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
 
- (void) bindViewModel:(BookSearchViewModel *)viewModel {
    self.viewModel = viewModel;
     
    [[[RACObserve(self.viewModel, historyArr) skip:1] deliverOnMainThread] subscribeNext:^(id value) {
        NSLog(@"self.viewModel.historyArr = %@",self.viewModel.historyArr);
        [self reloadData];
    }];

    [[[RACObserve(self, hidden) skip:1] deliverOnMainThread] subscribeNext:^(id value) {
        NSLog(@"hidden : %@",value);
        if(value) {
            [self.viewModel loadData];
        }
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    SearchHistoryCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistoryCustomCell" forIndexPath:indexPath];
    
    if(self.viewModel != nil) {
        cell.titleLabel.text = self.viewModel.historyArr[indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.viewModel == nil) {
        return 0;
    }
    return self.viewModel.historyArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel fetchBookList:self.viewModel.historyArr[indexPath.row]];
    [self setHidden:TRUE];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"historytableViewSelect" object:self userInfo:nil];
}
 
@end



 
