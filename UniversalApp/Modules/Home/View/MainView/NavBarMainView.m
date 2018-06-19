//
//  NavBarMainView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "NavBarMainView.h"
#import "Utliltes.h"
@interface NavBarMainView()
@property (weak, nonatomic) UIView *mainView;//主要view
@property (weak, nonatomic) ETButton *localBtn;
@property (weak, nonatomic) ETButton *tweetBtn;
@property (weak, nonatomic) UILabel *localLabel;
@property (weak, nonatomic) UILabel *tweetLabel,*titleLabel,*localName;
@property (weak, nonatomic) UIImageView *searchIcon;

@end

@implementation NavBarMainView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}


-(void)setUpViews{
    
    ETButton *localBtn = [[ETButton alloc]init];
    [localBtn setImage:[UIImage imageNamed:@"local"] forState:UIControlStateNormal];
    //[localBtn addTarget:self action:@selector(goToLocal:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:localBtn];
    self.localBtn = localBtn;
    
    
    ETButton *tweetLabel = [[ETButton alloc]init];
    [tweetLabel setImage:[UIImage imageNamed:@"speak"] forState:UIControlStateNormal];
   // [tweetLabel addTarget:self action:@selector(goToTweet:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tweetLabel];
    self.tweetBtn = tweetLabel;
    
    
    UIView *mainView = [[UIView alloc]init];
    mainView.backgroundColor = [UIColor colorWithHexString:@"E6E6E6"];
    mainView.layer.cornerRadius =5;
    [self addSubview:mainView];
    self.mainView = mainView;
    
    
    UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search-icon"]];
    [searchIcon setContentMode:UIViewContentModeScaleToFill];
    searchIcon.translatesAutoresizingMaskIntoConstraints = YES;
    [self.mainView addSubview:searchIcon];
    self.searchIcon = searchIcon;
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"大家都在搜：橱柜";
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    
    UILabel *localName = [[UILabel alloc]init];
    localName.text = @"杭州";
    localName.font = [UIFont systemFontOfSize:14];
    localName.textColor = [UIColor colorWithHexString:@"#6B6B6B"];
    localName.textAlignment = NSTextAlignmentLeft;
    [self addSubview:localName];
    self.localName = localName;
    
}


- (void)layOutViews
{
    WEAKSELF;
    [self.localBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf).offset(-11);
        make.left.mas_equalTo(weakSelf).offset(15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    
    
    // Local name
    [self.localName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf).offset(-11);
        make.left.mas_equalTo(weakSelf.localBtn.mas_right).offset(4);
        make.size.mas_equalTo(CGSizeMake(30, 20));
    }];
    
    
    [self.tweetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf).offset(-11);
        make.right.mas_equalTo(weakSelf).offset(-15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    // search-icon
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf).offset(-11);
        make.left.mas_equalTo(weakSelf).offset(76);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-130, 28));
    }];
    
    
    [self.searchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(4);
        make.left.mas_equalTo(weakSelf.mainView).offset(13);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(4);
        make.left.mas_equalTo(weakSelf.mainView).offset(42);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-(152+43), 20));
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
