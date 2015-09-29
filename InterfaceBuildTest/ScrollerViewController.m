//
//  ScrollerViewController.m
//  InterfaceBuildTest
//
//  Created by 洪泽泓 on 15/9/30.
//  Copyright (c) 2015年 洪泽泓. All rights reserved.
//

#import "ScrollerViewController.h"

@interface ScrollerViewController ()

@end

@implementation ScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createScrollerView];
}

-(void)createScrollerView
{
    UIScrollView *scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, BoundsWidth, BoundsHeight)];
    scroller.backgroundColor = [UIColor redColor];
    [self.view addSubview:scroller];
    
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
