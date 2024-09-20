//
//  Order.swift
//  domain
//
//  Created by Rommel Valdiviezo on 19/9/24.
//

//
//  Order.swift
//  orders
//
//  Created by Rommel Valdiviezo on 12/9/24.
//

import Foundation


public class Order{
    public let id: String
    public let remoteId: String
    public let payment_token: String
    public let delivey_pin: String
    public let checkout: Checkout
    public var state: OrderState
    
    public init(id: String, remoteId: String, payment_token: String, delivey_pin: String, checkout: Checkout, state: OrderState) {
        self.id = id
        self.remoteId = remoteId
        self.payment_token = payment_token
        self.delivey_pin = delivey_pin
        self.checkout = checkout
        self.state = state
    }
    
}
