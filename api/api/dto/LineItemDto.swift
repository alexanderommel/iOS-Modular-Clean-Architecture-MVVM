//
//  LineItemDto.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain

// Used to transfer data between layers
public class LineItemDto{
    public var id: String=""
    public let productId: Int
    public var quantity: Int
    
    public init(productId: Int, quantity: Int) {
        self.productId = productId
        self.quantity = quantity
    }
}
