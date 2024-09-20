//
//  CheckoutApiInteractorFaker.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import api
import Combine
import domain

public class CheckoutApiInteractorFaker: CheckoutApiInteractor{
    
    public init(){}
    
    public func addLineItem(lineItem: api.LineItemDto, storeId: Int) async -> api.UseCaseResponse<Bool> {
        return UseCaseResponse.Success(data: true)
    }
    
    public func getAll() async -> AnyPublisher<[domain.Checkout], Never> {
        return Empty(completeImmediately: true).eraseToAnyPublisher()
    }
    
    
}
