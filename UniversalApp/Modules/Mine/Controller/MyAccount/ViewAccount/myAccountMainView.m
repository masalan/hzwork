//
//  myAccountMainView.m
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "myAccountMainView.h"
#import "myAccountHeader.h"
#import "myAccountBtns.h"
#import "myAccountMenu.h"

#import "Utliltes.h"

@interface myAccountMainView()<myAccountHeaderDelegate,myAccountBtnsDelegate,myAccountMenuDelegate>
@property (nonatomic, strong) myAccountHeader *headerView;
@property (nonatomic, strong) myAccountBtns *moreView;
@property (nonatomic, strong) myAccountMenu *footerView;
@end

@implementation myAccountMainView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}



- (void)setUpViews {
    myAccountHeader *headerView = [[myAccountHeader alloc]init];
    headerView.delegate = self;
    [self addSubview:headerView];
    self.headerView = headerView;
    
    myAccountBtns *moreView = [[myAccountBtns alloc]init];
    moreView.delegate = self;
    [self addSubview:moreView];
    self.moreView = moreView;
    
    myAccountMenu *footerView = [[myAccountMenu alloc]init];
    footerView.delegate = self;
    [self addSubview:footerView];
    self.footerView = footerView;
    
}

- (void)layOutViews {
    WEAKSELF;
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(0);
        make.left.mas_equalTo(weakSelf).offset(0);
        make.right.mas_equalTo(weakSelf).offset(0);
        make.height.mas_equalTo(212);
    }];
    
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.headerView.mas_bottom).offset(9);
        make.left.mas_equalTo(weakSelf).offset(0);
        make.right.mas_equalTo(weakSelf).offset(0);
        make.height.mas_equalTo(60);
    }];
    
    
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.moreView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight-(212+9+60)));
        
    }];
}


// Login
#pragma mark ----------ETPersonalHeaderViewDelegate----------
- (void)didClickLoginBtn:(myAccountMainView *)vc {
    if ([self.delegate respondsToSelector:@selector(loginAction:)]) {
        [self.delegate loginAction:self];
    }
}


@end
