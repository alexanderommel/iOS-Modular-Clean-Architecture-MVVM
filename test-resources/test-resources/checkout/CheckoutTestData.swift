//
//  CheckoutTestData.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
import api


public let s1 = stors[0]


public let shopping_carts = [
    ShoppingCart( items: [
        LineItem(id: "1", product: products1[0], quantity: 2),
        LineItem(id: "2", product: products1[1], quantity: 1)
    ]),
    ShoppingCart( items: [LineItem(id: "1", product: products2[0], quantity: 2)])
]

let longitude = -78.480943
let latitude = -0.176567

public let card1 = PaymentCard(id: "", remoteId: "1", lastFourDigits: "8445", bank: "Internacional", expirationMonth: 3, expirationYear: 27)

public let checkout1 = Checkout(id: "1",
                                shoppingCart: shopping_carts[0],
                                store: s1,
                                requestUtensils: true,
                                deliveryLocation: Place(address: "Quito Av. Naciones Unidas y Shyris", latitude: "-0.176567", longitude: "-78.480943"),
                                paymenthMetod: PaymentMethod.DEBIT_CARD, paymentCard: card1, userId: test_user.id)


public let checkouts_data = [checkout1]
