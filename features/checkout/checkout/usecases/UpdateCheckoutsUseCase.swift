//
//  UpdateCheckoutsUseCase.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import user
import common
import stores

class UpdateCheckoutsUseCase{
    
    let localRepo: CheckoutLocalRepository
    let storesApi: StoresApiInteractor
    let userApi: UserApiInteractor
    
    
    init(localRepo: CheckoutLocalRepository, userApi: UserApiInteractor, storesApi: StoresApiInteractor) {
        self.localRepo = localRepo
        self.userApi = userApi
        self.storesApi = storesApi
    }
    
    func invoke(checkouts: [CheckoutDto]) async -> UseCaseResponse<[Checkout]>{
        
        print("UpdateCheckoutsUseCase: Invoke")
        
        let auth = await userApi.isAuthenticated()
        if !auth {
            return UseCaseResponse.Error(failure: .notAuthorized)
        }
        
        let user = await userApi.getAuthenticatedUser()
        
        guard let deliveryloc = await userApi.getUserPreferedDeliveryLocation() else{
            return UseCaseResponse.Error(failure: .locationNotFound)
        }
        
        var ans: [Checkout]=[]
        
        for c in checkouts{
            
            let storeRes = await storesApi.getStoreById(id: c.storeId)
            var store: Store?=nil
            if case .Error(let failure) = storeRes {
                return UseCaseResponse.Error(failure: failure)
            }
            if case .Success(let data) = storeRes {
                store = data
            }
            
            var domain_items: [LineItem] = []
            
            for l in c.shoppingCart.items{
                
                let productRes = await storesApi.getProductById(id: l.productId)
                var product: Product?=nil
                if case .Error(let failure) = productRes {
                    return UseCaseResponse.Error(failure: failure)
                }
                if case .Success(let data) = productRes {
                    product = data
                }
                
                domain_items.append(LineItem(id: l.id, product: product!, quantity: l.quantity))

            }
            
            var shopping_cart = ShoppingCart(items: domain_items, store: store!)
            
            var domain_checkout = Checkout(id: c.id, shoppingCart: shopping_cart, store: store!, requestUtensils: c.requestUtensils, deliveryLocation: deliveryloc, paymenthMetod: c.paymentMethod)
            
            ans.append(domain_checkout)
            
            
        }
        
        print("UpdateCheckoutsUseCase: Data retrieved (\(ans.count) items) with success")
        
        return UseCaseResponse.Success(data: ans)

        
    }
    
}
