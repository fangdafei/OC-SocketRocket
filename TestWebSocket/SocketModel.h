//
//  SocketModel.h
//  TestWebSocket
//
//  Created by xrs_fang on 2018/6/14.
//  Copyright © 2018年 xrs_fang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketModel : NSObject

+(instancetype)share;

//  建立连接
- (void)connect;
//  断开连接
- (void)disConnect;
//  发消息
- (void)sendMsg:(NSString *)msg;
// pingpong
- (void)ping;

@end
