//
//  SearchResultCustomCell.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultCustomCell : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *mainImgView;
@property (weak, nonatomic) IBOutlet UILabel *isbn13Label;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

@end
