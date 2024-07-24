//
//  ShoppingCart.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 23/7/24.
//

import Foundation
import stores

public struct ShoppingCart: Identifiable{
    public var id: ObjectIdentifier
    public var items: [LineItem]
    public var store: Store
    public init(id: ObjectIdentifier, items: [LineItem], store: Store) {
        self.id = id
        self.items = items
        self.store = store
    }
}
