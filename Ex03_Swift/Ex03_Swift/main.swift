//
//  main.swift
//  Ex03_Swift
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

// import Foundation

var dict = [ "name": "骆昊", "age": 35, "friends": ["金庸", "古龙", "黄易"] ]
var person = Person()

person.setValuesForKeysWithDictionary(dict)
print(person.description)
