//
//  CDOrderModel.h
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol CDProduct <NSObject>
@end

/**订单*/
@interface CDOrder: JSONModel

@property (nonatomic, assign) int orderId;
@property (nonatomic, assign) double totalPrice;
@property (nonatomic, strong) NSArray<CDProduct> *products;

@end
