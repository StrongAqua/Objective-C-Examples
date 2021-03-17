//
//  TabBarController.m
//  ExampObjC-homework4
//
//  Created by aprirez on 3/16/21.
//

#import "TabBarController.h"
#import "ViewController.h"
#import "AnotherViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        ViewController *viewController = [[ViewController alloc] init];
        viewController.tabBarItem = [[UITabBarItem alloc]  initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
        UINavigationController *firstNavigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        AnotherViewController *anotherViewController = [[AnotherViewController alloc] init];
        anotherViewController.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        
        self.viewControllers = @[firstNavigationController, anotherViewController];
        self.tabBar.tintColor = [UIColor blackColor];
        self.selectedIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Homework5";
    
}

@end
