//
//  TestData.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import Foundation
import stores

public let s1 = stors[0]


public let shopping_carts = [
    ShoppingCart(id: ObjectIdentifier(String.self), items: [
        LineItem(id: ObjectIdentifier(String.self), product: products1[0], quantity: 2),
        LineItem(id: ObjectIdentifier(Int.self), product: products1[1], quantity: 1)
    ], store: stors[0]),
    ShoppingCart(id: ObjectIdentifier(Int.self), items: [LineItem(id: ObjectIdentifier(String.self), product: products2[0], quantity: 2)], store: stors[1])
]
