//
//  CheckoutApiInteractor.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation
import common

// The appropiate shopping cart is found based on the storeId
public protocol CheckoutApiInteractor{
    func addLineItem(lineItem: LineItemDto, storeId: Int) async -> UseCaseResponse<Bool>
}
