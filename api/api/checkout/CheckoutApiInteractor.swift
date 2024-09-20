//
//  CheckoutApiInteractor.swift
//  api
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
import Combine

// The appropiate shopping cart is found based on the storeId
public protocol CheckoutApiInteractor{
    func addLineItem(lineItem: LineItemDto, storeId: Int) async -> UseCaseResponse<Bool>
    
}

