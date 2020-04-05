//
//  SaveData.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import "SaveData.h"

@implementation SaveData
  
+ (void) insertSearchKeyWord:(NSString *)keyWord {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userDefaults objectForKey:NSUserDefaultsKeyValue];
    if(arr != nil) {
        NSMutableArray *keyWordArr = [NSMutableArray arrayWithArray:arr];
        [keyWordArr addObject:keyWord];
        [userDefaults setObject:keyWordArr forKey:NSUserDefaultsKeyValue];
        
    } else {
        NSMutableArray *keyWordArr = [[NSMutableArray alloc] init];
        [keyWordArr addObject:keyWord];
        [userDefaults setObject:keyWordArr forKey:NSUserDefaultsKeyValue];
    }

    [userDefaults synchronize];
}

+ (NSMutableArray *) getSearchKeyWord {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [userDefaults objectForKey:NSUserDefaultsKeyValue];
    if(arr != nil) {
        return [NSMutableArray arrayWithArray:arr];
    }
    return [[NSMutableArray alloc] init];
}

+ (void) setNSUserDefaults:(NSString *)key value:(NSString *)value {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+ (NSObject *) getNSUserDefaults:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

@end
