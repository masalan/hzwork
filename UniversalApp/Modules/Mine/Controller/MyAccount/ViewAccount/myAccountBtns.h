//
//  myAccountBtns.h
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol myAccountBtnsDelegate <NSObject>;
@end
@interface myAccountBtns : UIView
@property (weak, nonatomic) id<myAccountBtnsDelegate>delegate;
@end
