//
//  ProductDetailScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 4/6/24.
//

import SwiftUI
import stores
import ui_dandelion
import checkout

struct ProductDetailScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ProductViewModel
    @State private var quantity: Int32 = 1
    let product: Product
    let store: Store
    
    
    
    var body: some View {
        
        
        
        
        VStack(alignment: .leading){
            if vm.itemAdded{
                Text("")
                    .onAppear(){
                        dismiss()
                        
                    }
            }
            Image(uiImage: loadImageFromAssets(name: product.imageUrl))
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, -20)
            HStack{
                Image(systemName: "storefront.fill")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(store.name)
                    .fontWeight(.semibold)
                    .font(.headline)
            }
            HStack{
                Text(product.name)
                    .fontWeight(.semibold)
                    .font(.title3)
                Spacer()
                Text("\(product.price.amount.description)$")
                    .fontWeight(.semibold)
                    .font(.title3)
                    .foregroundStyle(Color.myPrimaryColor)
            }
            Text(product.description)
                .padding(.top, 4)
            
            Spacer()
            
            Rectangle()
                .listRowInsets(EdgeInsets())
                .frame(width: .infinity, height: 2)
                .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                .padding(.horizontal, -20)
            
            HStack{
                
                Button{
                    if quantity>1 { quantity-=1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color.myText12Color)
                }
            
                    
                Text(quantity.description)
                    .fontWeight(.semibold)
                
                Button{
                    quantity+=1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(Color.myPrimaryColor)
                }
                
                
                
                
                Button(
                    action: {
                        let line_item = LineItemDto(productId: 1, quantity: 1)
                        vm.addLineItemToShoppingCart(store_id: store.id, line_item: line_item)

                    }, label: {
                        let individualPrice = NSDecimalNumber(decimal: product.price.amount)
                        let quantityNSD = NSDecimalNumber(decimal: Decimal(quantity))
                        let price = individualPrice.multiplying(by:quantityNSD)
                        Text("Agregar \(price.description)$")
                            .font(.body)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(Color.black)
                            .background(Color.myPrimaryColor)
                            .cornerRadius(20)
                    }
                ).padding(.leading, 4)
            }.padding(.top, 6)
            
        }.padding(.horizontal,20)
            .navigationTitle(product.name)
                .navigationBarTitleDisplayMode(.inline)
                
        
    }
}



#Preview {
    var apiInteractor:CheckoutApiInteractor = CheckoutApiInteractorFaker1()
    @StateObject var vm = ProductViewModel(api: apiInteractor)
    return ProductDetailScreen(product: products1[0], store: stors[0])
        .environmentObject(vm)
    
}
