//
//  ScrollCell.m
//  SCNavTabbarDemo
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 SCNavTabbarDemo. All rights reserved.
//

#import "ScrollCell.h"

@implementation ScrollCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initScrollCell];
    }
    return self;
}
-(void)initScrollCell
{
    self.scrollView=[[UIScrollView alloc]init];
    [self.contentView addSubview:self.scrollView];
    
    self.titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height*5/6, self.frame.size.width*3/4, self.frame.size.height/6)];
    [self.contentView addSubview:self.titleLabel];
    
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width*3/4, self.frame.size.height*5/6, self.frame.size.width/4, self.frame.size.width/6)];
    [self.contentView addSubview:self.pageControl];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
