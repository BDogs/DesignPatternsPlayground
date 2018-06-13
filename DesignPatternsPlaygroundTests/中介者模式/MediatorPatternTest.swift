//
//  MediatorPatternTest.swift
//  DesignPatternsPlaygroundTests
//
//  Created by 诸葛游 on 2018/6/13.
//  Copyright © 2018年 品驰医疗. All rights reserved.
//

import XCTest
@testable import DesignPatternsPlayground

class MediatorPatternTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let mediator = GXCSystem()
        // 采购电脑
        let p = Purchase(m: mediator)
        p.buyIBMComputer(num: 100)
        // 销售电脑
        let saler = Sale(m: mediator)
        saler.sellIBMComputer(num: 1)
        // 库房管理
        let stocker = Stock(m: mediator)
        stocker.clear()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
