//
//  Mediator.swift
//  DesignPatternsPlayground
//
//  Created by 诸葛游 on 2018/6/13.
//  Copyright © 2018年 品驰医疗. All rights reserved.
//

import Foundation

protocol Mediator {
    init()
    func execute(command: String, userInfo: [String: Any]) -> Void
}

class GXCSystem: Mediator {
    var purchase: Purchase
    var sale: Sale
    var stock: Stock
    required init() {
        purchase = Purchase()
        sale = Sale()
        stock = Stock()
    }
    
    func execute(command: String, userInfo: [String : Any]) {
        switch command {
        case "purchase.buy":
            guard let num = userInfo["num"] as? Int else { return }
            buyIBMComputer(num: num)
        case "sale.sell":
            guard let num = userInfo["num"] as? Int else { return }
            sellIBMComputer(num: num)
        case "sale.offSell":
            offSell()
        case "stock.clear":
            clear()
        default:
            break
        }
    }
}

extension GXCSystem {
    func buyIBMComputer(num: Int) -> Void {
        if sale.saleStaus > 80 {
            // 销售良好
            stock.increase(num: num)
        } else {
            // 销售状态不好 折半采购
            stock.increase(num: num/2)
        }
    }
    
    func sellIBMComputer(num: Int) -> Void {
        if stock.computerNumber < num {
            // 库存不够
            purchase.buyIBMComputer(num: num)
        }
        
        stock.decrease(num: num)
    }
    
    func offSell() -> Void {
        
    }
    
    func clear() -> Void {
        sale.offSell()
        purchase.refuseBuyIBM()
    }
}
