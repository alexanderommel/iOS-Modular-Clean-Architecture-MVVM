//
//  Catalogue.swift
//  domain
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation

public struct Catalogue{
    public var categories: [ProductCategory]
    
    public init(categories: [ProductCategory]) {
        self.categories = categories
    }
}
