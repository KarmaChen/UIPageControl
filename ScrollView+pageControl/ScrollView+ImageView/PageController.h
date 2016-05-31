//
//  PageController.h
//  ScrollView+ImageView
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageController : UIViewController
@property (nonatomic, strong) UILabel *label;//显示页数
@property (nonatomic, strong) UILabel *imageLabel;//显示图片主题
@property (nonatomic, strong) UIImageView *myImage;
- (id)initwithPageNumber: (NSInteger)pageNumber;

@end
