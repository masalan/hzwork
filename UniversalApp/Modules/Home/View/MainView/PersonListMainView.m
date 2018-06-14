//
//  PersonListMainView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "PersonListMainView.h"
#import "headerBannerView.h"
#import "underBannerView.h"
#import "mainFooterView.h"
#import "Utliltes.h"


@interface PersonListMainView()<headerBannerViewDelegate,underBannerViewDelegate,mainFooterViewDelegate>
@property (nonatomic, strong) headerBannerView *bannerView;
@property (nonatomic, strong) underBannerView *moreView;
@property (nonatomic, strong) mainFooterView *footerView;

@end

@implementation PersonListMainView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}

- (void)setUpViews {
    headerBannerView *bannerView = [[headerBannerView alloc]init];
    bannerView.delegate = self;
    [self addSubview:bannerView];
    self.bannerView = bannerView;
    
    underBannerView *moreView = [[underBannerView alloc]init];
    moreView.delegate = self;
    [self addSubview:moreView];
    self.moreView = moreView;
    
    mainFooterView *footerView = [[mainFooterView alloc]init];
    footerView.p_delegate = self;
    [self addSubview:footerView];
    self.footerView = footerView;
    
}


- (void)layOutViews {
    WEAKSELF;
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(0);
        make.left.mas_equalTo(weakSelf).offset(0);
        make.right.mas_equalTo(weakSelf).offset(0);
        make.height.mas_equalTo(187);
    }];
    
    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bannerView.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf).offset(0);
        make.right.mas_equalTo(weakSelf).offset(0);
        make.height.mas_equalTo(30);
    }];
    
    
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.moreView.mas_bottom).offset(0);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight-(187+30)));
        
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
