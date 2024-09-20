//
//  StoresScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import domain
import ui_dandelion
import test_resources
import persistence
import core_ios
import CoreData

public struct StoresScreen: View {
    
    @FetchRequest private var checkouts: FetchedResults<CheckoutEntity>
    private let user: domain.User
    
    @State private var toast: Toast? = nil
    @EnvironmentObject var vm: StoresViewModel
    @EnvironmentObject var vmProduct: ProductViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var router: NavigationRouter
    
    private var categories: [StoreCategory] = restaurant_categories
    
    func updateToastOnAddedProduct(){
        toast = Toast(style: .success, message: "Product added successfully", duration: 3.0, width: 400)
    }
    
    public init(user: domain.User) {
        print("StoresScreen: User id \(user.id)")
        self.user = user
        self._checkouts = FetchRequest(
            sortDescriptors: []//,
            //predicate: NSPredicate(format: "userId == %@", user.id)
        )
        let fetchRequest: NSFetchRequest<CheckoutEntity> = CheckoutEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "userId == %@", user.id)
        //self._checkouts = fetchRequest
    }
    
    public var body: some View {
        
        Text("CHECKOUTS:\(checkouts.count) ")
        
        
        VStack{
            
            if vm.isLoading {
                IndeterminateScreenLoadingView()
            }else{
                
                if vmProduct.itemAdded{
                    Text("")
                        .onAppear(){
                            updateToastOnAddedProduct()
                            vmProduct.itemAdded = false
                        }.hidden()
                }
                
                List{
                    HStack{
                        Text("¡Hi Alexander!")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .font(.headline)
                            
                    }
                    .listRowSeparator(.hidden)
                

                    Text("Look what we've got for you!")
                        .foregroundStyle(Color.myText34Color)
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    
                    LocationView()
                        .padding(.top, 2)
                        .listRowSeparator(.hidden)
                    
                    StoreCategoryRowView(categories: categories)
                        .listRowSeparator(.hidden)
                    
                    Text("Restaurants near you")
                        .foregroundStyle(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                        .padding(.top, 4)
                        .listRowSeparator(.hidden)
                    
                    if vm.errorLocalized.isEmpty{
                        ForEach(vm.stores) { store in
                            Button{
                                router.navigate(to: .catalogueScreen(store: store, catalogue: catalog))
                            }label: {
                                StoreView(store: store)
                            }
                            
                        }
                    }else{
                        //let errorMessage = NSLocalizedString(vm.errorLocalized, //bundle: Bundle.fromCommonFramework, comment: "")
                        //Text("Error: \(errorMessage)")
                    }
                    
                    
                }
                .navigationTitle("Restaurants near you")
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                
                if !checkouts.isEmpty {
                    Button{
                        //var dtos: [CheckoutDto] = []
                        //for chk in checkouts{
                            //let dto = checkoutMapper.mapToDomainModel(entity: chk)
                            //dtos.append(dto)
                        //}
                        var checkouts_list: [Checkout] = []
                        for chk in checkouts{
                            let c = chk.toDomain()
                            checkouts_list.append(c)
                        }
                        router.navigate(to: .shoppingCartsScreen(carts: checkouts_list))
                    }label: {
                        HStack{
                            Image(systemName: "cart.fill")
                                .padding(.leading, 20)
                            Spacer()
                            Text("View shopping carts (\(checkouts.count))")
                                .font(.body)
                                .fontWeight(.medium)
                                .padding(.vertical, 20)
                            Spacer()
                                
                        }
                        .background(Color.black)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .padding(.top, 5)
                        
                        
                            
                    }.padding(.horizontal,20)
                        .listRowSeparator(.hidden)
                }
                
                
                
            }
            
            
        }.onAppear(){
            print("ContentView appeared!")
            vm.fetchStoresData()
        }
        .toastView(toast: $toast)
        
        
    }
}

#Preview {
    
    let context = AppDatabase.preview.container.newBackgroundContext()
    
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiInteractorFaker(), checkout_api: CheckoutApiInteractorFaker())
    
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiInteractorFaker())
    
    
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorFaker())
    
    @StateObject var router = NavigationRouter()
    
    StoresScreen(user: test_user)
        .environmentObject(storesViewModel)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
        .environmentObject(router)
}
