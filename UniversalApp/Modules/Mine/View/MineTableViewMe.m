//
//  MineTableViewMe.m
//  UniversalApp
//
//  Created by 诺虹科技 on 15/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "MineTableViewMe.h"

@interface MineTableViewMe()
@property (nonatomic, weak) UIView *headerView;
@property (nonatomic, weak) UILabel *balanceLabel;//余额
@property (nonatomic, weak) UILabel *d_balanceLabel;//具体
@property (nonatomic, weak) UIButton *rechargeBtn;//充值
//@property (nonatomic, weak) mineTableViewData *userTable;//tableview
@end

@implementation MineTableViewMe

- (instancetype)init {
    if (self = [super init]) {
       // [self setUpViews];
       // [self layOutViews];
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
