//
//  SYYAbstractCoordinator.h
//  SYY
//
//  Created by kuoxin on 7/7/16.
//  Copyright © 2016 cn.com.rockmobile. All rights reserved.
//

#ifndef SYYAbstractCoordinator_h
#define SYYAbstractCoordinator_h


/**
 *    提供系统协调器抽象协议
 */
@protocol SYYAbstractCoordinator



/**
 * 得到推荐列表
 * @param type  推荐内容类型·
 * @param timestamp   用户关注的其他用户的时间
 * @param getInfoUseBlocking  成功后，获取的回调函数
 * @param getFailureUseBlocking  失败后，获取信息回调函数
 */
//- (void) getRecommendedInfo:(SYY_RECOMMENDED_INFO_TYPE) type uid:(int)uid
//                  timestamp:(NSInteger)timestamp
//         getInfoUseBlocking:(void (^)(id response))getInfoUseBlocking
//      getFailureUseBlocking:(void (^)(id error))getFailureUseBlocking;

@end


#endif /* SYYAbstractCoordinator */
