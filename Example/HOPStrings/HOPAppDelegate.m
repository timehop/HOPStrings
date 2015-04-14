//
//  HOPAppDelegate.m
//  HOPStrings
//
//  Created by CocoaPods on 04/13/2015.
//  Copyright (c) 2014 Chris Trott. All rights reserved.
//

#import "HOPAppDelegate.h"

#import "HOPViewController.h"

@implementation HOPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[HOPViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
