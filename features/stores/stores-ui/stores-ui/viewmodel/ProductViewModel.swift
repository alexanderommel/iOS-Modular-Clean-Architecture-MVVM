//
//  ProductViewModel.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 6/6/24.
//

import Foundation
import stores
import checkout
import common
import Combine

public class ProductViewModel: ObservableObject{
    
    @Published var errorLocalized: String?
    @Published var isLoading = true
    @Published var itemAdded = false
    public var api: CheckoutApiInteractor
    
    public init(api: CheckoutApiInteractor) {
        
        self.api = api
        
    }
    
    public func addLineItemToShoppingCart(store_id: Int, line_item: LineItemDto){
        
        self.isLoading = true
        self.errorLocalized = nil
        
        Task{
            let response = await api.addLineItem(lineItem: line_item, storeId: store_id)
            switch response{
            case .Error(let failure):
                DispatchQueue.main.async {
                    self.errorLocalized = failure.handleBusinessRuleFailure()
                    self.isLoading = false
                }
            case .Success(let data):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.itemAdded = true
                }
            @unknown default:
                _ = ""
            }
        }
    }
    
    
}
