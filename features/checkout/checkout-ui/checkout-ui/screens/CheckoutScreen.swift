//
//  CheckoutScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 27/7/24.
//

import SwiftUI
import checkout
import MapKit
import core_ios

struct CheckoutScreen: View {
    
    let c: Checkout
    
    var body: some View {
        VStack(alignment: .leading){
            Text(c.store.name)
                .font(.title)
                .fontWeight(.semibold)
                .padding(20)
            
            List{
                
                MapView(locationCoordinate: CLLocationCoordinate2D(
                    latitude: Double(c.deliveryLocation.latitude)!,
                    longitude: Double(c.deliveryLocation.longitude)!))
                    .frame(height: 120)
                    .clipShape(.rect(cornerRadius: 12.0))
                    .padding(.horizontal, 20)
                    .padding(.top, 2)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                
                HStack{
                    Image(systemName: "map")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading){
                        Text(c.deliveryLocation.address)
                            .fontWeight(.semibold)
                        Text("Delivery address")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.blue)
                            .padding(.top, 0.35)
                    }.padding(.horizontal, 14)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }.padding(.top, 10)
                
                HStack{
                    Image(systemName: "creditcard")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading){
                       
                        
                        Text(payment_name())
                            .fontWeight(.semibold)
                        Text("Payment details")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.myPrimaryColor)
                            .padding(.top, 0.35)
                    }.padding(.horizontal, 14)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }.padding(.top, 10)
                
                HStack{
                    Image(systemName: "creditcard")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading){
                       
                        
                        Text(note())
                            .fontWeight(.semibold)
                        Text("Add delivery instructions")
                            .font(.headline)
                            .fontWeight(.regular)
                            .foregroundStyle(Color.gray)
                            .padding(.top, 0.35)
                    }.padding(.horizontal, 14)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.gray)
                }.padding(.top, 10)
                
                HStack{
                    Image(systemName: "clock.fill")
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading){

                        Text("Delivery time")
                            .font(.title2)
                            .fontWeight(.medium)
                    }.padding(.horizontal, 14)
                    Spacer()
                    Text(c.store.deliveryTime)
                        .font(.title3)
                        .fontWeight(.regular)
                    
                }.padding(.top, 10)
                    .listRowSeparator(.hidden)
                
                Rectangle()
                    .listRowInsets(EdgeInsets())
                    .frame(width: .infinity, height: 5)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                    .listRowSeparator(.hidden)
                
                Text("Order summary")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .listRowSeparator(.hidden)
                
                
                HStack{
                    Image(uiImage: loadImageFromAssets(name: c.store.storeImage))
                        .resizable()
                        .frame(width: 36, height: 36)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                    VStack(alignment: .leading){
                        Text(c.store.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        HStack{
                            Text("\(c.shoppingCart.items.count) items")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(Color.myText34Color)

                        }
                    }
                    .padding(.leading, 8)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.gray)
                }
                .padding(.top, 10)
                
                
            }.listStyle(.inset)
            
            Button{
                
            }label: {
                Text("Next")
                    .font(.body)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(20)
            }.padding(.horizontal,20)
            
            
        }
    }
    
    func payment_name() -> String{
        var paymenth_name = "Cash"
        if c.paymentCard != nil {
            paymenth_name = c.paymentCard!.name
        }
        return "(Card) \(paymenth_name)"
    }
    
    func note() -> String {
        var not = "Meet at my door"
        guard let k = c.note else {
            return not
        }
        not = k
        return not
    }
    
}



#Preview {
    return CheckoutScreen(c: checkout1)
}
