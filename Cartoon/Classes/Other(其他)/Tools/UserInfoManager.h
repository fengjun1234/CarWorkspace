//
//  UserInfoManager.h
//  快看漫画
//
//  Created by 金亮齐 on 16/6/28.
//  Copyright © 2016年 金亮齐. All rights reserved.
//

//我的博客项目介绍 http://www.jianshu.com/users/ef13bae228f6/latest_articles
//我的Github介绍 https://github.com/qijinliang

#import <Foundation/Foundation.h>

static NSString * const passwordKey = @"password";
static NSString * const phoneKey    = @"phone";


//用户注销
static NSString * const userLogoutNotification        = @"UserLogoutNotification";

//登陆成功
static NSString * const loginSuucceedNotification     = @"UserLoginSuucceedNotification";

//登录失败
static NSString * const loginFailedNotification       = @"UserLoginFailedNotification";

//登录状态发生改变
static NSString * const loginStatusChangeNotification = @"UserLoginStatusChangeNotification";


@class CommentsModel;
@class UIButton;

@interface UserInfoManager : NSObject

+ (instancetype)share;

@property BOOL hasLogin;

@property (nonatomic,copy)   NSString *avatar_url;      //头像

@property (nonatomic,strong) NSNumber *ID;              //ID

@property (nonatomic,copy)   NSString *nickname;        //昵称

@property (nonatomic,copy)   NSString *reg_type;

@property (nonatomic,strong) NSNumber *update_remind_flag;


+ (void)autoLogin;  //自动登录
+ (BOOL)needLogin;

+ (void)sendMessage:(NSString *)meassage        //评论和回复
            isReply:(BOOL)isreply               //是否是回复
             withID:(NSString *)ID              //评论使用作品的ID,回复使用要回复的用户评论ID
             withSucceededCallback:(void (^)(CommentsModel *))succeededCallback;

+ (void)loginWithPhone:(NSString *)phone        //登录
          WithPassword:(NSString *)password
          loginSucceed:(void (^)(UserInfoManager *user))succeed
           loginFailed:(void (^)(id faileResult,NSError *error))failed;

+ (void)followWithUrl:(NSString *)url                   //关注
             isFollow:(BOOL)isfollow                    //关注还是取消关注
   WithfollowCallBack:(void(^)(BOOL succeed))callback;  //回调

- (void)logoutUserInfo; //注销

@end
