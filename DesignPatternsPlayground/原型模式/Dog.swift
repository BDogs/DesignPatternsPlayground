//
//  Dog.swift
//  DesignPatternsPlayground
//
//  Created by 诸葛游 on 2018/6/12.
//Copyright © 2018年 品驰医疗. All rights reserved.
//

import UIKit

class Dog: NSObject {

    var pups: [Dog] = []
    var name: String = ""
    
    override init() {
        
    }
}

extension Dog: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

extension Dog: NSMutableCopying {
    func mutableCopy(with zone: NSZone? = nil) -> Any {
        let tmp = Dog()
        tmp.name = name
        return tmp
    }
}
