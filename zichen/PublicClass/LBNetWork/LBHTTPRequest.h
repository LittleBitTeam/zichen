//
//  LBHTTPRequest.h
//  meishihui
//
//  Created by 郑超华 on 2017/4/21.
//  Copyright © 2017年 郑超华. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^resultBlock) (NSDictionary *resultDic,NSError *error);//请求回调block

@interface LBHTTPRequest : NSObject

#pragma mark - 登录接口
+ (void)getLoginWithParameter:(NSDictionary *)parameter resultBlock:(resultBlock)resultBlock;

+(void)getWechatParamsWithOIderId:(NSDictionary *)param resultBlock:(resultBlock)resultBlock ;
#pragma mark - 微信统一下单接口
+(void)getPrepayIdWithParam:(NSDictionary *)param resultBlock:(resultBlock)resultBlock ;

#pragma mark - 判断用户是否登录
+ (BOOL)isLogin;

#pragma mark - 获取用户ID
+ (NSString *)getUserID;

#pragma mark - 获取用户名字
+ (NSString *)getUserName;

#pragma mark - 获取用户所在公司ID
+ (NSString *)getUserCompanyID;

#pragma mark - 获取用户所在单位
+ (NSString *)getUserModule;

#pragma mark - 获取用户所在部门
+ (NSString *)getUserDep;

#pragma mark - 获取用户工作
+ (NSString *)getUserJob;

#pragma mark - 退出登录
+ (void)exitLogin;


@end
