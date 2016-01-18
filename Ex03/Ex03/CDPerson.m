//
//  CDPerson.m
//  Ex03
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

#import "CDPerson.h"

@implementation CDPerson

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
}

- (NSString *) description {
    NSMutableString *mStr = [NSMutableString string];
    for (NSString *friendsName in _friends) {
        [mStr appendString:friendsName];
        [mStr appendString:@" "];
    }
    return [NSString stringWithFormat:@"姓名: %@\n年龄: %ld\n朋友: %@", _name, _age, mStr];
}

@end
