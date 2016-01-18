//
//  CDOrderModel.m
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDOrder.h"

@implementation CDOrder

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
        @"order_id": @"orderId",
        @"order_price": @"totalPrice"
    }];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"订单号: %d 总价: %.2f\n", _orderId, _totalPrice];
}

@end
