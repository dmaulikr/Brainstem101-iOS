//
//  BSAppDelegate.m
//  Brainstem101
//
//  Created by Cameron Ehrlich on 10/3/12.
//  Copyright (c) 2012 Brainstem101. All rights reserved.
//

#import "BSAppDelegate.h"

@implementation BSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [BSModel sharedModel];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
