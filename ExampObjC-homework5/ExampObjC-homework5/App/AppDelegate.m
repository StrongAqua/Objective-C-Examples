//
//  AppDelegate.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import "AppDelegate.h"
#import "TabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    TabBarController *viewController = [[TabBarController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: viewController];
    
    [self.window setRootViewController: navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
