//
//  loginViewPage.m
//  UniversalApp
//
//  Created by 诺虹科技 on 13/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "ForgetPwdViewPage.h"
#import "Utliltes.h"
// text editing
@interface ForgetPwdViewPage()<UITextFieldDelegate>
@property(nonatomic, weak) LoginTextField *usernameTF;  // 用户名
@property (weak, nonatomic) UILabel *lineOne,*lineTwo;
@property (nonatomic, weak) LoginTextField *valideCode;
@property (nonatomic, weak) UIButton *codeBtn,*nextBtn;


@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic) BOOL isCount;

@end


@implementation ForgetPwdViewPage

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
        [self setUpViews];
        [self layOutViews];
       // [self codeBtnUnable];
       // [self sureBtnUnable];
    }
    return self;
}


- (void)setUpViews {
 
    //username
    LoginTextField *usernameTF = [[LoginTextField alloc]init];
    usernameTF.clearButtonMode = YES;
    usernameTF.placeholder = @"请输入手机号码";
    usernameTF.tag = 0;
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
    
    
    // Valid code
    LoginTextField *valideCode = [[LoginTextField alloc]init];
    valideCode.tag = 1;
    valideCode.delegate = self;
    valideCode.placeholder = @"请输入验证码";
    UIImageView *iconCode = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 16)];
    iconCode.image = [UIImage imageNamed:@"Page 1 Copy 3"];
    valideCode.leftView = iconCode;
    valideCode.leftViewMode = UITextFieldViewModeAlways;
    [valideCode setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    [self addSubview:valideCode];
    self.valideCode = valideCode;
    
    UIButton *codeBtn = [[UIButton alloc]init];
    codeBtn.layer.cornerRadius = 4;
    codeBtn.layer.borderColor = [UIColor colorWithHexString:@"FFB600"].CGColor;
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont fontWithName:lightFont size:11];
    [codeBtn setBackgroundColor:[UIColor colorWithHexString:@"#e8e9ea"]];
    [codeBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
   [codeBtn addTarget:self action:@selector(didClickSendCode:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:codeBtn];
    self.codeBtn = codeBtn;
    
    
    
    UILabel *lineTwo = [[UILabel alloc]init];
    lineTwo.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5 "];
    [self addSubview:lineTwo];
    self.lineTwo = lineTwo;
    
    UIButton *nextBtn = [[UIButton alloc]init];
    [nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    nextBtn.layer.cornerRadius = 5;
    nextBtn.titleLabel.font = [UIFont fontWithName:lightFont size:16];
    [nextBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB600"]];
    [nextBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(goTonextBtnClic) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextBtn];
    self.nextBtn = nextBtn;
    
    
    
}

- (void)layOutViews {
    WEAKSELF;
    
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(154);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-92,50));
    }];
    
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.usernameTF.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-90,1));
    }];
    
    [self.valideCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineOne.mas_bottom).offset(1);
        make.left.mas_equalTo(weakSelf).offset(46);
        make.right.mas_equalTo(weakSelf).offset(-171);
        make.height.mas_equalTo(@50);
       // make.size.mas_equalTo(CGSizeMake(ScreenWidth-92,50));
    }];
    
  
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineOne.mas_bottom).offset(14);
        make.right.mas_equalTo(weakSelf).offset(-51);
        make.size.mas_equalTo(CGSizeMake(66,21));
    }];
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.valideCode.mas_bottom).offset(0);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-90,1));
    }];
    

    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineTwo.mas_bottom).offset(55);
        make.left.mas_equalTo(weakSelf).offset(45);
        make.right.mas_equalTo(weakSelf).offset(-45);
        make.height.mas_equalTo(41);
    }];
    
    
   
    

    
}

//-(void)goTocodeLogin{
//    if ([ self.delegate respondsToSelector:@selector(didClickCodeLogin:)]) {
//        [self.delegate didClickCodeLogin:self];
//    }
//
//}
//
//
//-(void)goTofortgot{
//    if ([self.delegate respondsToSelector:@selector(didClickForgetPwd:)]) {
//        [self.delegate didClickForgetPwd:self];
//    }
//
//}

- (void)codeBtnUnable {
    [self.codeBtn setBackgroundColor:[UIColor colorWithHexString:@"#e8e9ea"]];
    [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#a4a4a5"] forState:UIControlStateNormal];
    [self.codeBtn setEnabled:NO];
}

- (void)sureBtnUnable {
    [self.nextBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB600"]];
    [self.nextBtn setTitleColor:[UIColor colorWithHexString:@"#a4a4a5"] forState:UIControlStateNormal];
    [self.nextBtn setEnabled:NO];
}


- (void)codeBtnAble {
    [self.codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.codeBtn setBackgroundColor:[UIColor colorWithHexString:@"#ff5400"]];
    [self.codeBtn setEnabled:YES];
}

- (void)sureBtnAble {
    [self.nextBtn setBackgroundColor:[UIColor colorWithHexString:@"#FFB600"]];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextBtn setEnabled:YES];
}



#pragma mark - method request
-(void)goTonextBtnClic{
    if (self.usernameTF.text.length == 0) {
        [MBProgressHUD showErrorMessage:@"请输入账号"];
        return;
    }
    if (![ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]) {
        [MBProgressHUD showErrorMessage:@"无效手机号"];
        return;
    }
}

#pragma mark - method response
- (void)didClickSendCode:(UIButton *)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES];
    // fq
    _isCount = YES;
    
    _seconds = 5;
    if ([self.delegate respondsToSelector:@selector(didClickSendCode:withMobile:)]) {
        [self.delegate didClickSendCode:self withMobile:self.usernameTF.text];
    }
}

- (void)timerMethod:(NSTimer *)theTimer
{
    if (_seconds == 1)
    {
        [theTimer invalidate];
        _seconds = 5;
        [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#a4a4a5"] forState:UIControlStateNormal];
        [self.codeBtn setBackgroundColor:[UIColor colorWithHexString:@"#e8e9ea"]];
        [self.codeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [self.codeBtn setEnabled:YES];
        // fq
        _isCount = NO;
        
    } else
    {
        _seconds--;
        [self.codeBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
        [self.codeBtn setTitleColor:[UIColor colorWithHexString:@"#e8e9ea"] forState:UIControlStateNormal];
        [self.codeBtn setTitle:[NSString stringWithFormat:@"%lds后重发",(long)_seconds] forState:UIControlStateNormal];
        [self.codeBtn setEnabled:NO];
    }
}


#pragma mark -UITextFieldDelegate
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    switch (textField.tag) {
        case 0:
            if (![ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]) {
                [MBProgressHUD showErrorMessage:@"无效手机号"];
                [self codeBtnUnable];
                [self sureBtnUnable];
            }
            break;
      
        case 1:
            if (self.valideCode.text.length != 4 && textField.text.length != 0) {
                [MBProgressHUD showErrorMessage:@"请输入4位验证码"];
                [self sureBtnUnable];
            }
            break;
    }
    // fq
    if ([ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]  && !_isCount) {
        [self codeBtnAble];
    }
    if ([ETRegularExpressionHelper checkTelNumber:self.usernameTF.text]  && self.valideCode.text.length == 4) {
        [self sureBtnAble];
    }
    // fq
    else {
        [self sureBtnUnable];
    }
    return YES;
}


@end
