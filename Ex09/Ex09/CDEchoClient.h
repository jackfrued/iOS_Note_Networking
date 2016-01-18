//
//  CDEchoClient.h
//  Ex08_EchoClient
//
//  Created by LUOHao on 16/1/15.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CFNetworkServerErrorCode) {
    NoError,
    SocketError,
    ConnectError
};

static const int kMaxMessageLength = 4096;
static const int kConnectionTimeout = 15;

@interface CDEchoClient : NSObject

@property (nonatomic) NSUInteger errorCode;
@property (nonatomic) CFSocketRef socket;

- (instancetype) initWithAddress:(NSString *) address port:(int) port;

- (NSString *) sendMessage:(NSString *) msg;

@end
