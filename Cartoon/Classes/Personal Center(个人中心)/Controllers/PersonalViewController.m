//
//  PersonalViewController.m
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import "PersonalViewController.h"
#import <UIImageView+WebCache.h>
#import "LoginViewController.h"
#import "UserInfoManager.h"
#import "UIView+Extension.h"
#import "MainTabBarController.h"

#import "MyMessageViewController.h"
#import "MyFellowViewController.h"
#import "MyCollectionViewController.h"

@interface PersonalViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;

@property (weak, nonatomic) IBOutlet UILabel *userName;

@property (nonatomic,strong) UserInfoManager *user;

@end


@implementation PersonalViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userIcon cornerRadius:0];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginStatusChange) name:loginStatusChangeNotification object:nil];
    
    [self loginStatusChange];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    MainTabBarController *main = (MainTabBarController *)self.tabBarController;
    
    [main setHidesBottomBar:NO];
    
    [self.navigationController setNavigationBarHidden:YES];
  
}

- (void)loginStatusChange {
    
    if (self.user.hasLogin) {
        [self.userIcon sd_setImageWithURL:[NSURL URLWithString:self.user.avatar_url]];
        self.userName.text = self.user.nickname;
    }else {
        [self.userIcon setImage:[UIImage imageNamed:@"ic_personal_avatar_83x83_"]];
        self.userName.text = @"登录";
    }
    
}

- (IBAction)needLogin:(id)sender {
    
    if (self.user.hasLogin) {
        return;
    }
    
    LoginViewController *lvc = [LoginViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:lvc];

    [self presentViewController:nav animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) return;
    if ([UserInfoManager needLogin]) return;
    
    if (indexPath.section == 0)
    {
        [self.navigationController pushViewController:[MyMessageViewController new] animated:YES];
        return;
    }
    if (indexPath.section == 1)
    {
        if (indexPath.row == 0) {
            [self.navigationController pushViewController:[MyFellowViewController new] animated:YES];
            return;
        }
        
        if (indexPath.row == 1) {
            [self.navigationController pushViewController:[MyCollectionViewController new] animated:YES];
            return;
        }
        
    }
    
    if (indexPath.section == 2)
    {
        
    }
    
}

- (UserInfoManager *)user {
    if (!_user) {
        _user = [UserInfoManager share];
    }
    return _user;
}

@end
