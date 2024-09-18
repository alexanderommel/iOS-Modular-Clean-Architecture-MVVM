//
//  CreateOrderScreen.swift
//  orders-ui
//
//  Created by Rommel Valdiviezo on 12/9/24.
//

import SwiftUI
import persistence
import networking
import CoreData
import checkout
import user
import common
import routing
import ui_dandelion

public struct CreateOrderScreen: View {
    
    private let checkout: checkout.Checkout
    @State private var isRotating = 0.0
    @State var progress: Double = 0
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    
    public init(checkout: checkout.Checkout) {
        self.checkout = checkout
    }
    
    
    public var body: some View {
        
        
        VStack{
            Text("")
            ZStack {
                Image(uiImage: loadImageFromAssets(name: "cargo-truck"))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    
            }
            .padding(.top, 10)
            
            
            Spacer()
            
            
            VStack(alignment: .leading){
                Text("Hand tight..")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 20)
                                
                
                VStack(alignment: .leading, spacing: 16){
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                        VStack(alignment: .leading){
                            Text(checkout.deliveryLocation.address)
                                .fontWeight(.semibold)
                            Text("Meet at my door")
                        }
                        .padding(.horizontal, 8)
                        Spacer()
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    HStack{
                        Image(systemName: "clock")
                        VStack{
                            Text("Standard delivery: \(checkout.store.deliveryTime)")
                                .fontWeight(.semibold)
                        }
                        .padding(.horizontal, 8)
                    }
                    
                    Divider()
                        .padding(.vertical, 4)
                    
                    HStack{
                        Image(systemName: "bag")
                        VStack{
                            Text(checkout.store.name)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 0){
                        ForEach(checkout.shoppingCart.items){ item in
                            HStack{
                                Text("\(item.quantity)x")
                                    .fontWeight(.medium)
                                Text(item.product.name)
                                    .padding(.horizontal, 6)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .padding(.leading, 30)
                        .padding(.vertical, 1)
                    }
                    .listRowSeparator(.hidden)
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "creditcard")
                        VStack(alignment: .leading){
                            Text("Payment: \(checkout.paymenthMetod)")
                                .fontWeight(.semibold)
                            Text(checkout.shoppingCart.total_amount.formatedAmount)
                        }
                        .padding(.horizontal, 8)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                
                
                Button{
                }label: {
                    HStack{
                        Text("Process order")
                            .font(.body)
                            .fontWeight(.medium)
                            .padding(.leading, 40)
                        Spacer()
                        
                        GrayCircularProgressView(progress: progress)
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 20)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(12)
                    
                        
                }.padding(.horizontal,20)
                
                VStack(alignment: .center){
                    
                    HStack{
                        Spacer()
                    }
                    Text("Go back")
                        .foregroundStyle(.gray)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.top, 20)
            .padding(.bottom, 20)
            .background(.white)
            .cornerRadius(14)
            .shadow(color: Color.myText12Color,radius: 0)
            .padding(.horizontal, 20)
            .navigationTitle("Checkout")
            
            
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.white.opacity(0.0),.green.opacity(0.1),.green.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
        .onReceive(timer) { _ in
            if progress >= 1.0 {
                self.progress=0
            }else{
                self.progress+=0.1
            }
        }
        
        
        
    }
    
    
    
}

#Preview {
    return CreateOrderScreen(checkout: checkout1)
}
