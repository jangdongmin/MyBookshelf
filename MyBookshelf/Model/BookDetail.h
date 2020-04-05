//
//  BookDetail.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BookDetail : NSObject

@property (nonatomic, copy) NSString *authors;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *error;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *isbn10;
@property (nonatomic, copy) NSString *isbn13;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *pages;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *year;

- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary;

@end

//authors = "James A. Whittaker";
//desc = "Drawing on nearly two decades of experience working at the cutting edge of testing with Google, Microsoft, and other top software organizations, Whittaker introduces innovative new processes for manual testing that are repeatable, prescriptive, teachable, and extremely effective. Whittaker defines b...";
//error = 0;
//image = "https://itbook.store/img/books/9780321636416.png";
//isbn10 = 0321636414;
//isbn13 = 9780321636416;
//language = English;
//pages = 256;
//price = "$16.89";
//publisher = "Addison-Wesley";
//rating = 4;
//subtitle = "Tips, Tricks, Tours, and Techniques to Guide Test Design";
//title = "Exploratory Software Testing";
//url = "https://itbook.store/books/9780321636416";
//year = 2009;
