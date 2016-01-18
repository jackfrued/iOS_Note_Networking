//
//  main.m
//  Ex07
//
//  Created by LUOHao on 16/1/15.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <arpa/inet.h>

static const short SERVER_PORT = 1234;  // 端口
static const int MAX_Q_LEN = 64;        // 最大队列长度
static const int MAX_MSG_LEN = 4096;    // 最大消息长度

void change_enter_to_tail_zero(char * const buffer, int pos) {
    for (int i = pos - 1; i >= 0; i--) {
        if (buffer[i] == '\r') {
            buffer[i] = '\0';
            break;
        }
    }
}

void handle_client_connection(int clientSocketFD) {
    bool clientConnected = true;
    while (clientConnected) {
        char buffer[MAX_MSG_LEN + 1];
        ssize_t bytesToRecv = recv(clientSocketFD, buffer,
                                   sizeof buffer - 1, 0);
        if (bytesToRecv > 0) {
            buffer[bytesToRecv] = '\0';
            change_enter_to_tail_zero(buffer, (int)bytesToRecv);
            printf("%s\n", buffer);
            if (!strcmp(buffer, "bye")) {
                clientConnected = false;
            }
            ssize_t bytesToSend = send(clientSocketFD, buffer,
                                       bytesToRecv, 0);
            if (bytesToSend > 0) {
                printf("Echo message has been sent.\n");
            }
        }
        else {
            printf("client socket closed!\n");
            clientConnected = false;
        }
    }
    close(clientSocketFD);
}

int main() {
    int serverSocketFD = socket(AF_INET, SOCK_STREAM, 0);
    if (serverSocketFD < 0) {
        perror("无法创建套接字!!!\n");
        exit(1);
    }
    
    struct sockaddr_in serverAddr;
    serverAddr.sin_family = AF_INET;
    serverAddr.sin_port = htons(SERVER_PORT);
    serverAddr.sin_addr.s_addr = htonl(INADDR_ANY);
    
    int ret = bind(serverSocketFD, (struct sockaddr *)&serverAddr,
                   sizeof serverAddr);
    if (ret < 0) {
        perror("无法将套接字绑定到指定的地址!!!\n");
        close(serverSocketFD);
        exit(1);
    }
    
    ret = listen(serverSocketFD, MAX_Q_LEN);
    if (ret < 0) {
        perror("无法开启监听!!!\n");
        close(serverSocketFD);
        exit(1);
    }
    
    while(true) {
        struct sockaddr_in clientAddr;
        socklen_t clientAddrLen = sizeof clientAddr;
        int clientSocketFD = accept(serverSocketFD,
                                    (struct sockaddr *)&clientAddr, &clientAddrLen);
        if (clientSocketFD < 0) {
            perror("接受客户端连接时发生错误!!!\n");
        }
        else {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                handle_client_connection(clientSocketFD);
            });
        }
    }
    return 0;
}

