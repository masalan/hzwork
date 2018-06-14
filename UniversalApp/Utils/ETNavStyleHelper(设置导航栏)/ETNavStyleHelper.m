//
//  ETNavStyleHelper.m
//  e起行
//
//  Created by CHW on 2018/3/6.
//  Copyright © 2018年 CHW. All rights reserved.
//

#import "ETNavStyleHelper.h"
//#import <YYCategories.h>
#define ZDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

@implementation ETNavStyleHelper
+ (void)setTitleOfVC:(UIViewController *)vc titleColorWithcolor:(NSString *)colorName titleStyle:(NSString *)fontName titleSize:(CGFloat)size buttonImageName:(NSString *)name button:(UIButton *)button{
   //Nav的title
    [vc.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:colorName],NSFontAttributeName:[UIFont fontWithName:fontName size:size]}];
    //左侧返回键
    button.frame = CGRectMake(0, 10, 27, 100);
    button.contentVerticalAlignment = UIControlContentHorizontalAlignmentCenter;
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}



@end
