//
//  CDProductModel.m
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDProduct.h"

@implementation CDProduct

- (NSString *)description {
    return [NSString stringWithFormat:@"商品编号: %d\n商品名称: %@\n商品价格: %.2f\n商品数量: %d", _id, _name, _price, _amount];
}

@end
