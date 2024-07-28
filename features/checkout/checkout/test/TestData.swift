//
//  TestData.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 25/7/24.
//

import Foundation
import stores
import common

public let s1 = stors[0]


public let shopping_carts = [
    ShoppingCart(id: ObjectIdentifier(String.self), items: [
        LineItem(id: ObjectIdentifier(String.self), product: products1[0], quantity: 2),
        LineItem(id: ObjectIdentifier(Int.self), product: products1[1], quantity: 1)
    ], store: stors[0]),
    ShoppingCart(id: ObjectIdentifier(Int.self), items: [LineItem(id: ObjectIdentifier(String.self), product: products2[0], quantity: 2)], store: stors[1])
]

let longitude = -78.480943
let latitude = -0.176567

public let card1 = PaymentCard(id: ObjectIdentifier(Int.self), remoteId: "1", lastFourDigits: "8445", bank: "Internacional", expirationMonth: 3, expirationYear: 27)

public let checkout1 = Checkout(id: ObjectIdentifier(Double.self),
                                shoppingCart: shopping_carts[0],
                                store: s1,
                                requestUtensils: true,
                                deliveryLocation: Location(address: "Quito Av. Naciones Unidas y Shyris", latitude: "-0.176567", longitude: "-78.480943"),
                                paymenthMetod: .DEBIT_CARD, paymentCard: card1)
