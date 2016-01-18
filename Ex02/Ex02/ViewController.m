//
//  ViewController.m
//  Ex02
//
//  Created by LUOHao on 16/1/9.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"
#import "CDDetailViewController.h"
#import "CDRelativeNews.h"
#import "DDXML.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController {
    UITableView *myTableView;
    NSMutableArray<CDRelativeNews *> *dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"相关新闻链接";
    
    myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [self.view addSubview:myTableView];
    
    [self loadDataModel];
}

- (void)loadDataModel {
    if (!dataArray) {
        dataArray = [NSMutableArray array];
    }
    
    // 创建统一资源定位符对象
    NSURL *url = [NSURL URLWithString:@"http://www.oschina.net/action/api/news_detail?id=44393"];
    // 通过统一资源定位符从服务器获得XML数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    // 使用NSData对象创建XML文档对象 文档对象是将XML在内存中组织成一棵树
    DDXMLDocument *doc = [[DDXMLDocument alloc] initWithData:data options:0 error:nil];
    // 使用XPath语法从文档对象模型中查找指定节点
    NSArray *array = [doc nodesForXPath:@"//relative" error:nil];
    // 循环取出节点并对节点下的子节点进行进一步解析
    for (DDXMLNode *node in array) {
        CDRelativeNews *model = [[CDRelativeNews alloc] init];
        // 取出当前节点的子节点并获取其对应的值
        model.title = [node.children[0] stringValue];
        model.url = [node.children[1] stringValue];
        // 将模型对象添加到数组中
        [dataArray addObject:model];
    }
    // 刷新表格视图
    [myTableView reloadData];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = dataArray[indexPath.row].title;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CDRelativeNews *model = dataArray[indexPath.row];
    CDDetailViewController *detailVC = [[CDDetailViewController alloc] init];
    detailVC.urlStr = model.url;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
