//
//  PrototypePatternTest.swift
//  DesignPatternsPlaygroundTests
//
//  Created by 诸葛游 on 2018/6/12.
//  Copyright © 2018年 品驰医疗. All rights reserved.
//

import UIKit
import XCTest
@testable import DesignPatternsPlayground

class PrototypePatternTest: XCTestCase {

    func testCopy() -> Void {
        let bobDog = Dog()
        bobDog.name = "bob"
        
        for i in 0...3 {
            let pup = Dog()
            pup.name = "little\(i+1)"
            bobDog.pups.append(pup)
        }
        print("-------------------------------------")
        print(String(format: "bobDog-%p", bobDog))
        print(String(format: "bobDog.pups-%p", bobDog.pups))
        for pup in bobDog.pups {
            print(String(format: "%@-%p", pup.name, pup))
        }
        guard let copy = bobDog.copy() as? Dog else { return }
        let pupsCopy = NSArray(array: bobDog.pups)
        
        print(String(format: "bobDog-%p", copy))
        print(String(format: "pupsCopy-%p", pupsCopy))
        for pup in pupsCopy {
            print(String(format: "%@-%p", ((pup as? Dog)?.name)!, pup as! CVarArg))
        }
        
        guard let pupsCopyCopy = pupsCopy.copy() as? NSArray else { return }
        
        print(String(format: "pupsCopyCopy-%p", pupsCopyCopy))
        for pup in pupsCopyCopy {
            print(String(format: "%@-%p", ((pup as? Dog)?.name)!, pup as! CVarArg))
        }

        guard let pupsCopyMutableCopy = pupsCopy.mutableCopy() as? NSMutableArray else { return }
        
        print(String(format: "pupsCopyMutableCopy-%p", pupsCopyMutableCopy))
        for pup in pupsCopyMutableCopy {
            print(String(format: "%@-%p", ((pup as? Dog)?.name)!, pup as! CVarArg))
        }

        
        print("-------------------------------------")
        

    }
    
}
