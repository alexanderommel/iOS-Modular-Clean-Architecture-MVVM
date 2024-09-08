//
//  CheckoutLocalRepositoryImpl.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import checkout
import CoreData

public class CheckoutLocalRepositoryImpl: CheckoutLocalRepository {
    
    let context: NSManagedObjectContext
    let mapper: CheckoutDomainMapper
    
    public init(context: NSManagedObjectContext) {
        self.context = context
        self.mapper = CheckoutDomainMapper()
    }
    
    public func insertCheckout(c: checkout.CheckoutDto, userId: String) async -> checkout.CheckoutDto {
        
        context.performAndWait(){
            
            do {
                
                let entity = mapper.mapToEntityModel(domain: c, entity: nil, context: context)
                
                print("CheckoutLocalRepositoryImpl: Inserting a checkout with user id of \(entity.user_id!)")
                print("CheckoutLocalRepositoryImpl: id before saving: \(entity.objectID)")
                
                try context.save()
                
                print("CheckoutLocalRepositoryImpl: id after saving: \(entity.objectID)")
                print("CheckoutLocalRepositoryImpl: Checkout has now a shopping cart with \(String(describing: entity.shopping_cart?.count)) items")
                
                c.id = entity.objectID.uriRepresentation().absoluteString
                
                
            } catch  {
                print("CheckoutLocalRepositoryImpl: Failed to save the context:", error.localizedDescription)
            }
            
            
        }
        
        return c
        
    }
    
    public func updateCheckout(c: checkout.CheckoutDto, userId: String) async -> checkout.CheckoutDto {
        
        context.performAndWait {
            do {
                let objectID = context.persistentStoreCoordinator!.managedObjectID(forURIRepresentation: URL(string: c.id)!)!
                
                let entity: Checkout = context.object(with: objectID) as! Checkout
                
                let final = mapper.mapToEntityModel(domain: c, entity: entity, context: context)
                
                print("CheckoutLocalRepositoryImpl: Updating a checkout with user id of \(final.user_id!)")
                print("CheckoutLocalRepositoryImpl: Checkout has now a shopping cart with \(String(describing: final.shopping_cart?.count)) items")
                
                try context.save()
                
                print("CheckoutLocalRepositoryImpl: Checkout updated with success")

                
            } catch{
                print("CheckoutLocalRepositoryImpl: Failed to update the context:", error.localizedDescription)
            }
        }

        return c
        
    }
    
    public func getAllCheckoutsByUserId(userId: String) async -> [checkout.CheckoutDto] {
        
        let fetchRequest: NSFetchRequest<Checkout> = Checkout.fetchRequest()
        do {
            let checkouts = try context.fetch(fetchRequest)
            
            print("CheckoutLocalRepositoryImpl: Found \(checkouts.count) checkouts in the device.")
            
            var response: [checkout.CheckoutDto] = []
            for c in checkouts{
                
                if let checkout_user_id = c.user_id {
                    if checkout_user_id == userId {
                        let domain_model = mapper.mapToDomainModel(entity: c)
                        response.append(domain_model)
                    }
                }

            }
            
            print("CheckoutLocalRepositoryImpl: Found \(response.count) checkouts in the device for the user with id \(userId)")
            
            return response
        } catch {
            print("Failed to fetch users: \(error.localizedDescription)")
            return []
        }
        
    }
    
    
}
