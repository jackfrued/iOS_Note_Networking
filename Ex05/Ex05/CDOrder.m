//
//  CDOrderModel.m
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDOrder.h"

@implementation CDOrder

+ (NSDictionary *) modelCustomPropertyMapper {
    return @{
        @"orderId": @"order_id",
        @"totalPrice": @"order_price"
    };
}

+ (NSDictionary *) modelContainerPropertyGenericClass {
    return @{
        @"products": NSClassFromString(@"CDProduct")
    };
}

- (NSString *)description {
    return [NSString stringWithFormat:@"订单号: %d 总价: %.2f\n",
            _orderId, _totalPrice];
}

@end
