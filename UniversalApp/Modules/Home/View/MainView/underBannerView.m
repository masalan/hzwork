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
    
}

- (void)layOutViews {
    WEAKSELF;
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(6);
        make.left.mas_equalTo(weakSelf).offset(14);
        make.size.mas_equalTo(CGSizeMake(80, 18));
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
