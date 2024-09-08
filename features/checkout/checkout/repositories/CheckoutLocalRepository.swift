//
//  CheckoutLocalRepository.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 17/8/24.
//

import Foundation
import common

public protocol CheckoutLocalRepository{
    func insertCheckout(c: CheckoutDto, userId: String) async -> CheckoutDto
    func updateCheckout(c: CheckoutDto, userId: String) async -> CheckoutDto
    func getAllCheckoutsByUserId(userId: String) async -> [CheckoutDto]
}

