//
//  CheckoutApiInteractorFaker.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 21/7/24.
//

import Foundation
import common
import Combine

/**

public class CheckoutApiInteractorFaker10: CheckoutApiInteractor{
    public func getMyShoppingCarts() -> AnyPublisher<[checkout.ShoppingCartDto], Never> {
        let shopping_cart1 = ShoppingCartDto(storeId: 1, items: [])
        let shopping_cart2 = ShoppingCartDto(storeId: 2, items: [])
        let publisher =  Just([shopping_cart1,shopping_cart2])
        let wrapper = publisher.eraseToAnyPublisher()
        return wrapper
    }
    
    public func addLineItem(lineItem: checkout.LineItemDto, storeId: Int) async -> common.UseCaseResponse<Bool> {
        return UseCaseResponse.Success(data: true)
    }
    
    public init(){
        
    }
    
}


public class CheckoutApiInteractorFaker20: CheckoutApiInteractor{
    public func getMyShoppingCarts() -> AnyPublisher<[checkout.ShoppingCartDto], Never> {
        let publisher =  Empty<[ShoppingCartDto],Never>()
        let wrapper = publisher.eraseToAnyPublisher()
        return wrapper
    }
    

    
    public func addLineItem(lineItem: checkout.LineItemDto, storeId: Int) async -> common.UseCaseResponse<Bool> {
        return UseCaseResponse.Error(failure: BusinessRuleFailure.remoteDataChanged)
    }
    public init(){
        
    }
    
}
 
 */


let line_items_fake = [
    LineItemDto(productId: 1, quantity: 5),
    LineItemDto(productId: 1, quantity: 5),
    LineItemDto(productId: 1, quantity: 5),
]
