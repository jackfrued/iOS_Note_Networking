//
//  ViewController.m
//  Ex06
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"
#import "CDAdv.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "YYWebImage.h"
#import "MBProgressHUD.h"

#define WIDTH self.view.bounds.size.width

@interface ViewController ()

@end

@implementation ViewController {
    UIScrollView *myScrollView;
    NSMutableArray *modelsArray;
    NSTimer *timer;
    int currentIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 200)];
    myScrollView.bounces = NO;
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.scrollEnabled = NO;
    [self.view addSubview:myScrollView];
    
    [self loadAdvData];
}

- (void) loadAdvData {
    if (!modelsArray) {
        modelsArray = [NSMutableArray array];
    }
    
    // 创建HTTP会话管理器对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // AFNetworking默认接受的MIME类型是application/json
    // 有些服务器虽然返回JSON格式的数据但MIME类型设置的是text/html
    // 通过下面的代码可以指定支持的MIME类型有哪些
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
    // 向服务器发送GET请求获取JSON数据
    [manager
        // URL
        GET:@"http://mapi.damai.cn/hot201303/nindex.aspx"
        // 请求参数
        parameters:@{ @"cityid": @"0", @"source": @"10099", @"version": @"30602" }
        // 当完成进度变化时回调的Block
        progress:nil
        // 服务器响应成功要回调的Block
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            for (NSDictionary *modelDict in responseObject) {
                CDAdv *model = [CDAdv yy_modelWithDictionary:modelDict];
                [modelsArray addObject:model];
            }
            [self customizeAdvBanner];
        }
        // 服务器响应失败要回调的Block
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
        }
    ];
    
//    [manager
//        // 统一资源定位符
//        POST:@""
//        // 请求参数
//        parameters:@{}
//        constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//            // 可以调用appendPartWithFileData:name:fileName:mimeType:等方法
//            // 将上传给服务器的数据放到请求报文的消息体中
//        }
//        progress:^(NSProgress * _Nonnull uploadProgress) {
//            // 当上传进度发生变化时执行这里的代码
//        }
//        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            // 服务器响应成功执行这里的代码
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            // 服务器响应失败执行这里的代码
//        }
//    ];
}

- (void)customizeAdvBanner {
    myScrollView.contentSize = CGSizeMake(modelsArray.count * WIDTH, 200);
    [modelsArray enumerateObjectsUsingBlock:^(CDAdv *model, NSUInteger idx, BOOL *stop) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(idx * WIDTH, 0, WIDTH, 200)];
        // 使用YYWebImage异步加载图片(SDWebImage也是著名的异步加载图片的第三方库)
        imageView.yy_imageURL = [NSURL URLWithString:model.picUrl];
        [myScrollView addSubview:imageView];
    }];
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(switchAdv:) userInfo:nil repeats:YES];
}

- (void)switchAdv:(NSTimer *) sender {
    currentIndex += 1;
    currentIndex %= modelsArray.count;
    CGPoint offset = myScrollView.contentOffset;
    offset.x = currentIndex * WIDTH;
    
    [UIView animateWithDuration:0.5 animations:^{
        myScrollView.contentOffset = offset;
    }];
}

- (void)dealloc {
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
}

@end
