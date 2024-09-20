//
//  ProductCategory.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public struct ProductCategory: Hashable, Codable, Identifiable{
    public var id: Int
    public var name: String
    public var products: [Product]
    
    public init(id: Int, name: String, products: [Product]) {
        self.id = id
        self.name = name
        self.products = products
    }
    
}
