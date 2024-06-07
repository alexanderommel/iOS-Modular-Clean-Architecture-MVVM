//
//  CheckoutApiInteractorFaker.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation
import checkout
import common

public class CheckoutApiInteractorFaker1: CheckoutApiInteractor{
    public func addLineItem(lineItem: checkout.LineItemDto, storeId: Int) async -> common.UseCaseResponse<Bool> {
        return UseCaseResponse.Success(data: true)
    }
    
    public init(){
        
    }
    
    
}


public class CheckoutApiInteractorFaker2: CheckoutApiInteractor{
    public func addLineItem(lineItem: checkout.LineItemDto, storeId: Int) async -> common.UseCaseResponse<Bool> {
        return UseCaseResponse.Error(failure: BusinessRuleFailure.remoteDataChanged)
    }
    public init(){
        
    }
    
}
