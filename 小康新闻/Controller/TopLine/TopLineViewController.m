//
//  TopLineViewController.m
//  SCNavTabbarDemo
//
//  Created by lanou3g on 15/7/9.
//  Copyright (c) 2015年 SCNavTabbarDemo. All rights reserved.
//

#import "TopLineViewController.h"
#import "HeadlineCell.h"
#import "News.h"
#import "UIImageView+WebCache.h"


#define Kwidth [UIScreen mainScreen].bounds.size.width
#define Kheight [UIScreen mainScreen].bounds.size.height
#define HeadLineURL @"http://c.3g.163.com/nc/article/headline/T1348647909107/0-20.html"
#define ScrollPicURL @"http://c.3g.163.com/nc/ad/headline/android/0-3.html"

@interface TopLineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong ,nonatomic) UITableView *tableView;
@property (strong ,nonatomic) UIScrollView *scrollView;
@property (strong ,nonatomic) NSDictionary *dataDic;
@property (strong ,nonatomic) NSArray *dataArray;//盛放每条新闻数据的数组
@property (strong ,nonatomic) NSMutableArray *NewsArtray;//盛放新闻对象的数组
@property (strong ,nonatomic) NSDictionary *PicdataDic;
@end

@implementation TopLineViewController

static NSString *identifier=@"headLineCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    [self initTableView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadData];
}
#pragma -mark ******************处理数据************************
#pragma -mark 解析数据
-(void)loadData
{
    //轮播图
    //    NSURL *PicUrl=[NSURL URLWithString:ScrollPicURL];
    //    NSData *Picdata=[NSData dataWithContentsOfURL:PicUrl];
    //    NSLog(@"picdata=%@",Picdata);
    //    self.PicdataDic=[NSJSONSerialization JSONObjectWithData:Picdata options:NSJSONReadingMutableContainers error:nil];
    //    NSArray *picDataArray=[self.PicdataDic valueForKey:@"headline_ad"];
    //    NSLog(@"picDataArray=%@",picDataArray);
    
    
    
    //normal新闻
    NSURL *url=[NSURL URLWithString:HeadLineURL];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dataDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.dataArray=[NSArray arrayWithArray:[dataDic valueForKey:@"T1348647909107"]];
    self.NewsArtray=[[NSMutableArray alloc]init];
    for (NSDictionary *dic in self.dataArray)
    {
        if (![[dic valueForKey:@"digest"]isEqualToString:@""""])
        {
            [self initNews:dic andInitArray:self.NewsArtray];
        }
    }
}
#pragma -mark 对News对象赋值
-(void)initNews:(NSDictionary *)dic andInitArray:(NSMutableArray *)array
{
    News *new=[News new];
    new.digest=[dic valueForKey:@"digest"];
    new.imgsrc=[dic valueForKey:@"imgsrc"];
    new.lmodify=[dic valueForKey:@"lmodify"];
    new.ptime=[dic valueForKey:@"ptime"];
    new.title=[dic valueForKey:@"title"];
    new.url_3w=[dic valueForKey:@"url_3w"];
    new.source=[dic valueForKey:@"source"];
    [array addObject:new];
}

#pragma -mark *****************初始化视图控件****************************
#pragma -mark 初始化ScrollView
-(void)initScrollView
{
    
}

#pragma -mark 初始化tableview，并设置代理
-(void)initTableView
{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0,Kwidth, Kheight-64) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    [self.tableView registerClass:[HeadlineCell class] forCellReuseIdentifier:identifier];
}

#pragma -mark 设置cell
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeadlineCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if (self.NewsArtray.count>indexPath.row) {
        cell.news=self.NewsArtray[indexPath.row];
    }
    cell.titleLabel.text=cell.news.title;
    CGRect frame =[cell.news.digest boundingRectWithSize:CGSizeMake(Kwidth-88, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    cell.descriptionLabel.frame=CGRectMake(85, 35, frame.size.width,35);
    cell.descriptionLabel.text=cell.news.digest;
    
    [cell.PCView sd_setImageWithURL:[NSURL URLWithString:cell.news.imgsrc]];
    
    return cell;
}

#pragma -mark设置cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma -mark 设置cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
