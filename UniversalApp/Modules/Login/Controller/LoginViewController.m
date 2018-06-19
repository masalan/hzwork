//
//  LoginViewController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
// jason test

#import "LoginViewController.h"
#import <UMSocialCore/UMSocialCore.h>
#import "loginViewPage.h"
#import "ETNavStyleHelper.h"
#import "ETConfig.h"

@interface LoginViewController ()<loginViewPageDelegate>
@property (strong, nonatomic) loginViewPage *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.view addSubview:self.loginView];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.loginView.frame = self.view.frame;
    
    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    backBtn.frame = CGRectMake(12,12, 20, 20);
//    [backBtn setImage:IMAGE_NAMED(@"back_icon") forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backBtn];
}

#pragma mark - method resquest
- (void)popView {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - getter and setter
- (loginViewPage *)loginView {
    if (_loginView == nil) {
        _loginView = [[loginViewPage alloc]init];
        _loginView.delegate = self;
    }
    return _loginView;
}



#pragma mark --------loginViewPage---------------
- (void)loginAction:(loginViewPage *)action username:(NSString *)username password:(NSString *)password{
    DLog(@"check server");
    KPostNotification(KNotificationLoginStateChange, @YES);

}

// Login by Code
- (void)didClickCodeLogin:(loginViewPage *)action {
    DLog(@"Code Login");
}

-(void)didClickForgetPwd:(loginViewPage *)action{
    LoginViewController *vc = [[LoginViewController alloc] init];
   [self.navigationController pushViewController:vc animated:YES];
}

// Login by wechat
-(void)didWechatViewClick:(loginViewPage *)action {
    [userManager login:kUserLoginTypeWeChat completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}

// Login by QQ
-(void)didQqViewClick:(loginViewPage *)action{
    [userManager login:kUserLoginTypeQQ completion:^(BOOL success, NSString *des) {
        if (success) {
            DLog(@"登录成功");
        }else{
            DLog(@"登录失败：%@", des);
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
