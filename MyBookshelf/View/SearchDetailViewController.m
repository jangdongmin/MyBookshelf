//
//  SearchDetailViewController.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/03/31.
//  Copyright © 2020 Paul Jang. All rights reserved.
//
#import "ReactiveObjC.h"
#import "SearchDetailViewController.h"
#import "DataSaveViewModel.h"
#import <SDWebImage/SDWebImage.h>

@interface SearchDetailViewController ()

@property(nonatomic, strong) DataSaveViewModel *viewModel;

@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bindViewModel];
    [self setupUI];
     
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
}
 
- (void) setupUI {
    self.titleLabel.text = self.bookDetail.title;
    self.subtitleLabel.text = self.bookDetail.subtitle;
    self.priceLabel.text = self.bookDetail.price;
    
    self.language.text = self.bookDetail.language;
    self.publisher.text = self.bookDetail.publisher;
    self.rating.text = self.bookDetail.rating;
    self.authors.text = self.bookDetail.authors;
    self.desc.text = self.bookDetail.desc;
    
    linkUrl = self.urlLabel.text = self.bookDetail.url;
    self.textView.text = (NSString *)[self.viewModel loadData:self.bookDetail.isbn13];

    [self.mainImgView sd_setImageWithURL:[NSURL URLWithString:self.bookDetail.image]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.bookDetail.url attributes:nil];
    NSRange linkRange = NSMakeRange(0, self.bookDetail.url.length); // for the word "link" in the string above

    NSDictionary *linkAttributes = @{ NSForegroundColorAttributeName : [UIColor colorWithRed:0.05 green:0.4 blue:0.65 alpha:1.0],
                                     NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle) };
    [attributedString setAttributes:linkAttributes range:linkRange];
    self.urlLabel.attributedText = attributedString;
    self.urlLabel.userInteractionEnabled = YES;
    [self.urlLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnLabel:)]];
}

- (void) bindViewModel {
    self.viewModel = [[DataSaveViewModel alloc] init];
    
    [[self.backButton
        rac_signalForControlEvents:UIControlEventTouchUpInside]
        subscribeNext:^(id x) {
            [self.navigationController popViewControllerAnimated:true];
        }];
    
    [[self.saveButton
        rac_signalForControlEvents:UIControlEventTouchUpInside]
        subscribeNext:^(id x) {
            NSLog(@"saveButton : %@", self.textView.text);
            [self.viewModel saveData:self.bookDetail.isbn13 value:self.textView.text];
            [self.navigationController popViewControllerAnimated:true];
        }];
}

- (void)handleTapOnLabel:(UITapGestureRecognizer *)tapGesture
{
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:linkUrl];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
             NSLog(@"Opened url");
        }
    }];
}

- (void)keyboardDidShow:(NSNotification *)notification {
    [self.contentScrollview setContentOffset:CGPointMake(0, [self.textView convertPoint:self.textView.frame.origin toView:self.contentScrollview].y - self.textView.frame.size.height/2) animated:true];
}
 
@end
 
