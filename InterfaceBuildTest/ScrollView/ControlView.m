//
//  ControlView.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/10/1.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ControlView.h"

#define offSetY 10
#define offSetX 10



@interface ControlView ()
@property (strong, nonatomic) UILabel *showLabel;
@end

@implementation ControlView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //创建选项选项中的数组
    NSArray *array = @[@"hello",@"world",@"Dream",@"Hgs"];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置默认选中哪一个
    segment.selectedSegmentIndex = 1;
    //设置位置
    segment.frame = CGRectMake(10, 30, BoundsWidth-20, 35);
    //根据值的改变执行方法
    [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:segment];
    
    //滑动模块
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, segment.tail+offSetY, segment.width, 20)];
    //设置滑动的值
    slider.value = 1.0;
    //添加行为
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:slider];
    
    self.showLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, slider.tail+offSetY, BoundsWidth-offSetX*2, 30)];
    //设置标签的文字
    self.showLabel.text = @"我是标签，试着滑动上面的滑块~";
    //设置标签的文字颜色(使用RGB)
    self.showLabel.textColor = [UIColor colorWithRed:20./255 green:130./255 blue:40./255 alpha:1];
    [self addSubview:self.showLabel];
    
    UISwitch *switchControl = [[UISwitch alloc]initWithFrame:CGRectMake(offSetX, _showLabel.tail+offSetY, 100, 40)];
    [switchControl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:switchControl];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setTitle:@"关闭当前视图" forState:0];
    [closeBtn setTitleColor:[UIColor purpleColor] forState:0];
    closeBtn.frame = CGRectMake(offSetX, switchControl.tail+offSetY, 130, 35);
    closeBtn.layer.borderWidth = .5;
    closeBtn.cornerRadius = 5;
    [closeBtn addTarget:self action:@selector(closeViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
}
#pragma mark - actions

-(void)segmentAction:(UISegmentedControl *)segment
{
    //输出选中哪一个
    NSLog(@"%ld",segment.selectedSegmentIndex);
}

-(void)sliderAction:(UISlider *)slider
{
    //值的范围是0-1，可以根据需求修改
    NSLog(@"%lf",slider.value);
    //根据滑块的值修改透明度（alpha的值范围为0-1）
    self.showLabel.alpha = slider.value;
}
-(void)switchAction:(UISwitch *)sender
{
    if(sender.on==YES)
    {
        NSLog(@"on");
    }
    if(sender.on==NO)
    {
        NSLog(@"off");
    }
}
-(void)closeViewAction:(UIButton *)sender
{
    //发送一个通知，首先先要注册一个通知，接受这个的消息
    [[NSNotificationCenter defaultCenter]postNotificationName:CloseScrollerView object:nil];
}
@end
