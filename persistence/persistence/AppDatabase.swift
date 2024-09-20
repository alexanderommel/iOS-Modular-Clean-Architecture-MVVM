//
//  AppDatabase.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 17/8/24.
//

import Foundation
import CoreData
import api
import domain
import test_resources

public struct AppDatabase {
    
    public static let shared = AppDatabase()

    public static var preview: AppDatabase = {
        let result = AppDatabase(inMemory: true)
        let viewContext = result.container.viewContext
        
        
        let defaultUser = test_user
        
        let checkout = Checkout(id: "", shoppingCart: ShoppingCart(items: []), store: stors[0], requestUtensils: false, deliveryLocation: stors[0].location, paymenthMetod: PaymentMethod.CASH, userId: test_user.id)
        
        let entity = CheckoutEntity(context: viewContext)
        entity.update(from: checkout)
        do {
            try viewContext.save()
        } catch {
            print("error when saving checkout in preview db")
        }
        
        return result
    }()

    public let container: NSPersistentContainer

    public init(inMemory: Bool = false) {
        let model_url = Bundle.myFramework.url(forResource: "app_data_model", withExtension: "momd")!
        let model = NSManagedObjectModel(contentsOf: model_url)!
        container = NSPersistentContainer(name: "app_data_model", managedObjectModel: model)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error on core data \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
