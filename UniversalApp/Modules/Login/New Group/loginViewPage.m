//
//  loginViewPage.m
//  UniversalApp
//
//  Created by 诺虹科技 on 13/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "ETRegularExpressionHelper.h"
#import "loginViewPage.h"
#import "LoginTextField.h"
#import "ETColor.h"
#import "ETConfig.h"
#import "MBProgressHUD.h"

@interface loginViewPage()<UITextFieldDelegate>
@property(nonatomic, strong) UIImageView *wxIcons,*qqIcons; //背景图
@property (weak, nonatomic) UIImageView *logoImgView;     // Logo背景图
@property(nonatomic, weak) LoginTextField *usernameTF;  // 用户名
@property(nonatomic, weak) LoginTextField *passwordTF;  // 密码
@property (weak, nonatomic) UILabel *lineOne,*lineTwo,*lineTree,*lineFour;
@property (weak, nonatomic) UILabel *socialLogin;

@property (weak, nonatomic) UIButton *codeLoginBtn,*fortgotBtn,*loginBtn;


@end


@implementation loginViewPage

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        [self setUpViews];
        [self layOutViews];
    }
    return self;
}


- (void)setUpViews {
    // logo View
    UIImageView *logoImgae = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo-icon"]];
    [logoImgae setContentMode:UIViewContentModeScaleAspectFill];
    logoImgae.translatesAutoresizingMaskIntoConstraints = YES;
    [self addSubview:logoImgae];
    self.logoImgView = logoImgae;
    
    //username
    LoginTextField *usernameTF = [[LoginTextField alloc]init];
    usernameTF.clearButtonMode = YES;
    usernameTF.placeholder = @"请输入你的账号";
    usernameTF.tag = 1;
    usernameTF.delegate = self;
    UIImageView *nameLeftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 16)];
    nameLeftImage.image = [UIImage imageNamed:@"Page 1 Copy 4"];
    usernameTF.leftView = nameLeftImage;
    usernameTF.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:usernameTF];
    self.usernameTF = usernameTF;
    
    
    UILabel *lineOne = [[UILabel alloc]init];
    lineOne.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5 "];
    [self addSubview:lineOne];
    self.lineOne = lineOne;
    
    //password
    LoginTextField *passwordTF = [[LoginTextField alloc]init];
    passwordTF.placeholder = @"请输入你的密码";
    passwordTF.secureTextEntry = YES;
    passwordTF.tag = 2;
    passwordTF.delegate = self;
    UIImageView *wordLeftImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 16)];
    wordLeftImage.image = [UIImage imageNamed:@"Page 1 Copy 5"];
    passwordTF.leftView = wordLeftImage;
    passwordTF.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:passwordTF];
    self.passwordTF = passwordTF;
    
    UILabel *lineTwo = [[UILabel alloc]init];
    lineTwo.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5 "];
    [self addSubview:lineTwo];
    self.lineTwo = lineTwo;
    
    UIButton *codeLoginBtn = [[UIButton alloc]init];
    [codeLoginBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
    codeLoginBtn.titleLabel.font = [UIFont fontWithName:regularFont size:13];
    [codeLoginBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [codeLoginBtn addTarget:self action:@selector(goTocodeLogin) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:codeLoginBtn];
    self.codeLoginBtn = codeLoginBtn;
    
    
    UIButton *fortgotBtn = [[UIButton alloc]init];
    [fortgotBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    fortgotBtn.titleLabel.font = [UIFont fontWithName:regularFont size:13];
    [fortgotBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [fortgotBtn addTarget:self action:@selector(goTofortgot) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:fortgotBtn];
    self.fortgotBtn = fortgotBtn;
    
    UIButton *loginBtn = [[UIButton alloc]init];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.titleLabel.font = [UIFont fontWithName:lightFont size:14];
    [loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB600"]];
    [loginBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(goTologinBtnClic) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    
    UILabel *socialLogin = [[UILabel alloc]init];
    socialLogin.textColor = [UIColor colorWithHexString:@"999999"];
    socialLogin.text = @"使用以下方式登录";
    socialLogin.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    socialLogin.font = [UIFont fontWithName:lightFont size:14];
    socialLogin.textAlignment = NSTextAlignmentCenter;
    [self addSubview:socialLogin];
    self.socialLogin = socialLogin;
    
    UILabel *lineTree = [[UILabel alloc]init];
    lineTree.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5 "];
    [self addSubview:lineTree];
    self.lineTree = lineTree;
    
    UILabel *lineFour = [[UILabel alloc]init];
    lineFour.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5 "];
    [self addSubview:lineFour];
    self.lineFour = lineFour;
    
    UIImageView *wxIcons = [[UIImageView alloc]init];
    wxIcons.image = [UIImage imageNamed:@"wechat-icon"];
    wxIcons.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapWx = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goTowxLogin)];
    [wxIcons addGestureRecognizer:tapWx];
    [self addSubview:wxIcons];
    self.wxIcons = wxIcons;

    
    UIImageView *qqIcons = [[UIImageView alloc]init];
    qqIcons.image = [UIImage imageNamed:@"qq-icon"];
    qqIcons.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapQQ = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToqqLogin)];
    [qqIcons addGestureRecognizer:tapQQ];
    [self addSubview:qqIcons];
    self.qqIcons = qqIcons;
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"isRememberPassword"] isEqualToString:@"Yes"]) {
        usernameTF.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"mobilePhone"];
        // passwordTF.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    }
    
}

