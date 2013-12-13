//
//  bgvAppDelegate.m
//  BGFetch
//
//  Created by Kenji Imai on 2013/11/28.
//  Copyright (c) 2013年 Kenji Imai. All rights reserved.
//

#import "bgvAppDelegate.h"

@implementation bgvAppDelegate

bgvViewController *vc;


- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
// Background Fetchの際の処理内容
{
    NSURL *path = [[NSURL alloc] initWithString:@"http://www.google.com/"];
    
    NSError *error = nil;
    NSURLResponse *res = nil;
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:path
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:15.0];
    NSData *myData = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:&error];
    NSLog(@"data: %@",myData);
    
    if (error) {
        completionHandler(UIBackgroundFetchResultFailed);
        return;
    } else {
        NSDate *now = [NSDate date];
        [_loadingDate addObject:now];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber++; // バッジの数をインクリメント
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = [[bgvViewController alloc] init];
        [self.window makeKeyAndVisible];
        
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    _loadingDate = [[NSMutableArray alloc] init];
    
    // Background Fetchの準備
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[bgvViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0; // バッジの数をリセット
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
