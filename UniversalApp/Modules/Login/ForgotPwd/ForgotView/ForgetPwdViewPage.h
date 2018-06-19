//
//  ForgetPwdViewPage.h
//  UniversalApp
//
//  Created by 诺虹科技 on 2018/6/14.
//  Copyright © 2018年 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ForgetPwdViewPage;
@protocol ForgetPwdViewPageDelegate <NSObject>
- (void)didClickForgetPwd:(ForgetPwdViewPage *)action;

@required
- (void)didClickSendCode:(ForgetPwdViewPage *)action withMobile:(NSString *)mobile;
- (void)didClickSureBtn:(ForgetPwdViewPage *)action withMobile:(NSString *)mobile Password:(NSString *)password Code:(NSString *)code;

@end
@interface ForgetPwdViewPage : UIView
@property(nonatomic, assign) id<ForgetPwdViewPageDelegate>delegate;
@property (nonatomic, copy) NSString *messageCode;

@end
