//
//  ShoppingCartDto.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain

public class ShoppingCartDto{
    public let storeId: Int
    public var items: [LineItemDto]
    
    public init(storeId: Int, items: [LineItemDto]) {
        self.storeId = storeId
        self.items = items
    }
}
