//
//  CheckoutApiInteractorImpl.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import common
import stores
import Combine
import user

public class CheckoutApiInteractorImpl: CheckoutApiInteractor{
	public func updateCheckouts(checkouts: [CheckoutDto]) async -> common.UseCaseResponse<[Checkout]> {
		return await update_checkouts_uc.invoke(checkouts: checkouts)
	}
	
    
	private let add_item_uc: AddLineItemUseCase
	private let update_checkouts_uc: UpdateCheckoutsUseCase
	
	public init(storeApi: StoresApiInteractor, userApi: UserApiInteractor, checkoutLocalRepo: CheckoutLocalRepository){
		self.add_item_uc = AddLineItemUseCase(localRepo: checkoutLocalRepo, userApi: userApi, storesApi: storeApi)
		self.update_checkouts_uc = UpdateCheckoutsUseCase(localRepo: checkoutLocalRepo, userApi: userApi, storesApi: storeApi)
	}
    
    public func addLineItem(lineItem: LineItemDto, storeId: Int) async -> common.UseCaseResponse<Bool> {
		return await add_item_uc.invoke(lineItem: lineItem, storeId: storeId)
    }
    
    public func getMyShoppingCarts() -> AnyPublisher<[checkout.ShoppingCartDto], Never> {
        let publisher =  Empty<[ShoppingCartDto],Never>()
        let wrapper = publisher.eraseToAnyPublisher()
        return wrapper
    }
    
    
}
