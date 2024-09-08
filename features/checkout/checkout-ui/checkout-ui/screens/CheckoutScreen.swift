//
//  CheckoutScreen.swift
//  checkout-ui
//
//  Created by Rommel Valdiviezo on 27/7/24.
//

import SwiftUI
import checkout
import MapKit
import routing
import core_ios

public struct CheckoutScreen: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    let c: Checkout
    
    public init(c: Checkout) {
        print("CheckoutScreen: Init")
        self.c = c
    }
    
    public var body: some View {
        VStack(alignment: .leading){
            
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
                
                HStack{
                    Text("Subtotal")
                        .font(.title3)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text(c.shoppingCart.total_amount.formatedAmount)
                        .font(.title3)
                }.listRowSeparator(.hidden)
                
                HStack{
                    Text("Delivery Fee")
                        .font(.title3)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("$\(c.store.deliveryFee)")
                        .font(.title3)
                }.listRowSeparator(.hidden)
                
                HStack{
                    Text("Total")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Spacer()
                    Text("$\(total_amount())")
                        .font(.title2)
                        .fontWeight(.semibold)
                }.listRowSeparator(.hidden)
                
                Text("If you are not in the delivery location in the time of the delivery, the courier will drop the package here even if you're not there.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
                    .padding(.vertical, 4)
                    .listRowSeparator(.hidden)
                
                
            }.listStyle(.inset)
                .listRowSeparator(.hidden)
            
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
        .navigationTitle(c.store.name)
    }
    
    func total_amount() -> String {
        let fee = Decimal(string: c.store.deliveryFee)!
        let subtotal = c.shoppingCart.total_amount.amount
        let total = subtotal + fee
        return total.description
    }
    
    func payment_name() -> String{
        var paymenth_name = "Cash"
        if c.paymentCard != nil {
            paymenth_name = c.paymentCard!.name
        }else{
            return "(Payment) \(paymenth_name)"
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
    @StateObject var router = NavigationRouter()
    return CheckoutScreen(c: checkout1)
        .environmentObject(router)
}
