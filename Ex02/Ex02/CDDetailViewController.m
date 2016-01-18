//
//  CDDetailViewController.m
//  Ex02
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDDetailViewController.h"

@interface CDDetailViewController () <UIWebViewDelegate>

@end

@implementation CDDetailViewController {
    UIWebView *myWebView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    myWebView.scalesPageToFit = YES;
    [self.view addSubview:myWebView];
    
    NSURL *url = [NSURL URLWithString:_urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
}

@end
