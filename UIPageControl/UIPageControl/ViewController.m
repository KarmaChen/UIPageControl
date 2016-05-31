//
//  ViewController.m
//  UIPageControl
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIPageControl *myPageControl;
@end

@implementation ViewController
- (UIPageControl *) myPageControl{
    if (!_myPageControl) {
        _myPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(180, 300, 50, 10)];
        _myPageControl.numberOfPages = 3;
        _myPageControl.currentPage = 2;
        _myPageControl.pageIndicatorTintColor = [UIColor grayColor];
        _myPageControl.currentPageIndicatorTintColor = [UIColor redColor];
        [_myPageControl addTarget:self action:@selector(change) forControlEvents:UIControlEventValueChanged];//当点击控件就会掉用change方法
        [self.view addSubview:_myPageControl];
    }
    return _myPageControl;
}
//实现change方法
- (void) change{
    NSLog(@"change");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self myPageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
