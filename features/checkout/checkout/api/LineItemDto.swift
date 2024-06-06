//
//  LineItemDto.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation

// Used to transfer data between layers
public class LineItemDto{
    public let productId: Int
    public let quantity: Int
    
    public init(productId: Int, quantity: Int) {
        self.productId = productId
        self.quantity = quantity
    }
}
