//
//  AppDelegate.m
//  SingleViewApp
//
//  Created by Сергей Вихляев on 08/07/2019.
//  Copyright © 2019 Сергей Вихляев. All rights reserved.
//

#import "AppDelegate.h"
#import <UIKit/UIKit.h>

#import "StartViewController.h"

@interface AppDelegate ()

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];

    [self showStartVC];

    return YES;
}

- (void) showStartVC {
    UINavigationController* navigationController = [UINavigationController new];
    StartViewController* startVC = [StartViewController new];
    navigationController.viewControllers = @[startVC];
    _window.rootViewController = navigationController;
    [_window makeKeyAndVisible];
}

@end
