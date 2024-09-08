//
//  Money.swift
//  common
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation

public struct Money: Codable, Hashable {
    
    public enum Currency: String, Codable {
      case USD, EUR, GBP, CNY // supported currencies here
    }
    
    public var amount: Decimal
    public var currency: Currency
    public var formatedAmount: String{
        get{
            return "$\(amount)"
        }
    }
    
    public init(amount: Decimal, currency: Currency) {
        self.amount = amount
        self.currency = currency
    }
    
    public init(){
        self.amount = Decimal.zero
        self.currency = .USD
    }
    
    public mutating func addAndUpdate(plus: Money){
        let adding = NSDecimalNumber(decimal: plus.amount)
        let current = NSDecimalNumber(decimal: amount)
        let updated = current.adding(adding)
        self.amount = updated.decimalValue
    }
    
    public mutating func multiplyAndUpdate(factor: Money){
        let multiplying = NSDecimalNumber(decimal: factor.amount)
        let current = NSDecimalNumber(decimal: amount)
        let updated = current.multiplying(by: multiplying)
        self.amount = updated.decimalValue
    }
    
}
