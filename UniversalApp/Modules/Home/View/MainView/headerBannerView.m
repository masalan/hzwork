//
//  headerBannerView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "headerBannerView.h"
#import "SDCycleScrollView.h"
#import "Utliltes.h"

@interface headerBannerView ()<SDCycleScrollViewDelegate>
@end

@implementation headerBannerView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        
        NSArray *imagesURLStrings = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"];
        
        SDCycleScrollView *wheelImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 187) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        wheelImage.autoScrollTimeInterval = 4;
        wheelImage.pageControlDotSize = CGSizeMake(10, 10);
        wheelImage.contentMode = UIViewContentModeScaleAspectFit;
        wheelImage.imageURLStringsGroup = imagesURLStrings;
        [self addSubview:wheelImage];
        
        
         [self setUpViews];
        [self layOutViews];
        //self.backgroundColor = [UIColor greenColor];

    }
    return self;
}

-(void)setUpViews{
    
    
}


-(void)layOutViews{
    
    
}


#pragma mark -  scrollview回调
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"点击了第%ld个",index);
}

-(void)dealloc{
    NSLog(@"释放VC");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
