//
//  myAccountHeader.m
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "myAccountHeader.h"
#import "Utliltes.h"

@interface myAccountHeader()
@property(nonatomic, strong) UIImageView *bgImgView; //背景图
@property(nonatomic, strong) UILabel *nickNameView; //昵称容器 包含昵称 性别 等级
@property(nonatomic, strong) UILabel *showIDLabel; //展示的ID
@property(nonatomic, strong) UILabel *signatureLabel; //展示的ID
@property(nonatomic, strong) YYAnimatedImageView *headImgView; //头像
@property(nonatomic, strong) UIImageView *pinIcon,*msgIcon,*nameIcon,*calIcon,*switchIcon;
@property(nonatomic, strong) UILabel *pinTitle,*userName,*userStatus,*dateTitle;
@end

@implementation myAccountHeader
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       [self setUpViews];
       [self layOutView];
        self.backgroundColor = [UIColor blueColor];
        
        
        
    }
    return self;
}

- (void)setUpViews {
    UIImageView *bgImgView = [[UIImageView alloc]init];
    bgImgView.image = [UIImage imageNamed:@"my_back_img"];
    bgImgView.userInteractionEnabled = YES;
    [self addSubview:bgImgView];
    self.bgImgView = bgImgView;
  
    //pinIcon
    UIImageView *pinIcon = [[UIImageView alloc]init];
    pinIcon.image = [UIImage imageNamed:@"pin_Icon"];
    pinIcon.userInteractionEnabled = YES;
    [self.bgImgView addSubview:pinIcon];
    self.pinIcon = pinIcon;
    
    //msg_Icon
    UIImageView *msgIcon = [[UIImageView alloc]init];
    msgIcon.image = [UIImage imageNamed:@"msg_Icon"];
    msgIcon.userInteractionEnabled = YES;
    [self.bgImgView addSubview:msgIcon];
    self.msgIcon = msgIcon;
 
    // Location
    UILabel *pinTitle = [[UILabel alloc]init];
    pinTitle.text = @"杭州";
    pinTitle.font = [UIFont systemFontOfSize:14];
    pinTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    pinTitle.textAlignment = NSTextAlignmentLeft;
    [self.bgImgView addSubview:pinTitle];
    self.pinTitle = pinTitle;
    
    
    //name Icon
    UIImageView *nameIcon = [[UIImageView alloc]init];
    nameIcon.image = [UIImage imageNamed:@"couch_Icon"];
    nameIcon.userInteractionEnabled = YES;
    [self.bgImgView addSubview:nameIcon];
    self.nameIcon = nameIcon;
    
    // User name
    UILabel *userName = [[UILabel alloc]init];
    userName.text = @"我的小窝-";
    userName.font = [UIFont fontWithName:PingFangSCMedium size:12];
    userName.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    userName.textAlignment = NSTextAlignmentLeft;
    [self.bgImgView addSubview:userName];
    self.userName = userName;
    
    // User Status
    UILabel *userStatus = [[UILabel alloc]init];
    userStatus.text = @"xiaowo";
    userStatus.font = [UIFont fontWithName:PingFangSCMedium size:12];
    userStatus.textColor = [UIColor colorWithHexString:@"#FFB600"];
    userStatus.textAlignment = NSTextAlignmentLeft;
    [self.bgImgView addSubview:userStatus];
    self.userStatus = userStatus;
    
    
    //switchIcon
    UIImageView *switchIcon = [[UIImageView alloc]init];
    switchIcon.image = [UIImage imageNamed:@"direct_Icon"];
    switchIcon.userInteractionEnabled = YES;
    [self.bgImgView addSubview:switchIcon];
    self.switchIcon = switchIcon;
    
    _headImgView = [YYAnimatedImageView new];
    _headImgView.contentMode = UIViewContentModeScaleAspectFill;
    _headImgView.userInteractionEnabled = YES;
    _headImgView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    _headImgView.layer.borderWidth =2.0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToLoginVC)];
    [_headImgView addGestureRecognizer:tap];
    ViewRadius(_headImgView,55/2);
    [self.bgImgView addSubview:_headImgView];
    self.headImgView = _headImgView;
    // url picture
    [self.headImgView setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1503377311744&di=a784e64d1cce362c663f3480b8465961&imgtype=0&src=http%3A%2F%2Fww2.sinaimg.cn%2Flarge%2F85cccab3gw1etdit7s3nzg2074074twy.jpg"] placeholder:[UIImage imageWithColor:KGrayColor]];

    
    // Username
    UILabel *nickNameView = [[UILabel alloc]init];
    nickNameView.text = @"王晓敏";
    nickNameView.font = [UIFont fontWithName:PingFangSCMedium size:16];
    nickNameView.textColor = [UIColor colorWithHexString:@"#FFFEFE"];
    nickNameView.textAlignment = NSTextAlignmentCenter;
    [self.bgImgView addSubview:nickNameView];
    self.nickNameView = nickNameView;
    
    //Calendar Icon
    UIImageView *calIcon = [[UIImageView alloc]init];
    calIcon.image = [UIImage imageNamed:@"calendar_Icon"];
    calIcon.userInteractionEnabled = YES;
    [self.bgImgView addSubview:calIcon];
    self.calIcon = calIcon;
    
    // date Title
    UILabel *dateTitle = [[UILabel alloc]init];
    dateTitle.text = @"3岁2个月15天";
    dateTitle.font = [UIFont fontWithName:PingFangSCMedium size:12];
    dateTitle.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
    dateTitle.textAlignment = NSTextAlignmentLeft;
    [self.bgImgView addSubview:dateTitle];
    self.dateTitle = dateTitle;
    
    
    
    
    
}


