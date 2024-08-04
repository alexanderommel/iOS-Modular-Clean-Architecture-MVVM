//
//  Location.swift
//  common
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation

public struct Place: Codable, Hashable{
    public var address: String
    public var latitude: String
    public var longitude: String
    
    public init(address: String, latitude: String, longitude: String) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
