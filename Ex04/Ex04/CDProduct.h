//
//  CDProductModel.h
//  Ex04
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

/**产品*/
@interface CDProduct: JSONModel

@property (nonatomic, assign) int id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) double price;
@property (nonatomic, assign) int amount;

@end
