//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/11/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]?
    
    init(orders : [Order]?) {
        if let orders = orders {
            self.ordersViewModel = orders.map(OrderViewModel.init)
        }
    }
}

extension OrderListViewModel {
    
    func getOrderViewModel(at index: Int) -> OrderViewModel? {
        return self.ordersViewModel?[index]
    }
    
}

class OrderViewModel {
    let order: Order
    init(order : Order) {
        self.order = order
    }
}

extension OrderViewModel {
    
    var name: String {
        return self.order.name ?? ""
    }
    
    var email: String {
        return self.order.email ?? ""
    }
    
    var type: String {
        return self.order.type?.rawValue.capitalized ?? ""
    }
    
    var size: String {
        return self.order.size?.rawValue.capitalized ?? ""
    }
    
}
