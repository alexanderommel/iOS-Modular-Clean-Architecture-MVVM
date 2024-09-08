//
//  ShoppingCart.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import common
import stores

public struct ShoppingCart{
    public var items: [LineItem]
    public var store: Store
    public var total_amount: Money{
        get{
            var total = Money()
            for i in items{
                total.addAndUpdate(plus: i.total_amount)
            }
            return total
        }
    }
    public init( items: [LineItem], store: Store) {
        self.items = items
        self.store = store
    }
}
