//
//  bgvAppDelegate.h
//  BGFetch
//
//  Created by Kenji Imai on 2013/11/28.
//  Copyright (c) 2013年 Kenji Imai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bgvViewController.h"

@interface bgvAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSMutableArray *loadingDate;

@end
