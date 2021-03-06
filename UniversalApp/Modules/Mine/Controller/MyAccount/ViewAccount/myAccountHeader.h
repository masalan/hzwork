//
//  myAccountHeader.h
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myAccountHeader;
@protocol myAccountHeaderDelegate <NSObject>;
@required
-(void)didClickLoginBtn:(myAccountHeader *)vc;
@end

@interface myAccountHeader : UIView
@property (weak, nonatomic) id<myAccountHeaderDelegate>delegate;
@end
