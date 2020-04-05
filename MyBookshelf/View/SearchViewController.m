//
//  SearchViewController.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//
#import "ReactiveObjC.h"
#import "SearchViewController.h"
#import "SearchResultCustomCell.h"
#import "BookSearchViewModel.h"
#import "SearchDetailViewController.h"
@interface SearchViewController ()

@property(nonatomic, strong) BookSearchViewModel *viewModel;

@end

@implementation SearchViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self bindViewModel];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(historytableViewSelect:) name:@"historytableViewSelect" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tableViewSelect:) name:@"tableCellSelect" object:nil];
}

- (void) bindViewModel {
    self.viewModel = [[BookSearchViewModel alloc] init];
    [self.searchResultTableView bindViewModel:self.viewModel];
    [self.searchHistoryTableView bindViewModel:self.viewModel];
    
    RAC(self.viewModel, searchText) = self.searchTextField.rac_textSignal;
    
    [[self.searchTextField
        rac_signalForControlEvents:UIControlEventEditingDidBegin]
        subscribeNext:^(id x) {
            [self.searchHistoryTableView setHidden:FALSE];
        }];

    [[self.searchButton
            rac_signalForControlEvents:UIControlEventTouchUpInside]
            subscribeNext:^(id x) {
                [self.viewModel.searchCommand execute:nil];
        
                [self historyViewHidden];

                //검색 버튼 눌렀을때 최상단으로 이동.
                [self scrollUp];
            }];
    
    [[[RACObserve(self.viewModel, searchText) skip:1] deliverOnMainThread] subscribeNext:^(id value) {
        self.searchTextField.text = self.viewModel.searchText;
    }];
     
    [[[RACObserve(self.viewModel, bookDetail) skip:1] deliverOnMainThread] subscribeNext:^(id value) {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SearchDetailViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"SearchDetailViewController"];
        NSLog(@"value : %@",value);
        vc.bookDetail = value;
        [self.navigationController pushViewController:vc animated:true];
    }];
}

- (void) historyViewHidden {
    [self.searchHistoryTableView setHidden:TRUE];
    [self.searchTextField resignFirstResponder];
}

-(void) tableViewSelect:(NSNotification *) notification {
    int index = [[[notification userInfo] valueForKey:@"index"] intValue];
    NSLog(@"tableViewSelect : %d",index);
        
    [self historyViewHidden];
    
    [self.viewModel fetchBookInfo:self.viewModel.searchResult.books[index].isbn13];
}

-(void) historytableViewSelect:(NSNotification *) notification {
    [self scrollUp];
    [self historyViewHidden];
}

-(void) scrollUp {
    if(self.searchResultTableView.visibleCells.count > 0) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.searchResultTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
        [self.searchResultTableView setHidden:YES];
    }
}
@end
 
