//
//  Store.swift
//  stores
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation
import common

public struct Store: Hashable, Codable, Identifiable{
    
    public var id: Int
    var name: String
    var deliveryTime: String
    var deliveryFee: String
    var storeImage: String
    var rating: Double
    var distance: String
    var location: Location
    
    public init(id: Int, name: String, deliveryTime: String, deliveryFee: String, storeImage: String, rating: Double, distance: String, location: Location) {
        self.id = id
        self.name = name
        self.deliveryTime = deliveryTime
        self.deliveryFee = deliveryFee
        self.storeImage = storeImage
        self.rating = rating
        self.distance = distance
        self.location = location
    }
    
}
