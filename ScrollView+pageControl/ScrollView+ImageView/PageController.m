//
//  PageController.m
//  ScrollView+ImageView
//
//  Created by Karma on 16/5/31.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "PageController.h"

@implementation PageController
- (id) initwithPageNumber:(NSInteger)pageNumber{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(260, 10, 60, 30)];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor redColor];
    self.label.text = [NSString stringWithFormat:@"第[%ld]页",pageNumber + 1];
    [self.view addSubview:self.label];
    self.imageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 60)];
    self.imageLabel.textAlignment = NSTextAlignmentCenter;
    self.imageLabel.numberOfLines = 2;
    self.imageLabel.font = [UIFont systemFontOfSize:24];
    self.imageLabel.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.imageLabel];
    self.myImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, 580)];
    [self.view addSubview:self.myImage];
    return self;
}
@end
