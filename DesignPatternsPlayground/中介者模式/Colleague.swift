//
//  Colleague.swift
//  DesignPatternsPlayground
//
//  Created by 诸葛游 on 2018/6/13.
//  Copyright © 2018年 品驰医疗. All rights reserved.
//

import Foundation

protocol Colleague {
    var mediator: Mediator? { get set }
    init()
    init(m: Mediator)
}

class Purchase: Colleague {
    var mediator: Mediator?
    
    required init() {
    }
    
    required init(m: Mediator) {
        self.mediator = m
    }
}

extension Purchase {
    func buyIBMComputer(num: Int) -> Void {
        mediator?.execute(command: "purchase.buy", userInfo: ["num": num])
    }
    
    func refuseBuyIBM() -> Void {
        debugPrint("不再采购IBM电脑")
    }
}


class Sale: Colleague {
    var mediator: Mediator?
    
    required init() {
    }
    
    required init(m: Mediator) {
        self.mediator = m
    }
}

extension Sale {
    func sellIBMComputer(num: Int) -> Void {
        mediator?.execute(command: "sale.sell", userInfo: ["num": num])
        debugPrint("销售IBM电脑\(num)")
    }
    
    var saleStaus: Int {
        let staus = Int.random(in: 0...100)
        return staus
    }
    
    /// 折价处理
    func offSell() -> Void {
        mediator?.execute(command: "sale.offsell", userInfo: [:])
    }
    
}

class Stock: Colleague {
    var mediator: Mediator?
    var computerNumber = 100
    
    required init() {
    }
    
    required init(m: Mediator) {
        self.mediator = m
    }
}

extension Stock {
    func increase(num: Int) -> Void {
        computerNumber += num
        debugPrint("库存增加，现有\(computerNumber)")
    }
    
    func decrease(num: Int) -> Void {
        computerNumber -= num
        debugPrint("库存减少，现有\(computerNumber)")
    }
    
    /// 存货压力大 通知采购停止采购 通知销售尽快清仓
    func clear() -> Void {
        debugPrint("预计需要清理库存，\(computerNumber)")
        mediator?.execute(command: "stock.clear", userInfo: [:])
    }
}
