//
//  RestaurantCategory.swift
//  stores
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation

public struct StoreCategory: Hashable, Codable, Identifiable{
    public var id: Int
    public var name: String
    public var imageName: String
    
    public init(id: Int, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
}
