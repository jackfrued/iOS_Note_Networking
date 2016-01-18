//
//  ViewController.m
//  Ex01
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"

#define CENTER_X CGRectGetWidth(self.view.bounds) / 2
#define CENTER_Y CGRectGetHeight(self.view.bounds) / 2

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    imageView.center = CGPointMake(CENTER_X, CENTER_Y);
    [self.view addSubview:imageView];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/img/bd_logo1.png"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    imageView.image = [UIImage imageWithData:data];
}

@end
