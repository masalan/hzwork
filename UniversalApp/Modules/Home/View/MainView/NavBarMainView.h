//
//  NavBarMainView.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NavBarMainViewDelegate <NSObject>;
@end

@interface NavBarMainView : UIView
@property (weak,nonatomic)id<NavBarMainViewDelegate>delegate;
@end
