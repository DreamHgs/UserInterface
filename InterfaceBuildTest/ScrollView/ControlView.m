//
//  ControlView.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/10/1.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ControlView.h"

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
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(10, segment.tail+10, segment.width, 20)];
    //添加行为
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:slider];
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
}
@end
