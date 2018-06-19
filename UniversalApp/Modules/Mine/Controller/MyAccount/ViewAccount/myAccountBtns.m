//
//  myAccountBtns.m
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "myAccountBtns.h"
#import "Utliltes.h"
@interface myAccountBtns()
@property (weak, nonatomic) UIView *mainView;//主要view
@property(nonatomic, strong) UIImageView *addUserIcon,*nextIcons;
@property(nonatomic, strong) UILabel *addUserTitle,*jifenLabel;
@end

@implementation myAccountBtns

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
         [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setUpViews{
    UIView *mainView = [[UIView alloc]init];
    mainView.backgroundColor = [UIColor colorWithHexString:@"E5E5E5"];
    mainView.layer.cornerRadius = 8;
    mainView.clipsToBounds = YES;
    mainView.layer.masksToBounds = YES;
    [self addSubview:mainView];
    self.mainView = mainView;
    
    // addUser_Icon
    UIImageView *addUserIcon = [[UIImageView alloc]init];
    addUserIcon.image = [UIImage imageNamed:@"addUser_Icon"];
    addUserIcon.userInteractionEnabled = YES;
    [self.mainView addSubview:addUserIcon];
    self.addUserIcon = addUserIcon;
    
    // User name
    UILabel *addUserTitle = [[UILabel alloc]init];
    addUserTitle.text = @"邀请好友加入";
    addUserTitle.font = [UIFont fontWithName:PingFangSCMedium size:14];
    addUserTitle.textColor = [UIColor colorWithHexString:@"#333333"];
    addUserTitle.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:addUserTitle];
    self.addUserTitle = addUserTitle;
    
    UILabel *jifenLabel = [[UILabel alloc]init];
    jifenLabel.text = @"有机会得600积分";
    jifenLabel.font = [UIFont fontWithName:PingFangSCMedium size:14];
    jifenLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    jifenLabel.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:jifenLabel];
    self.jifenLabel = jifenLabel;
    
    
    // next_icon
    UIImageView *nextIcons = [[UIImageView alloc]init];
    nextIcons.image = [UIImage imageNamed:@"next_icon"];
    nextIcons.userInteractionEnabled = YES;
    [self.mainView addSubview:nextIcons];
    self.nextIcons = nextIcons;
}

- (void)layOutViews {
    WEAKSELF;
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(15);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-28,30));
    }];
    
    [self.addUserIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(8);
        make.left.mas_equalTo(weakSelf.mainView).offset(14);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.addUserTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(8);
        make.left.mas_equalTo(weakSelf.addUserIcon.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(85, 15));
    }];
    
    [self.jifenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(8);
        make.right.mas_equalTo(weakSelf.mainView).offset(-32);
        make.size.mas_equalTo(CGSizeMake(110, 15));
    }];
    
    [self.nextIcons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(8);
        make.right.mas_equalTo(weakSelf.mainView).offset(-15);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
}

@end
