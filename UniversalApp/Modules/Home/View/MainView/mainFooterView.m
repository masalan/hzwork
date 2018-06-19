//
//  mainFooterView.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//
#import "mainListTableViewCell.h"
#import "ProfileViewController.h"
#import "mainFooterView.h"
#import "Utliltes.h"
@interface mainFooterView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic ,strong) NSMutableArray *dataArray;

@end

@implementation mainFooterView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        //删除分割线和滚动条
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        //footerView设置
        
        self.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
        self.tableFooterView.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-150)/2, 48, 150, 17)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.text = @"—别拉了，我是有底线的—";
        titleLabel.textColor = [UIColor colorWithHexString:@"#bebebe"];
        [self.tableFooterView addSubview:titleLabel];
        
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIndetitier = @"orderCell";
    mainListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetitier];
    if (cell == nil) {
        cell = [[mainListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetitier];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 107;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    ProfileViewController *vc = [[ProfileViewController alloc] init];
//   [[ETGetVC GetControllerWithView:self].navigationController pushViewController:vc animated:YES];
//
    
}
- (void)setPoModel:(mainListTableViewCell *)poModel {
    [self reloadData];
}

#pragma mark ----lazy loading----
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

@end
