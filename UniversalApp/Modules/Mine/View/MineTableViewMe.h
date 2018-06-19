//
//  MineTableViewMe.h
//  UniversalApp
//
//  Created by 诺虹科技 on 15/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineTableViewMe;

@protocol MineTableViewMeDelegare <NSObject>
@end

@interface MineTableViewMe : UIView
@property (weak,nonatomic) id <MineTableViewMeDelegare>delegate;
@end
