//
//  LineItem.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import common
import stores

public struct LineItem{
    public var product: Product
    public var quantity: Int
    public var total_amount: Money{
        get{
            let individualPrice = NSDecimalNumber(decimal: product.price.amount)
            let quantityNSD = NSDecimalNumber(decimal: Decimal(quantity))
            let nsdec = individualPrice.multiplying(by:quantityNSD)
            return Money(amount: nsdec.decimalValue, currency: .USD)
        }
    }
    public init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }
}
