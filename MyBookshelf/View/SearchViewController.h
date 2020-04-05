//
//  SearchViewController.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultTableView.h"
#import "SearchHistoryTableView.h"

@interface SearchViewController : UIViewController 
{
    
}
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet SearchResultTableView *searchResultTableView;
@property (weak, nonatomic) IBOutlet SearchHistoryTableView *searchHistoryTableView;

- (void) bindViewModel;
@end

