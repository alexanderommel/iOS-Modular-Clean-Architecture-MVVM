//
//  LineItem.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public struct LineItem: Identifiable, Hashable, Codable{
    public var id: String
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
    public init(id: String, product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
