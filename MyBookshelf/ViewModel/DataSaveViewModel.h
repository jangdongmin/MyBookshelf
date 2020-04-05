//
//  DataSaveViewModel.h
//  MyBookshelf
//
//  Created by Paul Jang on 2020/04/01.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

@interface DataSaveViewModel : NSObject
 
-(void) saveData:(NSString *)key value:(NSString *)value;
-(NSObject *) loadData:(NSString *)key;
    
@end
