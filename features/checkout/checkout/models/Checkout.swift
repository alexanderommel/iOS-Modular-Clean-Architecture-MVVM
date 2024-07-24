//
//  Checkout.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import stores


public struct Checkout: Identifiable{
    public var id: ObjectIdentifier
    public var shoppingCart: ShoppingCart
    public var store: Store
}
