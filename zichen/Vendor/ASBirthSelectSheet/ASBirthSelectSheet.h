//
//  ASBirthSelectSheet.h
//  ASBirthSheet
//
//  Created by littleBit on 15/12/8.
//  Copyright © 2015年 littleBit. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ASBirthSelectSheet : UIActionSheet

@property (nonatomic, copy) void(^GetSelectDate)(NSString *dateStr,NSDate *date);
@property (nonatomic, strong) NSString * selectDate;
- (void)setDateModeWithMode:(UIDatePickerMode ) model andFormaString:(NSString *)string;

@end
