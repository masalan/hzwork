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

@required
- (void)loginAction:(ForgetPwdViewPage *)action username:(NSString *)username password:(NSString *)password;
- (void)backToLastVC:(ForgetPwdViewPage *)action;
@end


@interface ForgetPwdViewPage : UIView

@property(nonatomic, assign) id<ForgetPwdViewPageDelegate>delegate;
@end
