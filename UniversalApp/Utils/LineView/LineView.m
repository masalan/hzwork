//
//  LineView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 2018/6/13.
//  Copyright © 2018年 徐阳. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
    CGContextSetLineWidth(context, 1);
    CGContextMoveToPoint(context, 0, 0);
//    CGContextAddLineToPoint(context, 0, 5);
//    CGContextAddLineToPoint(context, rect.size.width, 5);
    CGContextAddLineToPoint(context, rect.size.width, 0);
    CGContextStrokePath(context);
}


@end
