//
//  ETNavStyleHelper.h
//  UniversalApp
//
//  Created by 诺虹科技 on 13/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ETNavStyleHelper : NSObject
+ (void)setTitleOfVC:(UIViewController *)vc
 titleColorWithcolor:(NSString *)colorName
          titleStyle:(NSString *)fontName
           titleSize:(CGFloat)size
     buttonImageName:(NSString *)name
              button:(UIButton *)button;
@end
