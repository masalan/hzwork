//
//  myAccountMainView.h
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myAccountMainView;
@protocol myAccountMainDelegate <NSObject>;
@optional
//登录事件
- (void)loginAction:(myAccountMainView *)action;

@end

@interface myAccountMainView : UIView
@property (weak, nonatomic) id<myAccountMainDelegate>delegate;
@end
