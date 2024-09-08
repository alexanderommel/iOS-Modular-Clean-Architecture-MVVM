//
//  CheckoutDomainMapper.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 19/8/24.
//

import Foundation
import checkout
import CoreData
import common

public class CheckoutDomainMapper{
    public init(){
        
    }
    
    
    public func mapToDomainModel(entity: Checkout) -> checkout.CheckoutDto{
        
        var paymentMethod = PaymentMethod.CASH
        
        if let pm = entity.payment_method{
            if pm == "CASH"{
                paymentMethod = PaymentMethod.CASH
            }
            if pm == "DEBIT_CARD"{
                paymentMethod = PaymentMethod.DEBIT_CARD
            }
        }
        
        let lastTotalValue = "100.0"
        
        var items: [LineItemDto] = []
        
        
        if let its = entity.shopping_cart as? Set<LineItem>{
            let itemsList = Array(its)
            for item in itemsList {
                let itemDto = LineItemDto(productId: Int(item.product_id), quantity: Int(item.quantity))
                itemDto.id=item.objectID.uriRepresentation().absoluteString
                items.append(itemDto)
            }
        }
        
        let shoppingCartDto = ShoppingCartDto(storeId: Int(entity.store_id), items: items)
        
        
        let dto = CheckoutDto(id: entity.objectID.uriRepresentation().absoluteString, storeId: Int(entity.store_id), paymentMethod: paymentMethod, note: entity.note, shoppingCart: shoppingCartDto, requestUtensils: entity.request_utensils, lastTotalValue: lastTotalValue, userId: entity.user_id!)
        
        return dto
        
    }
    
    public func mapLineItemToEntity(domain: checkout.LineItemDto, entity: LineItem?, context: NSManagedObjectContext) -> LineItem{
        
        var item = LineItem(context: context)
        if let itt = entity {
            item = itt
        }
        item.product_id = Int32(domain.productId)
        item.quantity = Int32(domain.quantity)
        return item
        
    }
    
    public func mapToEntityModel(domain: checkout.CheckoutDto, entity: Checkout?, context: NSManagedObjectContext) -> Checkout{
        
        
        var checkout: Checkout
        
        if entity != nil {
            checkout = entity!
        }else{
            checkout = Checkout(context: context)
        }
        
        var paymentMethod = "CASH"
        if domain.paymentMethod == .CASH {
            paymentMethod = "CASH"
        }
        if domain.paymentMethod == .DEBIT_CARD {
            paymentMethod = "DEBIT_CARD"
        }
        
        if let shoppingcart = entity?.shopping_cart as? Set<LineItem>{
            let storedLineItems = Array(shoppingcart)
            
            print("CheckoutDomainMapper: This entity has already \(storedLineItems) line items stored.")
            
            for item in domain.shoppingCart.items {
                
                
                print("\tItem: with id \(item.id) and product id of \(item.productId) with quantity \(item.quantity)")
                
                
                var exists = false
                var lineItem: LineItem?=nil
                for storedLineItem in storedLineItems{
                    print("Comparing agains the stored line item with id \(storedLineItem.objectID.uriRepresentation().absoluteString)")
                    if storedLineItem.objectID.uriRepresentation().absoluteString == item.id {
                        lineItem = storedLineItem
                        exists = true
                        break
                    }
                }
                var finalLineItem = mapLineItemToEntity(domain: item, entity: lineItem, context: context)
                if !exists {
                    print("This item doesn't exists in the database")
                    checkout.addToShopping_cart(finalLineItem)
                }else{
                    print("This item already exists in the database")
                }
            }
        }else{
            
            print("CheckoutDomainMapper: Mapping a new checkout in database to entity.")
            
            for item in domain.shoppingCart.items {
                let finalItem = mapLineItemToEntity(domain: item, entity: nil, context: context)
                checkout.addToShopping_cart(finalItem)
            }
            
        }
        
        
        checkout.note = domain.note
        checkout.payment_method = paymentMethod
        checkout.request_utensils = domain.requestUtensils
        checkout.store_id = Int32(domain.storeId)
        checkout.last_total_value = domain.lastTotalValue
        checkout.user_id = domain.userId
        
        print("CheckoutDomainMapper: finish mapping to ENTITY")
        
        return checkout
        
    }
    
}
