//
//  MainTabBarController.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "MainTabBarController.h"

#import "HomeViewController.h"
#import "FindingsViewController.h"
#import "PersonalViewController.h"
#import "BaseNavigationController.h"

#import "CommonMacro.h"
#import "CartoonDetailViewController.h"
#import "UIView+Extension.h"

@interface MainTabBarController ()

@property (nonatomic,weak) MainTabbar *mainTabbar;


@end

@implementation MainTabBarController

- (void)loadView {
    [super loadView];
    
    weakself(self);
 
    MainTabbar *tabbar = [[MainTabbar alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH,bottomBarHeight)];
    tabbar.backgroundColor = [UIColor whiteColor];
    [tabbar addItemWithImageNames:@[@"home",@"discover",@"me"]];
    [tabbar setSelectAtIndex:^(UIButton *btn, NSInteger index) {
        weakSelf.selectedIndex = index;
    }];
    [self.view addSubview:tabbar];
    
    _mainTabbar = tabbar;

    [self.tabBar removeFromSuperview];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController * home = [[HomeViewController alloc] init];
    
    FindingsViewController * find = [[FindingsViewController alloc] init];

    UIViewController *person = [UIStoryboard storyboardWithName:@"PersonalCenter" bundle:nil].instantiateInitialViewController;

    
    [self addChildViewControllers:@[home,find]];
    
    [super addChildViewController:person];
}

- (void)addChildViewControllers:(NSArray *)childControllers  {
    
    for (NSInteger index = 0; index < childControllers.count; index++) {
        BaseNavigationController *navHome = [[BaseNavigationController alloc] initWithRootViewController:childControllers[index]];
        [super addChildViewController:navHome];
    }
}

- (void)setHidesBottomBar:(BOOL)hidesBottomBar {
    
    if (hidesBottomBar) {
        
        [UIView animateWithDuration:0.25 animations:^{
            [self.mainTabbar setY:SCREEN_HEIGHT];
        }];
        
    }else {
        
        [UIView animateWithDuration:0.25 delay:0.5 usingSpringWithDamping:0.8f initialSpringVelocity:15.0f options:UIViewAnimationOptionTransitionNone animations:^{
            
            [self.mainTabbar setY:SCREEN_HEIGHT - 44];
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
}



@end
