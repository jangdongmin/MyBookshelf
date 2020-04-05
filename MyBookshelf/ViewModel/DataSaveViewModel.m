//
//  DataSaveViewModel.m
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "DataSaveViewModel.h"
#import "SaveData.h"
@interface DataSaveViewModel ()

@end

@implementation DataSaveViewModel

-(id) init {
    self = [super init];
    if(!self) return nil;
    
    return self;
}
 
-(void) saveData:(NSString *)key value:(NSString *)value {
    [SaveData setNSUserDefaults:key value:value];
}

-(NSObject *) loadData:(NSString *)key {
    return [SaveData getNSUserDefaults:key];
}

@end
