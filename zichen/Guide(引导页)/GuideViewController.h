//
//  GuideViewController.h
//  meishihui
//
//  Created by littleBit on 2017/4/24.
//  Copyright © 2017年 ZCH. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void(^guideViewBtnBlock)();
@interface GuideViewController : UIViewController
@property (nonatomic ,strong)UIButton *button;
@property (nonatomic,copy)guideViewBtnBlock guideBtnBlock;
@end
