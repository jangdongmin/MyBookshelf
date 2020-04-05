//
//  MyBookshelfTests.m
//  MyBookshelfTests
//
//  Created by 100282 on 04/04/2020.
//  Copyright © 2020 Paul Jang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SearchResult.h"
#import "Book.h"
#import "DataSaveViewModel.h"

@interface MyBookshelfTests : XCTestCase

@end

@implementation MyBookshelfTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"setUp");
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    NSLog(@"tearDown");
}
 
- (void) testJSONParse {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"searchData" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    SearchResult *searchResult = [[SearchResult alloc] initWithJSONString:json];
        
    if(searchResult.page > 0 && searchResult.total > 0 && searchResult.books.count > 0) {
        XCTAssertTrue(TRUE);
    } else {
        XCTAssertTrue(FALSE);
    }
}

- (void) testUserDefaults {
    DataSaveViewModel *dataSaveViewModel = [[DataSaveViewModel alloc] init];
    [dataSaveViewModel saveData:@"keyValue1234" value:@"Value5678"];
    
    NSString *value = (NSString *)[dataSaveViewModel loadData:@"keyValue1234"];
    
    if([value isEqualToString:@"Value5678"]) {
        XCTAssertTrue(1);
    } else {
        XCTAssertTrue(0);
    }
}

@end
