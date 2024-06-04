//
//  Category.swift
//  stores
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation
import common

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
