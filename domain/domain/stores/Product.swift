//
//  Product.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public struct Product: Codable, Identifiable, Hashable{
    public var id: Int
    public var name: String
    public var description: String
    public var imageUrl: String
    public var price: Money
    
    public init(id: Int, name: String, description: String, imageUrl: String, price: Money) {
        self.id = id
        self.name = name
        self.description = description
        self.imageUrl = imageUrl
        self.price = price
    }
}
