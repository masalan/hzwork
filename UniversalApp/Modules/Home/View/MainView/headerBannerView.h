//
//  headerBannerView.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class headerBannerView;
@protocol headerBannerViewDelegate <NSObject>
@end

@interface headerBannerView : UIView
@property (weak, nonatomic) id<headerBannerViewDelegate>delegate;
@end
