//
//  CheckoutDto.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import common


public class CheckoutDto{
    public var id: String
    public let storeId: Int
    public var paymentMethod: PaymentMethod
    public var note: String?
    public var shoppingCart: ShoppingCartDto
    public var requestUtensils: Bool
    public var lastTotalValue: String
    public let userId: String
    
    public init(id: String, storeId: Int, paymentMethod: PaymentMethod, note: String?, shoppingCart: ShoppingCartDto, requestUtensils: Bool, lastTotalValue: String, userId: String) {
        self.id = id
        self.storeId = storeId
        self.paymentMethod = paymentMethod
        self.note = note
        self.shoppingCart = shoppingCart
        self.requestUtensils = requestUtensils
        self.lastTotalValue = lastTotalValue
        self.userId = userId
    }
    
}
