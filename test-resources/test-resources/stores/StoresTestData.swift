//
//  StoresTestData.swift
//  test-resources
//
//  Created by Rommel Valdiviezo on 18/9/24.
//

import Foundation
import domain
 
public let stors: [Store] = [
    Store(id: 1, name: "Kfc 6 of December", deliveryTime: "30-40 min", deliveryFee: "2.50",
          storeImage: "test_resource_kfc_store",rating: 4.5, distance: "1.2km",
          location: Place(address: "6 de diciembre y veintimilla",latitude: "asd",longitude: ""),cartImage: ""),
    Store(id: 2, name: "Purple House Restaurant", deliveryTime: "20-30 min", deliveryFee: "2.35",
          storeImage: "test_resource_restaurant2",rating: 4.8, distance: "5 km",
          location: Place(address: "Nayon calle transversal Quito y Atahualpa",latitude: "asd",longitude: "92"),cartImage: "")
]

public let restaurant_categories: [StoreCategory] = [
    StoreCategory(id: 1, name: "Pizza",imageName: "test_resource_pizza_logo"),
    StoreCategory(id: 2, name: "Ice Cream",imageName: "test_resource_icecream_logo"),
    StoreCategory(id: 3, name: "Hamburguer",imageName: "test_resource_hamburguer_logo"),
    StoreCategory(id: 4, name: "Asian Food",imageName: "test_resource_japanesefood_logo"),
    StoreCategory(id: 5, name: "Chicken",imageName: "test_resource_chicken_logo"),
]

public let products1: [Product] = [
    Product(id: 1, name: "Monster Hamburguer", description:
            "La hamburguesa monstruo X1 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "test_resource_product1", price: Money(amount: 1.2, currency: Money.Currency.USD)),
    Product(id: 2, name: "Master's Hamburguer Gow", description:
            "La hamburguesa master X22222 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "test_resource_product1", price: Money(amount: 1.2, currency: Money.Currency.USD))
]

public let products2: [Product] = [
    Product(id: 3, name: "Funny Pizza", description:
            "La hamburguesa monstruo X1 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "product1_pizza", price: Money(amount: 15.2, currency: Money.Currency.USD)),
    Product(id: 4, name: "The Greatest's World Pizza", description:
            "La hamburguesa master X22222 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "product1_pizza", price: Money(amount: 24, currency: Money.Currency.USD))
]

public let products3: [Product] = [
    Product(id: 5, name: "Funny Pizza AA1", description:
            "La hamburguesa monstruo X1 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "product1_pizza", price: Money(amount: 15.2, currency: Money.Currency.USD)),
    Product(id: 6, name: "The Greatest's World Pizza BB2", description:
            "La hamburguesa master X22222 tiene los siguientes ingredientes: carne, queso, tomates pequeños, aceitinas, queso parmesano, y lechuga.",
            imageUrl: "product1_pizza", price: Money(amount: 24, currency: Money.Currency.USD))
]

public let product_categories: [ProductCategory] = [
    ProductCategory(id: 1, name: "Hamburguesas", products: products1),
    ProductCategory(id: 2, name: "Pizzas", products: products2),
    ProductCategory(id: 3, name: "Helados", products: products3)
]

public var catalog = Catalogue(categories: product_categories)
