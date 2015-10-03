//
//  ScrollerViewController.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/9/30.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ScrollerViewController.h"
#import "ControlView.h"
#import "TableViewView.h"

@interface ScrollerViewController ()<UIScrollViewDelegate>


@end

@implementation ScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createScrollerView];
    [self addObserve];
}
-(void)addObserve
{
    //添加一个通知监听，接受名字为CloseScrollerView的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(closeViewAction) name:CloseScrollerView object:nil];
}
-(void)createScrollerView
{
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, BoundsWidth, BoundsHeight)];
    //设置颜色的其中一种方法，如果white是0，那么就是黑色吧百分之30，white是1的话，那么就是白色的百分之30
    scroller.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    //设置滚动的范围
    scroller.contentSize = CGSizeMake(BoundsWidth*3.5, BoundsHeight);
    //设置是否按页滑动，开启的话滚动一个屏幕的宽度
    scroller.pagingEnabled = YES;
    //添加代理
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    ControlView *controlView = [[ControlView alloc]initWithFrame:CGRectMake(0, 0, BoundsWidth, BoundsHeight)];
    [scroller addSubview:controlView];
    
    TableViewView *tableView = [[TableViewView alloc]initWithFrame:CGRectMake(BoundsWidth, StatusBarHeight, BoundsWidth, BoundsHeight-StatusBarHeight)];
    [scroller addSubview:tableView];
}
//scrollview的代理方法，tableview也属于scrollview，collectionView也是
#pragma mark - scroller delegate
//scrollView滑动会调用这个代理方法，最常用的一个方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取scrollview滑动的偏移量
    CGPoint point = scrollView.contentOffset;
    NSLog(@"offsetX=%lf,offsetY=%lf",point.x,point.y);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - actions
-(void)closeViewAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
