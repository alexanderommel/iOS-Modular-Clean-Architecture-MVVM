//
//  CatalogueScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 4/6/24.
//

import SwiftUI
import core_ios
import ui_dandelion
import domain
import persistence
import test_resources

public struct CatalogueScreen: View {
    
    @EnvironmentObject var router: NavigationRouter
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: CatalogueViewModel
    @EnvironmentObject var vmProduct: ProductViewModel
    let store: Store
    var catalogue: Catalogue?
    
    public init(store: Store, catalogue: Catalogue?){
        self.store = store
        self.catalogue = catalogue
    }
    
    public var body: some View {
        
        VStack{
            if vmProduct.itemAdded{
                Text("")
                    .onAppear(){
                        dismiss()
                    }.hidden()
            }
            
            if vm.isLoading || vm.catalogue==nil{
                IndeterminateScreenLoadingView()
            }else{
                
                let catalogue_temp: Catalogue = catalogue!
                
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
                                        .fontWeight(.bold)
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
                        
                            
                        Button{
                            router.navigateBack()
                        }label: {
                            Image(systemName: "chevron.backward.circle.fill")
                                .resizable()
                                .foregroundStyle(Color.blue)
                                .frame(width: 32, height: 32)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(.top, 58)
                                .padding(.leading, 20)
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
                    
                    CatalogueCategoryRowView(categories: catalogue_temp.categories)
                        .listRowSeparator(.hidden)
                    
                    
                    
                    ForEach(catalogue_temp.categories){ c in
                        Section{
                            Text(c.name)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            ForEach(c.products){ p in
                                Button{
                                    router.navigate(to: .productScreen(product: p, store: store))
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
                
                Text("")
                    .hidden()
                    
            }
        }.onAppear(){
            vm.fetchCatalogueData(from: store)
        }
        .navigationBarBackButtonHidden()
        
        
    }
}

#Preview {
    
    @Previewable @StateObject var storesViewModel = StoresViewModel(api: StoresApiInteractorFaker(), checkout_api: CheckoutApiInteractorFaker())
    
    @Previewable @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiInteractorFaker())
    
    
    @Previewable @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorFaker())
    
    @Previewable @StateObject var router = NavigationRouter()
    
    return CatalogueScreen(store: stors[0], catalogue: catalog)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
        .environmentObject(router)
}
