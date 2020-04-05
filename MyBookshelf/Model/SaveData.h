//
//  SaveData.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//
#import <Foundation/Foundation.h>
#define NSUserDefaultsKeyValue @"KeyWord"
#define MemoKeyValue @"Memo"
@interface SaveData : NSObject

+ (void) insertSearchKeyWord:(NSString *)keyWord;
+ (NSMutableArray *) getSearchKeyWord;

+ (void) setNSUserDefaults:(NSString *)key value:(NSString *)value;
+ (NSObject *) getNSUserDefaults:(NSString *)key;
@end
