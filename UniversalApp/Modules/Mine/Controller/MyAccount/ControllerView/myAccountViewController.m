//
//  myAccountViewController.m
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "myAccountViewController.h"
#import "LoginViewController.h"
#import "myAccountMainView.h"
#import "Utliltes.h"
@interface myAccountViewController ()<myAccountMainDelegate>
@property (nonatomic, strong) myAccountMainView *infoView;

@end

@implementation myAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[self.view addSubview:self.infoView];
    [super viewDidLoad];
    self.isHidenNaviBar = YES;
    self.StatusBarStyle = UIStatusBarStyleLightContent;
    self.isShowLiftBack = NO;//每个根视图需要设置该属性为NO，否则会出现导航栏异常
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.infoView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    self.navigationController.delegate = self.navigationController;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    //    [self ysl_removeTransitionDelegate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - setters and getters
- (myAccountMainView *)infoView {
    if (_infoView == nil) {
        _infoView = [[myAccountMainView alloc]init];
        _infoView.delegate = self;
    }
    return _infoView;
}


// Login page
-(void)loginAction:(myAccountMainView *)action{
    DLog(@"login------------------------");
      LoginViewController *vc = [LoginViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
