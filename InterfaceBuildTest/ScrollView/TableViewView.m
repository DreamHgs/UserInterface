//
//  TableViewView.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/10/3.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "TableViewView.h"


static NSString *const CustomCellIdentifier = @"CustomCellIdentifier";


@interface TableViewView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TableViewView

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        [self drawRect:CGRectZero];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawRect:frame];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //创建tableView，并设置类型
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, BoundsWidth, ApplicationHeight) style:UITableViewStyleGrouped];
    //添加代理
    tableView.delegate = self;
    //数据源
    tableView.dataSource = self;
    [self addSubview:tableView];
}
//返回多少组，默认是一个，可以不实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//返回每组有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
//返回单元格，可以在这个函数中自定义
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //单元格要采用重用机制，防止一直创建所带来的内存不足或者溢出
    //先从重用列表中取出标识符为CustomCellIdentifier的单元格，如果没有的话那么久创建一个新的单元格
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if(!cell)
    {
        //单元格的创建在这里面
        cell = [self createTableViewCell];
    }
    //最后对单元格进行赋值，包括位置和值
    [self configCell:cell];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了第%ld组,第%ld行",indexPath.section,indexPath.row);
}
//设置单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //系统默认为44的行高
    return 70;
}
//头视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //可以使用这个函数实现隐藏头部视图，最小值可调至0.1（iOS_8）
    return 20;
}
//尾部视图的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)createTableViewCell
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CustomCellIdentifier];
    
    //自定义单元格中加入空间，最好使用tag值，然后用tag取出，减少暴露接口
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
    label.tag = 1000;
    [cell.contentView addSubview:label];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(10+label.right, 10, 18, 18)];
    image.tag = 1001;
    [cell.contentView addSubview:image];
    return cell;
}
-(void)configCell:(UITableViewCell *)cell
{
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1000];
    UIImageView *image = (UIImageView *)[cell.contentView viewWithTag:1001];
    
    label.text = @"23400HJk";
    image.image = [UIImage imageNamed:@"iconfont-qrcode"];
    
}
@end