- (void)layOutViews {
    WEAKSELF;
    [self.logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(32);
        make.left.mas_equalTo(weakSelf).offset((ScreenWidth/2)-30);
        make.size.mas_equalTo(CGSizeMake(60, 54));
    }];
    
    
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.logoImgView.mas_bottom).offset(50);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-92,50));
    }];
    
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.usernameTF.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-90,1));
    }];
    
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineOne.mas_bottom).offset(1);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-92,50));
    }];
    
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.passwordTF.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-90,1));
    }];
    
    [self.codeLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineTwo.mas_bottom).offset(16);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.size.mas_equalTo(CGSizeMake(80,20));
    }];
    
    [self.fortgotBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineTwo.mas_bottom).offset(16);
        make.right.mas_equalTo(weakSelf).offset(-46);
        make.size.mas_equalTo(CGSizeMake(80,20));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineTwo.mas_bottom).offset(55);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.right.mas_equalTo(weakSelf).offset(-45);
        make.height.mas_equalTo(41);
    }];
    
    
    [self.lineTree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.loginBtn.mas_bottom).offset(135);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth-212)/2,1));
    }];
    
    [self.socialLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.loginBtn.mas_bottom).offset(123);
        make.left.mas_equalTo(weakSelf).offset((ScreenWidth/2)-60);
        make.size.mas_equalTo(CGSizeMake(120, 24));
    }];
    
    [self.lineFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.loginBtn.mas_bottom).offset(135);
        make.right.mas_equalTo(weakSelf).offset(-46);
        make.size.mas_equalTo(CGSizeMake((ScreenWidth-212)/2,1));
    }];
    
    
    [self.wxIcons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.socialLogin.mas_bottom).offset(22);
        make.left.mas_equalTo(weakSelf).offset(134);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
    
    [self.qqIcons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.socialLogin.mas_bottom).offset(22);
        make.right.mas_equalTo(weakSelf).offset(-134);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
}

-(void)goTocodeLogin{
    if ([ self.delegate respondsToSelector:@selector(didClickCodeLogin:)]) {
        [self.delegate didClickCodeLogin:self];
    }
    
}


-(void)goTofortgot{
    if ([self.delegate respondsToSelector:@selector(didClickForgetPwd:)]) {
        [self.delegate didClickForgetPwd:self];
    }
    
}



#pragma mark - method request
-(void)goTologinBtnClic{
    if (self.usernameTF.text.length == 0) {
       [MBProgressHUD showErrorMessage:@"请输入账号"];
        return;
    }
    if (self.passwordTF.text.length == 0) {
        [MBProgressHUD showErrorMessage:@"请输入密码"];
        return;
    }
    if (![ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]) {
        [MBProgressHUD showErrorMessage:@"无效手机号"];
        return;
    }
    // Go to the server
    if ([self.delegate respondsToSelector:@selector(loginAction:username:password:)]) {
        [self.delegate loginAction:self username:self.usernameTF.text password:self.passwordTF.text];
        NSLog(@"check server------------");
    }
}

// Weixin Login
-(void)goTowxLogin{
    if ([self.delegate respondsToSelector:@selector(didWechatViewClick:)]) {
        [self.delegate didWechatViewClick:self];
    }
    
}

// QQ Login
-(void)goToqqLogin{
    if ([self.delegate respondsToSelector:@selector(didQqViewClick:)]) {
        [self.delegate didQqViewClick:self];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    switch (textField.tag) {
        case 1:
            if (![ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]) {
                [MBProgressHUD showErrorMessage:@"无效手机号"];
            }
            break;
    }
    return YES;
}

@end
