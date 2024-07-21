//
//  ShoppingCart.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 11/6/24.
//

import Foundation

public class ShoppingCartDto{
    public let storeId: Int
    public let items: [LineItemDto]
    
    public init(storeId: Int, items: [LineItemDto]) {
        self.storeId = storeId
        self.items = items
    }
}
