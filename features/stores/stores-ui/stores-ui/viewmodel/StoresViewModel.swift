//
//  StoresViewModel.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import Foundation
import common
import stores
import checkout
import persistence
import Combine


public class StoresViewModel: ObservableObject{
    @Published var stores: [Store] = []
    @Published var checkouts: [checkout.Checkout] = []
    //@Published var shopping_carts: [ShoppingCartDto] = []
    @Published var errorLocalized: String = ""
    @Published var isLoading = false
    public var api: StoresApiInteractor
    public var checkout_api: CheckoutApiInteractor
    
    private var subscription: AnyCancellable?=nil
    
    public init(api: StoresApiInteractor, checkout_api: CheckoutApiInteractor) {
        self.api = api
        self.checkout_api = checkout_api
        //let publisher = checkout_api.getMyShoppingCarts()
        //subscription = publisher.sink(receiveValue: { carts in
        //    self.shopping_carts = carts
        //})
        
    }
    
    func upp(){
        self.isLoading = true
    }
    
    public func mappingCheckoutData(checkouts: [CheckoutDto]){
        self.isLoading = true
        self.errorLocalized = ""
        
        Task{
            
            //Here we check if the prices of the products have changed
            
            print("StoresViewModel: Fetching checkout shopping cart data from the server...")
            
            let res = await checkout_api.updateCheckouts(checkouts: checkouts)
            switch res{
            case .Error(let failure):
                DispatchQueue.main.async {
                    print("Error failure...")
                    self.isLoading = false
                    self.errorLocalized = failure.handleBusinessRuleFailure()
                }
            case .Success(let data):
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.checkouts = data
                }
                
            @unknown default:
                self.checkouts = []
            }
            
        }
    }
    
    public func fetchStoresData(){
        
        self.isLoading = true
        self.errorLocalized = ""
        
        Task{
            print("Fetching stores...")
            
            let response = await api.getStores()
            print("Stores retrieved")
            switch response{
            case .Error(let failure):
                DispatchQueue.main.async {
                    print("Error failure...")
                    self.isLoading = false
                    self.errorLocalized = failure.handleBusinessRuleFailure()
                }
                
            case .Success(let data):
                DispatchQueue.main.async {
                    print(Thread.current.isMainThread)
                    print("Success")
                    self.isLoading = false
                    self.stores = data
                    print(self.stores.count.description)
                }
                
            @unknown default:
                self.stores = []
            }
        }
    }
    
    
}
