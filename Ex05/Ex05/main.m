//
//  main.m
//  Ex05
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDOrder.h"
#import "YYModel.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{
           @"order_id": @(104),
           @"order_price": @(108.85),
           @"products": @[
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
        
        CDOrder *order = [CDOrder yy_modelWithDictionary:dict];
        NSLog(@"%@", order);
        for (id product in order.products) {
            NSLog(@"%@", product);
        }
    }
    return 0;
}
