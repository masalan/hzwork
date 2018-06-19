//
//  ETButton.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "ETButton.h"
#import "Utliltes.h"
@implementation ETButton
- (id)init
{
    if (self = [super init]) {
       // self.layer.cornerRadius = 8;
        //self.clipsToBounds = YES;
        [self setBackgroundColor:[UIColor clearColor]];
        [self imageRectForContentRect:CGRectMake(9, 9, 21, 24)];
    }
    return self;
}
@end
