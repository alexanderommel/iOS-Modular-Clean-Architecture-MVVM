//
//  CheckoutApiInteractorImpl.swift
//  checkout
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import api
import domain
import Combine

public class CheckoutApiInteractorImpl: CheckoutApiInteractor{
	
	public func addLineItem(lineItem: api.LineItemDto, storeId: Int) async -> api.UseCaseResponse<Bool> {
		return await add_item_uc.invoke(lineItem: lineItem, storeId: storeId)
	}
	

	 
	private let add_item_uc: AddLineItemUseCase
	
	public init(storeApi: StoresApiInteractor, userApi: UserApiInteractor, checkoutLocalRepo: CheckoutLocalRepository){
		self.add_item_uc = AddLineItemUseCase(localRepo: checkoutLocalRepo, userApi: userApi, storesApi: storeApi)
	}
	
}

