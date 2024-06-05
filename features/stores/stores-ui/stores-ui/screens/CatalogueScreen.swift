//
//  CatalogueScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 4/6/24.
//

import SwiftUI
import stores

struct CatalogueScreen: View {
    
    var store: Store
    var catalogue: Catalogue
    
    var body: some View {
        NavigationStack{
            List(){
                ZStack(alignment: .topLeading){
                    Image(uiImage: loadImageFromAssets(name: store.storeImage))
                        .resizable()
                        .frame(width: .infinity, height: 160)
                    
                    
                    VStack {
                        Spacer()
                            .frame(width: .infinity, height: 136)
                        VStack(alignment: .leading){
                            HStack{
                                Text(store.name)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.headline)
                                    
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text(store.rating.description)
                                    .fontWeight(.medium)
                                    .font(.caption)
                                Image(systemName: "road.lanes")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text(store.distance.description)
                                    .fontWeight(.medium)
                                    .font(.caption)
                            }
                            .padding(.leading, 94)
                            .padding(.top, 14)
                            
                            HStack {
                                Image(systemName: "location.square.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text(store.location.address)
                                    .fontWeight(.medium)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.myText34Color)
                            }
                            .padding(.leading, 20)
                            HStack{
                                Image(systemName: "bag.fill")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                    .foregroundStyle(Color.myPrimaryColor)
                                Text("El costo de envío es: \(store.deliveryFee)$")
                                    .fontWeight(.medium)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.myText34Color)
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                        }
                            .background(.white)
                        .clipShape(.rect(cornerRadius: 16))
                    }
                    
                        

                    
                    
                    Image(uiImage: loadImageFromAssets(name: store.storeImage))
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .overlay{
                            Circle().stroke(.white)
                        }
                        .padding(.top, 108)
                        .padding(.leading, 20)
                    
                    
                }
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
                
                Rectangle()
                    .listRowInsets(EdgeInsets())
                    .frame(width: .infinity, height: 1.2)
                    .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                
                CatalogueCategoryRowView(categories: catalogue.categories)
                    .listRowSeparator(.hidden)
                
                
                
                ForEach(catalogue.categories){ c in
                    Section{
                        Text(c.name)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        ForEach(c.products){ p in
                            NavigationLink
                            {
                                ProductDetailScreen(product: p, store: store)
                            } label: {
                                ProductView(product: p)
                            }
                            .buttonStyle(.plain)
                            .listRowSeparator(.hidden)
                            .ignoresSafeArea()
                        }
                        Rectangle()
                            .listRowInsets(EdgeInsets())
                            .frame(width: .infinity, height: 1.2)
                            .foregroundStyle(Color(hue: 1.0, saturation: 0.0, brightness: 0.943))
                    }.listRowSeparator(.hidden)
                }
            }
                .listStyle(.plain)
                .ignoresSafeArea()
                
        }
    }
}

#Preview {
    CatalogueScreen(store: stors[0], catalogue: catalog)
}
