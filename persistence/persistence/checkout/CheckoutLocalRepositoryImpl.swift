//
//  CheckoutLocalRepositoryImpl.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 18/8/24.
//

import Foundation
import api
import domain
import Combine
import CoreData

public class CheckoutLocalRepositoryImpl: CheckoutLocalRepository {
    
    private let context: NSManagedObjectContext
    
    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    public func insertCheckout(_ checkout: Checkout, userId: String) -> Checkout{
        let entity = CheckoutEntity(context: self.context)
        entity.update(from: checkout)
        print("CheckoutLocalRepositoryImpl: Inserting checkout...")
        self.context.performAndWait{
            do {
                try self.context.save()
                print("CheckoutLocalRepositoryImpl: Checkout inserted in db with success.")
            } catch {
                print("CheckoutLocalRepositoryImpl: Failed to save the context:", error.localizedDescription)
            }
        }
        return checkout
    }

    public func updateCheckout(_ checkout: Checkout, userId: String) -> Checkout {
        let fetchRequest: NSFetchRequest<CheckoutEntity> = CheckoutEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", checkout.id)
        print("CheckoutLocalRepositoryImpl: Updating checkout...")
        self.context.performAndWait {
            do {
                let results = try self.context.fetch(fetchRequest)
                if let entity = results.first {
                    entity.update(from: checkout)
                    try self.context.save()
                    print("CheckoutLocalRepositoryImpl: Checkout updated with success")
                } else {
                }
            } catch {
                print("CheckoutLocalRepositoryImpl: Failed to update the context:", error.localizedDescription)
            }
        }
        return checkout
    }


   
    
    
    public func getAll(userId: String) -> [domain.Checkout] {
        let fetchRequest: NSFetchRequest<CheckoutEntity> = CheckoutEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId == %@", userId)
        
        var checkouts: [Checkout] = []
        
        do{
            let checks = try context.fetch(fetchRequest)
            for c in checks{
                checkouts.append(c.toDomain())
            }
            
        } catch{
            print("Failed to fetch: \(error)")
        }
        
        return checkouts
    }
    
}
