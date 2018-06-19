//
//  PersonListMainView.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonListMainView;

@protocol PersonListMainDelegate <NSObject>

// click More
- (void)moreViewMainAction:(PersonListMainView *)action;

@end


@interface PersonListMainView : UIView
@property (weak, nonatomic) id<PersonListMainDelegate>delegate;
@end
