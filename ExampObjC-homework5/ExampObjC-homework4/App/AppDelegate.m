//
//  AppDelegate.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/14/21.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: frame];
    
    ViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: viewController];
    
    [self.window setRootViewController: navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
