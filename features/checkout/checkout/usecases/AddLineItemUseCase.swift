//
//  AddLineItemUseCase.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 17/8/24.
//

import Foundation
import user
import common
import stores

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
        
        let checkouts = await localRepo.getAllCheckoutsByUserId(userId: user.id)
        
        print("AddLiteItemUseCase: There's \(checkouts.count) checkouts on the database for user \(user.id)")
        
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
    
        
        var checkout: CheckoutDto?=nil
        // check if already exists
        var exists = false
        for c in checkouts{
            if c.storeId == storeId{
                exists = true
                checkout = c
                checkout?.shoppingCart.items.append(lineItem)
                break
            }
        }
        
        if !exists {
            
            print("AddLiteItemUseCase: Creating a new checkout")
            
            checkout = CheckoutDto(id: "", storeId: storeId, paymentMethod: .CASH, note: nil, shoppingCart: ShoppingCartDto(storeId: storeId, items: [LineItemDto(productId: lineItem.productId, quantity: lineItem.quantity)]), requestUtensils: false, lastTotalValue: "", userId: user.id)
            
            let res = await localRepo.insertCheckout(c: checkout!, userId: user.id)
            

        }else{
            
            print("AddLiteItemUseCase: Updating the checkout")
            
            let res = await localRepo.updateCheckout(c: checkout!, userId: user.id)
        }
        
        print("AddLiteItemUseCase: Success")
        
        return UseCaseResponse.Success(data: true)
        
        
        
    }
    
}
