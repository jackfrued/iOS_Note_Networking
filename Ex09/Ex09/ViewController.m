//
//  ViewController.m
//  Ex09
//
//  Created by LUOHao on 16/1/15.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "ViewController.h"
#import "CDEchoClient.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *msgField;
@property (weak, nonatomic) IBOutlet UILabel *echoMsgLabel;

@end

@implementation ViewController {
    CDEchoClient *client;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    client = [[CDEchoClient alloc] initWithAddress:@"192.168.0.127" port:1234];
}

- (IBAction)sendButtonClicked:(id)sender {
    // 发送bye消息会断开与服务器的连接 不能再发送消息
    if (client && client.errorCode == NoError) {
        NSString *msg = [self.msgField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (msg.length > 0) {
            [self.msgField resignFirstResponder];
            self.echoMsgLabel.text = [client sendMessage:msg];
        }
    }
    else {
        NSLog(@"Cannot send message!!!");
    }
}

@end
