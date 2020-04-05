//
//  SearchResultTableView.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookSearchViewModel.h"

@interface SearchResultTableView: UITableView <UITableViewDelegate, UITableViewDataSource>
{
    
}
 
- (void) bindViewModel:(BookSearchViewModel *)viewModel;

@end

