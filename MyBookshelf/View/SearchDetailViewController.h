//
//  SearchDetailViewController.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookDetail.h"
@interface SearchDetailViewController : UIViewController
{
    NSString *linkUrl;
}
 
@property BookDetail *bookDetail;
@property (weak, nonatomic) IBOutlet UIImageView *mainImgView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UILabel *language;
@property (weak, nonatomic) IBOutlet UILabel *publisher;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *authors;
@property (weak, nonatomic) IBOutlet UILabel *desc;

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollview;
 
@end

