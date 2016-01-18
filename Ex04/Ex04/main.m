//
//  main.m
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDOrder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{
            @"order_id": @(104),
            @"order_price": @(108.85),
            @"products" : @[
                @{
                    @"id": @"123",
                    @"name": @"Product #1",
                    @"price": @(12.95),
                    @"amount": @(2)
                },
                @{
                    @"id": @"137",
                    @"name": @"Product #2",
                    @"price": @(82.95),
                    @"amount": @(1)
                }
            ]
        };
        
        CDOrder *model = [[CDOrder alloc] initWithDictionary:dict error:nil];
        NSLog(@"%@", model);
        for (id product in model.products) {
            NSLog(@"%@", product);
        }
    }
    return 0;
}