- (void)layOutView {
    WEAKSELF;
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(0);
        make.centerX.mas_equalTo(weakSelf.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth,212));
    }];
    
    [self.pinIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bgImgView).offset(35);
        make.left.mas_equalTo(weakSelf.bgImgView).offset(14);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    
    [self.pinTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bgImgView).offset(35);
        make.left.mas_equalTo(weakSelf.bgImgView).offset(14+17+9);
        make.size.mas_equalTo(CGSizeMake(80, 17));
    }];
    
    [self.msgIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bgImgView).offset(35);
        make.right.mas_equalTo(weakSelf.bgImgView).offset(-14);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    
    // Avatar
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.bgImgView).offset(63);
        make.left.mas_equalTo(weakSelf.bgImgView).offset((ScreenWidth/2)-(55/2));
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    
    [self.nickNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.headImgView.mas_bottom).offset(17);
        make.centerX.mas_equalTo(weakSelf.centerX);
        make.size.mas_equalTo(CGSizeMake(146,16));
    }];
 
    [self.nameIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nickNameView.mas_bottom).offset(14);
        make.left.mas_equalTo(weakSelf.bgImgView).offset(122);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];

    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nickNameView.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.nameIcon.mas_right).offset(11);
        make.size.mas_equalTo(CGSizeMake(60, 12));
    }];
    
    [self.userStatus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nickNameView.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.userName.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(45, 12));
    }];
    
    [self.switchIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nickNameView.mas_bottom).offset(15);
        make.left.mas_equalTo(weakSelf.userStatus.mas_right).offset(0);
        make.size.mas_equalTo(CGSizeMake(11, 10));
    }];
    
    [self.calIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.userStatus.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.bgImgView).offset(138);
        make.size.mas_equalTo(CGSizeMake(11, 11));
    }];
    

    [self.dateTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.userStatus.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.calIcon.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(150,17));
    }];
    
    
}


#pragma mark - respose method
- (void)goToLoginVC {
//    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"loginStatus"] isEqualToString:@"Yes"]) {
//        return;
//    }
    // Login
    if ([self.delegate respondsToSelector:@selector(didClickLoginBtn:)]) {
        [self.delegate didClickLoginBtn:self];
    }
}



@end
