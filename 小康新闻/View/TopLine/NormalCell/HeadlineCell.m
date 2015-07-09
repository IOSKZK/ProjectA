//
//  HeadlineCell.m
//  SCNavTabbarDemo
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 SCNavTabbarDemo. All rights reserved.
//

#import "HeadlineCell.h"

@implementation HeadlineCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initCell];
    }
    return self;
}

-(void)initCell
{
    //新闻图片
    self.PCView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 10, 75, 60)];
    [self.contentView addSubview:self.PCView];
    //新闻标题
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(85, 10, [UIScreen mainScreen].bounds.size.width-100,25)];
    [self.titleLabel setFont:[UIFont fontWithName:@"ArialMT" size:20]];
    [self.contentView addSubview:self.titleLabel];
    //新闻描述
    self.descriptionLabel=[[UILabel alloc]initWithFrame:CGRectZero];
    self.descriptionLabel.numberOfLines=0;
    [self.descriptionLabel setFont:[UIFont systemFontOfSize:13]];
    [self.contentView addSubview:self.descriptionLabel];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
