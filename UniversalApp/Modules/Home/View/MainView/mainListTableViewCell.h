//
//  mainListTableViewCell.h
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol mainListDelegate <NSObject>
@end
@interface mainListTableViewCell : UITableViewCell
@property (weak,nonatomic)id<mainListDelegate>delegate;
@end
