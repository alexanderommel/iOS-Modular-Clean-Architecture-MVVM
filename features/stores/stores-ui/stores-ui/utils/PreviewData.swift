//
//  PreviewData.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 3/6/24.
//

import Foundation
import stores
import common


var stors: [Store] = [
    Store(id: 1, name: "Kfc 6 of December", deliveryTime: "30-40 min", deliveryFee: "2.50",
          storeImage: "test_resource_kfc_store",rating: 4.5, distance: "1.2km",
          location: Location(address: "6 de diciembre y veintimilla",latitude: "asd",longitude: "")),
    Store(id: 2, name: "Purple House Restaurant", deliveryTime: "20-30 min", deliveryFee: "2.35",
          storeImage: "test_resource_restaurant2",rating: 4.8, distance: "5 km",
          location: Location(address: "Nayon calle transversal Quito y Atahualpa",latitude: "asd",longitude: "92"))
]

var restaurant_categories: [StoreCategory] = [
    StoreCategory(id: 1, name: "Pizza",imageName: "test_resource_pizza_logo"),
    StoreCategory(id: 2, name: "Ice Cream",imageName: "test_resource_icecream_logo"),
    StoreCategory(id: 3, name: "Hamburguer",imageName: "test_resource_hamburguer_logo"),
    StoreCategory(id: 4, name: "Asian Food",imageName: "test_resource_japanesefood_logo"),
    StoreCategory(id: 5, name: "Chicken",imageName: "test_resource_chicken_logo"),
]
