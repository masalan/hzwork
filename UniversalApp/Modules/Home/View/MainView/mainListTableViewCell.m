//
//  mainListTableViewCell.m
//  UniversalApp
//
//  Created by 诺虹科技 on 14/06/2018.
//  Copyright © 2018 Alain Serge. All rights reserved.
//

#import "mainListTableViewCell.h"
#import "Utliltes.h"
@interface mainListTableViewCell()
@property (weak, nonatomic) UIView *mainView;//主要view
@property (weak, nonatomic) UILabel *titleLabel,*commentCount,*dateLabel,*lineTwo;
@property (weak, nonatomic) UIImageView *productImg;

@end

@implementation mainListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpViews];
        [self layOutViews];
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void)setUpViews{
    
    UIView *mainView = [[UIView alloc]init];
    mainView.backgroundColor = [UIColor whiteColor];
    [self addSubview:mainView];
    self.mainView = mainView;
    
    // img
    UIImageView *productImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bgs"]];
    [productImg setContentMode:UIViewContentModeScaleToFill];
    productImg.translatesAutoresizingMaskIntoConstraints = YES;
    productImg.layer.cornerRadius = 5;
    productImg.clipsToBounds = YES;
    productImg.layer.masksToBounds = YES;
    [self.mainView addSubview:productImg];
    self.productImg = productImg;
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"十一特辑 | 人气色彩 TOP 30 我们从过往22期以色彩为";
    titleLabel.numberOfLines =3;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *dateLabel = [[UILabel alloc]init];
    dateLabel.text = @"04.19 12：00";
    dateLabel.font = [UIFont systemFontOfSize:12];
    dateLabel.textColor = [UIColor colorWithHexString:@"#C6C6C6"];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:dateLabel];
    self.dateLabel = dateLabel;
    
    UILabel *commentCount = [[UILabel alloc]init];
    commentCount.text = @"评论 343";
    commentCount.font = [UIFont systemFontOfSize:12];
    commentCount.textColor = [UIColor colorWithHexString:@"#C6C6C6"];
    commentCount.textAlignment = NSTextAlignmentLeft;
    [self.mainView addSubview:commentCount];
    self.commentCount = commentCount;
    
    UILabel *lineTwo = [[UILabel alloc]init];
    lineTwo.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [self addSubview:lineTwo];
    self.lineTwo = lineTwo;
}


- (void)layOutViews {
    WEAKSELF;
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf).offset(1);
        make.left.mas_equalTo(weakSelf);
        make.right.mas_equalTo(weakSelf);
        make.bottom.mas_equalTo(weakSelf);
    }];
    
    [self.productImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(15);
        make.left.mas_equalTo(weakSelf.mainView).offset(15);
        make.size.mas_equalTo(CGSizeMake(118, 77));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(23);
        make.left.mas_equalTo(weakSelf.productImg.mas_right).offset(18);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth-167, 37));
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(77);
        make.left.mas_equalTo(weakSelf.productImg.mas_right).offset(18);
        make.size.mas_equalTo(CGSizeMake(80, 10));
    }];
    
    [self.commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(76);
        make.right.mas_equalTo(weakSelf).offset(-12);
        make.size.mas_equalTo(CGSizeMake(80, 10));
    }];
    
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mainView).offset(106);
        make.left.mas_equalTo(weakSelf).offset(0);
        make.size.mas_equalTo(CGSizeMake(ScreenWidth,1));
    }];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
