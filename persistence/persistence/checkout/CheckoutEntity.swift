//
//  CheckoutEntity.swift
//  persistence
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import CoreData
import domain

/**

@objc(CheckoutEntity)
public class CheckoutEntity: NSManagedObject {
    @NSManaged public var id: String
    @NSManaged public var userId: String
    @NSManaged public var store: String // Assuming StoreEntity is another NSManagedObject
    @NSManaged public var deliveryLocation: String // Assuming LocationEntity is another NSManagedObject
    @NSManaged public var requestUtensils: Bool
    @NSManaged public var note: String?
    @NSManaged public var deliveryInstructions: String?
    @NSManaged public var paymentCard: String? // Assuming PaymentCardEntity is another NSManagedObject
    @NSManaged public var shoppingCart: String // Assuming JSON string representation
    @NSManaged public var paymenthMetod: String
    @NSManaged public var linkedToOrder: Bool
}
 **/

public extension CheckoutEntity {
    func update(from checkout: Checkout) {
        
        let encoder = JSONEncoder()
        
        var store: String?=nil
        var shoppingCart: String?=nil
        var deliveryLocation: String?=nil
        
        do{
            print("Encoding store to json")
            let json1 = try encoder.encode(checkout.store)
            store = String(data: json1, encoding: .utf8)
            print("Encoding shopping cart to json")
            let json2 = try encoder.encode(checkout.shoppingCart)
            shoppingCart = String(data: json2, encoding: .utf8)
            let json3 = try encoder.encode(checkout.deliveryLocation)
            deliveryLocation = String(data: json3, encoding: .utf8)
        }catch{
            
        }
        
        var paymentMethod = "CASH"
        
        if checkout.paymenthMetod == PaymentMethod.DEBIT_CARD{
            paymentMethod = "DEBIT_CARD"
        }
        
        self.id = checkout.id
        self.userId = checkout.userId
        self.store = store
        self.deliveryLocation = deliveryLocation
        self.requestUtensils = checkout.requestUtensils
        self.note = checkout.note
        self.deliveryInstructions = checkout.deliveryInstructions
        self.paymenthMetod = paymentMethod
        self.shoppingCart = shoppingCart
    }

    func toDomain() -> Checkout {
        
        let decoder = JSONDecoder()
        var store: Store?=nil
        var shoppingCart: ShoppingCart?=nil
        var deliveryLocation: Place?=nil
        
        do{
            let data1 = self.store?.data(using: .utf8)
            store = try decoder.decode(Store.self, from: data1!)
            let data2 = self.shoppingCart?.data(using: .utf8)
            shoppingCart = try decoder.decode(ShoppingCart.self, from: data2!)
            let data3 = self.deliveryLocation?.data(using: .utf8)
            deliveryLocation = try decoder.decode(Place.self, from: data3!)
        }catch{
            
        }
        
        var paymentMethod = PaymentMethod.CASH
        
        if let pm = self.paymenthMetod{
            if pm == "CASH"{
                paymentMethod = PaymentMethod.CASH
            }
            if pm == "DEBIT_CARD"{
                paymentMethod = PaymentMethod.DEBIT_CARD
            }
        }
        
        var ans =  Checkout(id: self.id!, shoppingCart: shoppingCart!, store: store!, requestUtensils: self.requestUtensils, deliveryLocation: deliveryLocation!, paymenthMetod: paymentMethod, userId: self.userId!)
        
        ans.linkedToOrder = self.linkedToOrder
        ans.deliveryInstructions = self.deliveryLocation
        ans.note = self.note
        
        
        return ans
    }
}

