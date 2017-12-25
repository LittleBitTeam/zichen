//
//  TabBarConfig.h
//  zichen
//
//  Created by 郑超华 on 2017/12/25.
//  Copyright © 2017年 郑超华. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
