//
//  Catalogue.swift
//  stores
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation
import common

public struct Catalogue{
    public var categories: [ProductCategory]
    
    public init(categories: [ProductCategory]) {
        self.categories = categories
    }
}
