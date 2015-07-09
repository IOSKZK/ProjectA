//
//  ScrollCell.h
//  SCNavTabbarDemo
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 SCNavTabbarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollCell : UITableViewCell
@property (strong ,nonatomic) UIScrollView *scrollView;
@property (strong ,nonatomic) UILabel *titleLabel;
@property (strong ,nonatomic) UIPageControl *pageControl;


@end
