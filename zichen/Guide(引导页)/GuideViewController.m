//
//  GuideViewController.m
//  meishihui
//
//  Created by littleBit on 2017/4/24.
//  Copyright © 2017年 ZCH. All rights reserved.
//

#import "GuideViewController.h"
#define kPageCount 3
@interface GuideViewController ()<UIScrollViewDelegate>
{
    // 创建页码控制器
    UIPageControl *pageControl;
}
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    for (int i=0; i<kPageCount; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Guide%d",i+1]];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth * i, 0, kScreenWidth, kScreenHeight)];
        // 在最后一页创建按钮
        if (i == kPageCount - 1) {
            // 必须设置用户交互 否则按键无法操作
            imageView.userInteractionEnabled = YES;
            self.button = [UIButton buttonWithType:UIButtonTypeSystem];
            _button.frame = CGRectMake(kScreenWidth / kPageCount, kScreenHeight * 7 / 8, kScreenWidth / kPageCount, kScreenHeight / 16);
            [_button setTitle:@"立即体验" forState:UIControlStateNormal];
            [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _button.layer.borderWidth = 2;
            _button.layer.cornerRadius = 5;
            _button.clipsToBounds = YES;
            [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            _button.layer.borderColor = [UIColor whiteColor].CGColor;
            [imageView addSubview:_button];
        }
        imageView.image = image;
        [myScrollView addSubview:imageView];
    }
    myScrollView.bounces = NO;
    myScrollView.pagingEnabled = YES;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.contentSize = CGSizeMake(kScreenWidth * kPageCount, kScreenHeight);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenWidth / kPageCount, kScreenHeight * 15 / 16, kScreenWidth / kPageCount, kScreenHeight / 16)];
    // 设置页数
    pageControl.numberOfPages = kPageCount;
    // 设置页码的点的颜色
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    // 设置当前页码的点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [self.view addSubview:pageControl];
}
- (void)buttonAction:(UIButton *)sender {
    self.guideBtnBlock(sender);
}
#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 计算当前在第几页
    pageControl.currentPage = (NSInteger)(scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width);
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
