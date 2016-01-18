//
//  CDEchoClient.m
//  Ex08_EchoClient
//
//  Created by LUOHao on 16/1/15.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDEchoClient.h"
#import <arpa/inet.h>

@implementation CDEchoClient

- (instancetype)initWithAddress:(NSString *)address port:(int)port {
    // 调用CFSocketCreate函数通过指定的协议和类型创建套接字
    // 第一个参数通常是NULL(使用默认的对象内存分配器)
    // 第二个参数AF_INET表示使用IPv4(如果指定成0或负数默认也是AF_INET)
    // 第三个参数是套接字类型(如果指定成0或负数默认也是SOCK_STREAM)
    // 第四个参数是协议(如果前一个参数是SOCK_STREAM默认为TCP, 前一个参数是SOCK_DGRAM默认为UDP)
    // 第五个参数和第六个参数是回调类型和回调函数
    // 第七个参数是保存数据的上下文环境
    self.socket = CFSocketCreate(NULL, AF_INET, SOCK_STREAM, IPPROTO_TCP, 0,  NULL, NULL);
    if (!self.socket) {
        self.errorCode = SocketError;
    }
    else {
        // 表示服务器地址的结构体
        struct sockaddr_in servaddr;
        memset(&servaddr, 0, sizeof(servaddr));
        servaddr.sin_len = sizeof(servaddr);
        servaddr.sin_family = AF_INET;
        servaddr.sin_port = htons(port);
        // 将字符串形式的地址转换成网络地址的结构体变量
        inet_pton(AF_INET, [address cStringUsingEncoding:NSUTF8StringEncoding], &servaddr.sin_addr);
        // 将地址结构体转换成CFDataRef类型
        CFDataRef connectAddr = CFDataCreate(NULL, (unsigned char *)&servaddr, sizeof servaddr);
        // 调用CFSocketConnectToAddress函数连接远端套接字(服务器)
        // 其中第三个参数代表连接的超时时间以秒为单位
        // 如果函数返回kCFSocketSuccess表示连接成功 否则就是连接失败或超时
        if (!connectAddr || CFSocketConnectToAddress(self.socket, connectAddr, kConnectionTimeout) != kCFSocketSuccess) {
            self.errorCode = ConnectError;
        }
    }
    return self;
}

- (NSString *) sendMessage:(NSString *) msg {
    char buffer[kMaxMessageLength];
    // 获得本地套接字
    CFSocketNativeHandle sock = CFSocketGetNative(self.socket);
    const char *mess = [msg cStringUsingEncoding:NSUTF8StringEncoding];
    // 向服务器发送Echo消息
    send(sock, mess, strlen(mess) + 1, 0);
    // 接受服务器返回的消息
    recv(sock, buffer, sizeof buffer, 0);
    return [NSString stringWithUTF8String:buffer];
}

- (void) dealloc {
    if (self.socket) {
        CFRelease(self.socket);
        self.socket = NULL;
    }
}

@end
