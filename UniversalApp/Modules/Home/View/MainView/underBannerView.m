//
//  underBannerView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "underBannerView.h"
#import "Utliltes.h"
@interface underBannerView()
@property (weak, nonatomic) UILabel *titleLabel,*commentCount,*dateLabel,*lineTwo;
@property (weak, nonatomic) UIButton *moreBtn;

@end

@implementation underBannerView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor colorWithHexString:@"E6E6E6"];
        
    }
    return self;
}


-(void)setUpViews{
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"每日话题";
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UIButton *moreBtn = [[UIButton alloc]init];
    [moreBtn setTitle:@">" forState:UIControlStateNormal];
    moreBtn.layer.cornerRadius = 4;
    moreBtn.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
    moreBtn.titleLabel.font = [UIFont fontWithName:SimSunFont size:12];
    [moreBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    self.moreBtn = moreBtn;
    
}

- (void)layOutViews {
    WEAKSELF;
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(6);
        make.left.mas_equalTo(weakSelf).offset(14);
        make.size.mas_equalTo(CGSizeMake(80, 18));
    }];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(6);
        make.right.mas_equalTo(weakSelf).offset(-15);
        make.size.mas_equalTo(CGSizeMake(20, 18));
    }];
    
}

-(void)moreClick{
    if ([self.delegate respondsToSelector:@selector(didClickMoreView:)]) {
        [self.delegate didClickMoreView:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
