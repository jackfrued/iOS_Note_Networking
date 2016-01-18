//
//  Person.swift
//  Ex03_Swift
//
//  Created by LUOHao on 16/1/11.
//  Copyright © 2016年 mobiletrain. All rights reserved.
//

import Foundation

class Person: NSObject {
    var name: String = ""
    var age: UInt = 0
    var friends: [String] = []
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }
    
    override var description: String {
        get {
            var mStr = String()
            for friendName in friends {
                mStr.appendContentsOf("\(friendName) ")
            }
            return "姓名: \(name)\n年龄: \(age)\n朋友: \(mStr)"
        }
    }
}
