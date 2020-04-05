//
//  Book.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Book : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *isbn13;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithJSONString:(NSDictionary *)JSONDictionary;

@end
