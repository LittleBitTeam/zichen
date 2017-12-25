//
//  GCDSocketManager.h
//  JPush
//
//  Created by littleBit on 2017/6/16.
//  Copyright © 2017年 littleBit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
@interface GCDSocketManager : NSObject
@property(nonatomic,strong) GCDAsyncSocket *socket;

//单例
+ (instancetype)sharedSocketManager;

//连接
- (void)connectToServer;

//断开
- (void)cutOffSocket;
@end
