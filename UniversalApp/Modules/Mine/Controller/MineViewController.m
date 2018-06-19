//
//  MineViewController.m
//  MiAiApp
//
//  Created by 徐阳 on 2017/5/18.
//  Copyright © 2017年 徐阳. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "MineHeaderView.h"
#import "ProfileViewController.h"
#import "SettingViewController.h"
#import "XYTransitionProtocol.h"


#import "MineTableViewMe.h"
#import "Utliltes.h"

#define KHeaderHeight ((260 * Iphone6ScaleWidth) + kStatusBarHeight)

@interface MineViewController ()<MineTableViewMeDelegare>
@property (nonatomic, strong) MineTableViewMe *infoView;

@end

@implementation MineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.isHidenNaviBar = YES;
    [self.view addSubview:self.infoView];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    self.infoView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setters and getters
- (MineTableViewMe *)infoView {
    if (_infoView == nil) {
        _infoView = [[MineTableViewMe alloc]init];
        _infoView.delegate = self;
    }
    return _infoView;
}



@end

