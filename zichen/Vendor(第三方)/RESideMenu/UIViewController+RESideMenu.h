//
// UIViewController+RESideMenu.h
// RESideMenu
//
// Copyright (c) 2013-2014 Roman 
//

#import <UIKit/UIKit.h>

@class RESideMenu;

@interface UIViewController (RESideMenu)

@property (strong, readonly, nonatomic) RESideMenu *sideMenuViewController;

// IB Action Helper methods

- (IBAction)presentLeftMenuViewController:(id)sender;
- (IBAction)presentRightMenuViewController:(id)sender;

@end
