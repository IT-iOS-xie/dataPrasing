//
//  DataParsingTests.m
//  DataParsingTests
//
//  Created by xie on 2017/9/2.
//  Copyright © 2017年 xie. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "config.h"

#import "SYYJSonToObjectBuilder.h"
#import "SYYJSonAbstractBuilderInterface.h"
#import "SYYJSonResponse.h"
#import "baseModel.h"
#import "programmerModel.h"

#import "authorModel.h"
#import "musicianModel.h"


#import "SYYJSonPersistBuilder.h"
@interface DataParsingTests : XCTestCase

@end

@implementation DataParsingTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.



}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    NSString* json_string = @"{ \"programmers\": [{ \"firstName\": \"Brett\", \"lastName\":\"McLaughlin\", \"email\": \"aaaa\" },{\"firstName\": \"Jason\", \"lastName\":\"Hunter\", \"email\": \"bbbb\" },{\"firstName\": \"Elliotte\", \"lastName\":\"Harold\", \"email\": \"cccc\" }],\"authors\": [{ \"firstName\": \"Isaac\", \"lastName\": \"Asimov\", \"genre\": \"science fiction\" },{ \"firstName\": \"Tad\", \"lastName\": \"Williams\", \"genre\": \"fantasy\" },{ \"firstName\": \"Frank\", \"lastName\": \"Peretti\", \"genre\": \"christian fiction\" }],\"musicians\": [{ \"firstName\": \"Eric\", \"lastName\": \"Clapton\", \"instrument\": \"guitar\" },{ \"firstName\": \"Sergei\", \"lastName\": \"Rachmaninoff\", \"instrument\": \"piano\" }]}";
    NSData *jsonData = [json_string dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization  JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    id<SYYJSonAbstractBuilderInterface> builder = nil;
    CREATE_JSON_TO_OBJECT_BUILDER(builder);
    SET_BUILDER_CONTAINER(builder, @"baseModel");
    SET_BUILDER_RESOURCE(builder, dic);
    ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"programmerModel", @"programmers")
    ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"authorModel", @"authors")
    ADD_BUILDER_RESOURCE_PROCESSOR(builder, @"musicianModel", @"musicians")
    id object = GET_RESULT(builder);
    
    
    SYYJSonAbstractBuilder* decode_builder = [[SYYJSonPersistBuilder alloc]init];
    
    SYYJSONBUILDER_VAR_TYPE decode_resource;
    decode_resource.instance_ = object;
    
    [decode_builder setBuilderResource:decode_resource];
    
    NSString* jsonString = [decode_builder getResult];
    
    NSLog(@"%@", jsonString);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
