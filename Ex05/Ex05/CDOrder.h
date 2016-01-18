//
//  CDOrderModel.h
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CDProduct;

/**订单*/
@interface CDOrder: NSObject

@property (nonatomic, assign) int orderId;
@property (nonatomic, assign) double totalPrice;
@property (nonatomic, strong) NSArray<CDProduct *> *products;

@end
