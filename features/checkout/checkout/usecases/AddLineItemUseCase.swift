//
//  AddLineItemUseCase.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 17/8/24.
//

import Foundation
import api
import domain

class AddLineItemUseCase{
    
    let localRepo: CheckoutLocalRepository
    let storesApi: StoresApiInteractor
    let userApi: UserApiInteractor
    
    
    init(localRepo: CheckoutLocalRepository, userApi: UserApiInteractor, storesApi: StoresApiInteractor) {
        self.localRepo = localRepo
        self.userApi = userApi
        self.storesApi = storesApi
    }
    
    func invoke(lineItem: LineItemDto, storeId: Int) async -> UseCaseResponse<Bool>{
        
        print("AddLiteItemUseCase: Adding an item of product id \(lineItem.productId) with storeId \(storeId) to the shopping cart.")
        
        print("Adding \(lineItem.quantity) items")
        
        let auth = await userApi.isAuthenticated()
        if !auth {
            return UseCaseResponse.Error(failure: .notAuthorized)
        }
        
        guard let deliveryloc = await userApi.getUserPreferedDeliveryLocation() else{
            return UseCaseResponse.Error(failure: .locationNotFound)
        }
        
        let user = await userApi.getAuthenticatedUser()
        
        let checkouts =  localRepo.getAll(userId: user.id)
        
        print("AddLiteItemUseCase: There's \(String(describing: checkouts.count)) checkouts on the database for user \(user.id)")
        
        let storeRes = await storesApi.getStoreById(id: storeId)
        let productRes = await storesApi.getProductById(id: lineItem.productId)
        
        var store: Store?=nil
        var product: Product?=nil
        
        if case .Error(let failure) = storeRes {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = storeRes {
            store = data
        }

        if case .Error(let failure) = productRes {
            return UseCaseResponse.Error(failure: failure)
        }
        if case .Success(let data) = productRes {
            product = data
        }
    
        
        var checkout: Checkout?=nil
        // check if already exists
        var exists = false
        print("Checking if there's a checkout for store \(storeId)")
        for c in checkouts{
            print("Found a checkout with userid '\(c.userId)' and storeId '\(c.store.id)'")
            if c.store.id == storeId{
                exists = true
                checkout = c
                checkout!.shoppingCart.items.append(LineItem(id: "", product: product!, quantity: lineItem.quantity))
                break
            }
        }
        
        if !exists {
            
            print("AddLiteItemUseCase: Creating a new checkout")
            
            let shoppingCart = ShoppingCart(items: [LineItem(id: "", product: product!, quantity: lineItem.quantity)])
            
            checkout = Checkout(id: "", shoppingCart: shoppingCart, store: store!, requestUtensils: false, deliveryLocation: deliveryloc, paymenthMetod: PaymentMethod.CASH, userId: user.id)
            
            _ =  localRepo.insertCheckout(checkout!, userId: user.id)
            

        }else{
            
            print("AddLiteItemUseCase: Updating the checkout")
            
            _ = localRepo.updateCheckout(checkout!, userId: user.id)
        }
        
        print("AddLiteItemUseCase: Success")
        
        return UseCaseResponse.Success(data: true)
        
        
        
    }
    
}
