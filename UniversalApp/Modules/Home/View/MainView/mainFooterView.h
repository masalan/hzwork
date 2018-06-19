//
//  mainFooterView.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class mainFooterView;
@protocol mainFooterViewDelegate <NSObject>;
- (void)didClickDetailsView:(mainFooterView *)action;

@end
@interface mainFooterView : UITableView
@property (weak, nonatomic) id<mainFooterViewDelegate>p_delegate;
@end
