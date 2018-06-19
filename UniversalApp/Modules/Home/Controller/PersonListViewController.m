//
//  PersonListViewController.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonListMainView.h"
#import "Utliltes.h"
@interface PersonListViewController ()<PersonListMainDelegate>
@property (nonatomic, strong) PersonListMainView *infoView;

@end

@implementation PersonListViewController
{
    UIView *_NavView;//导航栏
}
- (void)viewDidLoad {
   self.isHidenNaviBar = YES;
    [super viewDidLoad];
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

-(void)moreViewMainAction:(PersonListMainView *)action{
    NSLog(@"moreView----------------- clic");
}

#pragma mark - setters and getters
- (PersonListMainView *)infoView {
    if (_infoView == nil) {
        _infoView = [[PersonListMainView alloc]init];
        _infoView.delegate = self;
    }
    return _infoView;
}

@end
