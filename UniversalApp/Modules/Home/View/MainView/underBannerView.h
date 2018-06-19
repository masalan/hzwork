//
//  underBannerView.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utliltes.h"
@class  underBannerView;

@protocol underBannerViewDelegate <NSObject>;
- (void)didClickMoreView:(underBannerView *)action;

@end


@interface underBannerView : UIView
@property (weak, nonatomic) id<underBannerViewDelegate> delegate;
@end
