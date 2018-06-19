//
//  myAccountMenu.h
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//


#import <UIKit/UIKit.h>
@class myAccountMenu;
@protocol myAccountMenuDelegate <NSObject>
- (void)deliveryView:(myAccountMenu *)view ofRowNumber:(NSIndexPath *)indexPath;
@end
@interface myAccountMenu : UITableView
@property (weak, nonatomic) id<myAccountMenuDelegate>p_delegate;
@end
