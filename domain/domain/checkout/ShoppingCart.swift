//
//  ShoppingCart.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public struct ShoppingCart: Hashable, Codable{
    public var items: [LineItem]
    public var total_amount: Money{
        get{
            var total = Money()
            for i in items{
                total.addAndUpdate(plus: i.total_amount)
            }
            return total
        }
    }
    public init( items: [LineItem]) {
        self.items = items
    }
}
