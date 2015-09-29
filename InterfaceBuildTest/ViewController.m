//
//  ViewController.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/9/29.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ViewController.h"
#import "ScrollerViewController.h"

#define ViewWidth   self.view.frame.size.width
#define ViewHeight  self.view.frame.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createAButton];
//    [UIScreen mainScreen].bounds
    [self createALabel];
    [self createAnImageView];
    [self createLine];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createAButton
{
    //创建一个按钮，类型是系统默认的
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置按钮的位置
    button.frame = CGRectMake(10, 50, 100, 30);
    //设置按钮的文字
    [button setTitle:@"hello" forState:UIControlStateNormal];
    //设置文字的颜色
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置按钮的背景颜色
    [button setBackgroundColor:[UIColor redColor]];
    
    
    UIImage *image = [UIImage imageNamed:@"select"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置按钮的图片
//    [button setImage:image forState:UIControlStateNormal];
    //设置按钮的背景图片
//    [button setBackgroundImage:image forState:UIControlStateNormal];
    
    //设置倒角
    button.layer.cornerRadius = 3;
    
    [button addTarget:self action:@selector(nextViewAction:) forControlEvents:UIControlEventTouchUpInside];
    //返回按钮
    [self.view addSubview:button];
}

-(void)createALabel
{
    //创建并设置位置
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    //设置背景颜色
    label.backgroundColor = [UIColor greenColor];
    //设置内容
    label.text = @"ni hao a ~";
    //修改字体大小
    label.font = [UIFont systemFontOfSize:14.f];
    //修改文字颜色
    label.textColor = [UIColor redColor];
    
    //设置内容布局,默认是NSTextAlignmentLeft
    label.textAlignment = NSTextAlignmentCenter;
//    label.textAlignment = NSTextAlignmentRight;
    
    //添加倒你要添加的视图中
    [self.view addSubview:label];
}

-(void)createAnImageView
{
    //创建一个图片
    UIImage *image = [UIImage imageNamed:@"background"];
//    创建一个图片视图，并设置位置
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 140, image.size.width, image.size.height)];
//    设置图片
    imageView.image = image;
    [self.view addSubview:imageView];
}
//画线
-(void)createLine
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 440,ViewWidth , 200)];
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    //创建一个view，当做一条线
    UIView *line_1 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, ViewWidth, 1)];
    line_1.backgroundColor = [UIColor whiteColor];
    [view addSubview:line_1];
}
#pragma mark - actions
-(void)nextViewAction:(UIButton *)sender
{
    ScrollerViewController *scroller = [ScrollerViewController new];
    [self presentViewController:scroller animated:YES completion:nil];
}
@end
