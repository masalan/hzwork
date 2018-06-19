//
//  myAccountMenu.m
//  UniversalApp
//
//  Created by alain serge on 16/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "myAccountMenu.h"
#import "Utliltes.h"
@interface myAccountMenu()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) NSArray *imagesArr;

@property (nonatomic, strong) NSArray *iconArr,*titleArr;

@end

@implementation myAccountMenu

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
        self.dataSource = self;
        
       // self.titlesArr = @[@"我的订单",@"我的收藏",@"我的装修",@"我的关注",@"账号设置",@"关于我们",@"意见反馈",@"联系客服",@"分享应用"];
       // self.imagesArr = @[@"orders_Icon",@"favoris_Icon",@"paint_Icon",@"follow_Icon",@"setting_Icon",@"about_Icon",@"comment_Icon",@"support_Icon",@"share_Icon"];
        
        
        self.titlesArr = @[@"1我的订单",@"我的收藏",@"我的装修",@"我的关注"];
        self.imagesArr = @[@"orders_Icon",@"favoris_Icon",@"paint_Icon",@"follow_Icon"];
        
        self.titleArr = @[@"账号设置",@"关于我们",@"意见反馈",@"联系客服",@"分享应用"];
        self.iconArr = @[@"setting_Icon",@"about_Icon",@"comment_Icon",@"support_Icon",@"share_Icon"];
        
        
        self.scrollEnabled = YES;
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        self.tableFooterView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return self;
}
    
    

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 4;
            break;
        case 1:
            return 5;
            break;
        default:
            return 0;
            break;
    }
  //  return self.titlesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        //cell.textLabel.text = self.titlesArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont fontWithName:PingFangSCMedium size:15];
        // cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imagesArr[indexPath.row]]];
        
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(15,10, 20, 20)];
        imgView.backgroundColor=[UIColor clearColor];
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imagesArr[indexPath.row]]]];
        [cell.contentView addSubview:imgView];
        
        UILabel *textlab = [[UILabel alloc] initWithFrame:CGRectMake(15+20+5,10, 150, 20)];
        textlab.text = self.titlesArr[indexPath.row];
        [cell.contentView addSubview:textlab];
        return cell;
    }else{
        static NSString *cellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        //cell.textLabel.text = self.titlesArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont fontWithName:PingFangSCMedium size:15];
        // cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.imagesArr[indexPath.row]]];
        
        UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(15,10, 20, 20)];
        imgView.backgroundColor=[UIColor clearColor];
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",self.iconArr[indexPath.row]]]];
        [cell.contentView addSubview:imgView];
        
        UILabel *textlab = [[UILabel alloc] initWithFrame:CGRectMake(15+20+5,10, 150, 20)];
        textlab.text = self.titleArr[indexPath.row];
        [cell.contentView addSubview:textlab];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([self.p_delegate respondsToSelector:@selector(deliveryView:ofRowNumber:)]) {
//        [self.p_delegate deliveryView:self ofRowNumber:indexPath];
//    }
}
@end
