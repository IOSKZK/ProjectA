//
//  ViewController.m
//  SCNavTabbarDemo
//
//  Created by ShiCang on 14/11/17.
//  Copyright (c) 2014年 SCNavTabbarDemo. All rights reserved.
//

#import "ViewController.h"
#import "SCNavTabBarController.h"
#import "RecreationTableViewController.h"
#import "TopLineViewController.h"
#import "ScienceTableViewController.h"
#import "NBATableViewController.h"
#import "PerformViewController.h"
#import "MilitaryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //段子
    RecreationTableViewController *recreationVC = [[RecreationTableViewController alloc] init];
    recreationVC.title = @"段子";
    recreationVC.view.backgroundColor = [UIColor orangeColor];
    //头条
    TopLineViewController *topLineVC=[[TopLineViewController alloc]init];
    topLineVC.title=@"头条";
    //科技
    ScienceTableViewController *scienceVC=[[ScienceTableViewController alloc]init];
    scienceVC.title=@"科技";
    //NBA
    NBATableViewController *nbaVC=[[NBATableViewController alloc]init];
    nbaVC.title=@"NBA";
    //娱乐
    PerformViewController *performVC=[[PerformViewController alloc]init];
    performVC.title=@"娱乐";
    //军事
    MilitaryViewController *militaryVC=[[MilitaryViewController alloc]init];
    militaryVC.title=@"军事";
    
    
    
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[topLineVC,performVC,scienceVC,nbaVC,recreationVC,militaryVC];
  //  navTabBarController.showArrowButton = YES;
    [navTabBarController addParentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
