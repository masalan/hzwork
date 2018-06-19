//
//  ForgetPwdViewController.m
//  UniversalApp
//
//  Created by 诺虹科技 on 2018/6/13.
//  Copyright © 2018年 徐阳. All rights reserved.
//

#import "ForgetPwdViewController.h"
#import "ForgetPwdViewPage.h"
#import "Utliltes.h"
@interface ForgetPwdViewController ()<ForgetPwdViewPageDelegate>
@property (strong, nonatomic) ForgetPwdViewPage *forgotView;

@end

@implementation ForgetPwdViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    self.isShowLiftBack = YES;
    [self.view addSubview:self.forgotView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.forgotView.frame = CGRectMake(0,0, ScreenWidth, ScreenHeight);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    self.navigationController.delegate = self.navigationController;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [self ysl_removeTransitionDelegate];
}

#pragma mark - getter and setter
- (ForgetPwdViewPage *)forgotView {
    if (_forgotView == nil) {
        _forgotView = [[ForgetPwdViewPage alloc]init];
        _forgotView.delegate = self;
    }
    return _forgotView;
}



@end

