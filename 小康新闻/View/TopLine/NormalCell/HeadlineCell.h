//
//  HeadlineCell.h
//  SCNavTabbarDemo
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 SCNavTabbarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface HeadlineCell : UITableViewCell
@property (strong ,nonatomic) UIImageView *PCView;
@property (strong ,nonatomic) UILabel *titleLabel;
@property (strong ,nonatomic) UILabel *descriptionLabel;
@property (strong ,nonatomic) News *news;
@end
