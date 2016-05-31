//
//  ViewController.m
//  ScrollView+ImageView
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"
#import "PageController.h"

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *myScrollView;
@property (nonatomic, strong) UIPageControl *myPageControl;
@property (nonatomic, strong) NSArray *contentList;//存放图片主题的数组
@property (nonatomic, strong) NSArray *coverList;//存放当前页数的数组
@property (nonatomic, strong) NSMutableArray *ViewControllers;//存放要显示页面的数组
@end

@implementation ViewController
- (UIPageControl *) myPageControl{
    if (!_myPageControl) {
        //创建UIPageControl控件
        _myPageControl = [[UIPageControl alloc] init];
        _myPageControl.frame = CGRectMake(0, _myScrollView.frame.size.height - 80, _myScrollView.frame.size.width, 80);
        _myPageControl.pageIndicatorTintColor = [UIColor blueColor];
        _myPageControl.currentPageIndicatorTintColor = [UIColor redColor];
        _myPageControl.currentPage = 0;
        _myPageControl.numberOfPages = _contentList.count;
        [self.view addSubview:_myPageControl];
    }
    return _myPageControl;
}
- (UIScrollView *)myScrollView{
    if (!_myScrollView) {
        //创建UIScrollView对象
        _myScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        //设置背景色
        _myScrollView.backgroundColor = [UIColor grayColor];
        _myScrollView.pagingEnabled = YES;
        //设置UIScrollView的contentSize－－就是它可滚动的区域大小
        _myScrollView.contentSize = CGSizeMake(_myScrollView.frame.size.width * _contentList.count, _myScrollView.frame.size.height);
        _myScrollView.showsHorizontalScrollIndicator = NO;
        _myScrollView.showsVerticalScrollIndicator = NO;
        _myScrollView.scrollsToTop = NO;
        [self.view addSubview:_myScrollView];
    }
    return _myScrollView;
}


//自定义方法，来加载UIScrollView的指定页对应的显示内容
- (void) loadScrollViewWithPage: (NSUInteger)page{
    //如果超出总页数，直接返回
    if (page >= self.contentList.count)
        return;
    //获取page索引处的页面
    PageController *controller = self.ViewControllers[page];
    //如果page索引处的页面为空，就初始化
    if ((NSNull *)controller == [NSNull null]) {
        controller = [[PageController alloc] initwithPageNumber:page];
        //用pageView对象代替原来的对象
        [self.ViewControllers replaceObjectAtIndex:page withObject:controller];
    }
    //将PageView控制器中对应的view添加到UIScrollView中
    if (controller.view.superview == nil) {
        CGRect frame = self.myScrollView.frame;
        frame.origin.x = CGRectGetWidth(frame) * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        controller.imageLabel.text = self.contentList[page];
        controller.myImage.image = [UIImage imageNamed:self.coverList[page]];
        [self addChildViewController:controller];
        [self.myScrollView addSubview:controller.view];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentList = @[@"启动页",@"首页",@"第二页",@"第三页"];
    self.coverList = @[@"1",@"2",@"3",@"4"];
    
    /*
     程序采用懒加载的方式来创建PageController控制器
     因此此处只向数组中添加一些null作为占位符
     等到程序需要时才真正创建PageController
     */
    [self myScrollView];
    [self myScrollView];
    self.ViewControllers = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < _contentList.count; i++) {
        [self.ViewControllers addObject:[NSNull null]];
    }
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    //每隔1秒掉用一次change方法
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
}
- (void) change{
    if (self.myPageControl.currentPage < 3) {
        self.myPageControl.currentPage = _myPageControl.currentPage +1;
    }
    else{
        self.myPageControl.currentPage = 0;
    }
    //调用changePage方法，将当前显示的页数传入
    [self changePage:self.myPageControl.currentPage];
}
- (void) changePage:(NSInteger)page{
    CGRect bounds = self.myScrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.myScrollView scrollRectToVisible:bounds animated:YES];
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
