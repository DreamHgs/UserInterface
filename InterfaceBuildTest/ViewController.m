//
//  ViewController.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/9/29.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ViewController.h"
#import "ScrollerViewController.h"
#import "ExampleViewController.h"



#define ViewWidth   self.view.frame.size.width
#define ViewHeight  self.view.frame.size.height

#define NavHeight   64
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
    button.frame = CGRectMake(10, NavHeight+10, 160, 30);
    //设置按钮的文字
    [button setTitle:@"进入下一个界面" forState:UIControlStateNormal];
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
    
    //创建导航栏按钮，并且添加动作selector
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStylePlain target:self action:@selector(addAction:)];
    //设置文字颜色
    [rightBarBtn setTintColor:[UIColor whiteColor]];
    //设右侧按钮（左侧为leftBarButtonItem）
    self.navigationItem.rightBarButtonItem = rightBarBtn;
}

-(void)createALabel
{
    //创建并设置位置
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, NavHeight+50, 100, 30)];
    //设置背景颜色
    label.backgroundColor = [UIColor greenColor];
    //设置内容
    label.text = @"Xib";
    //修改字体大小
    label.font = [UIFont systemFontOfSize:14.f];
    //修改文字颜色
    label.textColor = [UIColor redColor];
    
    //设置内容布局,默认是NSTextAlignmentLeft
    label.textAlignment = NSTextAlignmentCenter;
//    label.textAlignment = NSTextAlignmentRight;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(creatWithXib:)];
    [label setUserInteractionEnabled:YES];
    [label addGestureRecognizer:tap];
    //添加倒你要添加的视图中
    [self.view addSubview:label];
}

-(void)createAnImageView
{
    //创建一个图片
    UIImage *image = [UIImage imageNamed:@"background"];
//    创建一个图片视图，并设置位置
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 155, image.size.width, image.size.height)];
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
    
    //相对位置调整一下即可
    UILabel *label_1 = [[UILabel alloc]initWithFrame:CGRectMake(10, line_1.y-20, 100, 20)];
    label_1.text = @"啦啦啦~";
    [view addSubview:label_1];
}
#pragma mark - actions
-(void)nextViewAction:(UIButton *)sender
{
    ScrollerViewController *scroller = [ScrollerViewController new];
    [self presentViewController:scroller animated:YES completion:nil];
}

-(void)addAction:(UIBarButtonItem *)sender
{
    
    //使用UIStoryBoard创建视图控制器
    //首先先找到故事模板
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //再到所在的故事模板中查找标示符为testView的viewController
    UIViewController *view = [story instantiateViewControllerWithIdentifier:@"testView"];
    //弹出视图
    [self presentViewController:view animated:YES completion:^{
        
    }];
    
    
}
-(void)creatWithXib:(UITapGestureRecognizer *)tap
{
    UILabel *label = (UILabel *)tap.view;
    NSLog(@"%@",label);
    //使用xib创建视图控制器(如果xib是和.h和.m一起创建的话，使用ExampleViewController *viewController = [[ExampleViewController alloc]init];即可)
    ExampleViewController *viewController = [[ExampleViewController alloc]initWithNibName:@"ExampleView" bundle:[NSBundle mainBundle]];
    [self presentViewController:viewController animated:YES completion:^{

    }];
}
@end
