//
//  CheckoutLocalRepository.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
import Combine

public protocol CheckoutLocalRepository {
    func insertCheckout(_ checkout: Checkout, userId: String) -> Checkout
    func updateCheckout(_ checkout: Checkout, userId: String) -> Checkout
    func getAll(userId: String) -> [Checkout]
}
