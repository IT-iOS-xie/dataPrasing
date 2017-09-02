//
//  config.h
//  SYY
//
//  Created by kuoxin on 7/12/16.
//  Copyright © 2016 cn.com.rockmobile. All rights reserved.
//

#ifndef __syytests_config_h__
#define __syytests_config_h__

#define XCTEST_CREATE_JSON_TO_OBJECT_BUILDER   \
    SYYJSonToObjectBuilder* builder = [[SYYJSonToObjectBuilder alloc] init];    \
    XCTAssertNil(builder, @"创建JSonToObjectBuilder失败...");


#define XCTEST_SET_BUILDER_CONTAINER(builder, className)    \
    SYYJSONBUILDER_VAR_TYPE container;  \
    container.className_ = className; \
    XCTAssertTrue([builder buildContainer: container] == YES, @"设置容量类失败...");


#define XCTEST_SET_BUILDER_RESOURCE(builder, resource) \
    SYYJSONBUILDER_VAR_TYPE res;   \
    res.instance_ = resource;    \
    XCTAssertTrue([builder setBuilderResource:res] == YES, @"设置资源失败...");


#define XCTEST_SET_BUILDER_RESOURCE_PROCESSOR(builder, class, key)     \
    {   \
        SYYJSONBUILDER_VAR_TYPE rt;  \
        SYYJSONBUILDER_VAR_TYPE rk;   \
        rt.className_ = class;    \
        rk.jsonKeyName_ = key;    \
        XCTAssertTrue([builder addBuilderResourceProcessor:rt keyName:rk] == YES, @"添加资源处理器失败..."); \
    }


#define XCTEST_GET_RESULT(builder) \
    id object = [builder getResult];    \
    XCTAssertNil(object, @"[builder getResult] return nil...");


#endif /* __syytests_config_h__ */
