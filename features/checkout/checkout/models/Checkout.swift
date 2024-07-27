//
//  Checkout.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import common
import stores


public struct Checkout: Identifiable{
    public var id: ObjectIdentifier
    public var shoppingCart: ShoppingCart
    public var store: Store
    public var requestUtensils: Bool
    public var note: String?
    public var deliveryLocation: Location
    public var deliveryInstructions: String?
    public var paymenthMetod: PaymentMethod
    public var paymentCard: PaymentCard?
    
    public init(id: ObjectIdentifier, shoppingCart: ShoppingCart, store: Store, requestUtensils: Bool, note: String? = nil, deliveryLocation: Location, deliveryInstructions: String? = nil, paymenthMetod: PaymentMethod, paymentCard: PaymentCard? = nil) {
        self.id = id
        self.shoppingCart = shoppingCart
        self.store = store
        self.requestUtensils = requestUtensils
        self.note = note
        self.deliveryLocation = deliveryLocation
        self.deliveryInstructions = deliveryInstructions
        self.paymenthMetod = paymenthMetod
        self.paymentCard = paymentCard
    }
    
}
