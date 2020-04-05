//
//  SearchResultTableView.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import "SearchResultTableView.h"
#import "SearchResultCustomCell.h"
#import "LoadingCell.h"
#import <SDWebImage/SDWebImage.h>

@interface SearchResultTableView ()

@property BookSearchViewModel *viewModel;

@end

@implementation SearchResultTableView

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
    
    [[RACObserve(viewModel, searchResult) deliverOnMainThread] subscribeNext:^(id value) {
        [self setHidden:NO];
        [self reloadData];
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    SearchResultCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchResultCustomCell" forIndexPath:indexPath];
    
    if (indexPath.row < self.viewModel.searchResult.books.count) {
        Book *book = self.viewModel.searchResult.books[indexPath.row];
        cell.isbn13Label.text = book.isbn13;
        cell.titleLabel.text = book.title;
        cell.subtitleLabel.text = book.subtitle;
        cell.priceLabel.text = book.price;
        cell.urlLabel.text = book.url;

        [cell.mainImgView sd_setImageWithURL:[NSURL URLWithString:book.image]
                     placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
        return cell;
    } else {
        LoadingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"loadingCell" forIndexPath:indexPath];
        [cell.indicatorView startAnimating];
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.viewModel.searchResult.page < self.viewModel.searchResult.total) {
        return self.viewModel.searchResult.books.count + 1;
    }
    return self.viewModel.searchResult.books.count;
}
 
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSArray* cells = self.visibleCells;
    NSIndexPath *indexPath = nil ;

    for (int aIntCount = 0; aIntCount < [cells count]; aIntCount++) {
        UITableViewCell *cell = [cells objectAtIndex:aIntCount];
        CGRect cellRect = [self convertRect:cell.frame toView:self.superview];

        if (CGRectContainsRect(self.frame, cellRect)) {
            indexPath = [self indexPathForCell:cell];
            
            if(indexPath.row == self.viewModel.searchResult.books.count - 1) {
                NSLog(@"next page");
                [self.viewModel nexPage];
            }
        }
     }
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary* dict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:(int)indexPath.row] forKey:@"index"];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"tableCellSelect" object:self userInfo:dict];
}
 
@end



 
