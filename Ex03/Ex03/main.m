//
//  main.m
//  Ex03
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dict = @{ @"name": @"骆昊", @"age":@(35), @"friends":@[@"金庸", @"古龙", @"黄易"] };
        CDPerson *person = [[CDPerson alloc] init];
        [person setValuesForKeysWithDictionary:dict];
        
        NSLog(@"%@", person);
    }
    return 0;
}
