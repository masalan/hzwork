//
//  loginViewPage.h
//  UniversalApp
//
//  Created by 诺虹科技 on 13/06/2018.
//  Copyright © 2018 徐阳. All rights reserved.
//

#import <UIKit/UIKit.h>
@class loginViewPage;
@protocol loginViewPageDelegate <NSObject>

- (void)didWechatViewClick:(loginViewPage *)action;
- (void)didQqViewClick:(loginViewPage *)action;
- (void)didClickCodeLogin:(loginViewPage *)action;
- (void)didClickForgetPwd:(loginViewPage *)action;

@required
- (void)loginAction:(loginViewPage *)action username:(NSString *)username password:(NSString *)password;
- (void)backToLastVC:(loginViewPage *)action;
@end

@interface loginViewPage : UIView
@property(nonatomic, strong) YYAnimatedImageView *wechatIcon;  // wechat icon
@property(nonatomic, strong) YYAnimatedImageView *qqIcon;      // qq icon
@property(nonatomic, assign) id<loginViewPageDelegate>delegate;
@end
