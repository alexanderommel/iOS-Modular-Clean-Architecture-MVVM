//
//  StoresScreen.swift
//  stores-ui
//
//  Created by Rommel Valdiviezo on 2/6/24.
//

import SwiftUI
import stores
import ui_dandelion
import common
import user
import persistence
import checkout
import routing

public struct StoresScreen: View {
    
    @FetchRequest private var checkouts: FetchedResults<persistence.Checkout>
    private let user: user.User
    private let checkoutMapper: CheckoutDomainMapper
    
    @State private var toast: Toast? = nil
    @EnvironmentObject var vm: StoresViewModel
    @EnvironmentObject var vmProduct: ProductViewModel
    @Environment(\.managedObjectContext) private var viewContext
    @EnvironmentObject var router: NavigationRouter
    
    private var categories: [StoreCategory] = restaurant_categories
    
    func updateToastOnAddedProduct(){
        toast = Toast(style: .success, message: "Product added successfully", duration: 3.0, width: 400)
    }
    
    public init(user: user.User) {
        print("StoresScreen: User id \(user.id)")
        self.user = user
        self.checkoutMapper = CheckoutDomainMapper()
        self._checkouts = FetchRequest(
            sortDescriptors: [],
            predicate: NSPredicate(format: "user_id == %@", user.id)
        )
    }
    
    public var body: some View {
        
        
        
        
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
                        let errorMessage = NSLocalizedString(vm.errorLocalized, bundle: Bundle.fromCommonFramework, comment: "")
                        Text("Error: \(errorMessage)")
                    }
                    
                    
                }
                .navigationTitle("Restaurants near you")
                .listStyle(.plain)
                .listRowSeparator(.hidden)
                
                if !vm.checkouts.isEmpty {
                    Button{
                        var dtos: [CheckoutDto] = []
                        for chk in checkouts{
                            let dto = checkoutMapper.mapToDomainModel(entity: chk)
                            dtos.append(dto)
                        }
                        router.navigate(to: .shoppingCartsScreen(carts: vm.checkouts))
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
            var dtos: [CheckoutDto] = []
            for chk in checkouts{
                let dto = checkoutMapper.mapToDomainModel(entity: chk)
                dtos.append(dto)
            }
            vm.mappingCheckoutData(checkouts: dtos)
        }
        .toastView(toast: $toast)
        
        
    }
}

#Preview {
    
    let context = AppDatabase.preview.container.newBackgroundContext()
    
    
    @StateObject var storesViewModel = StoresViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()),
                                        checkout_api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: AppDatabase.preview.container.newBackgroundContext()))
    )
    
    
    @StateObject var catalogueViewModel = CatalogueViewModel(api: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()))
    
    
    @StateObject var productViewModel = ProductViewModel(api: CheckoutApiInteractorImpl(storeApi: StoresApiImpl(store_remote_repo: StoreRemoteRepositoryFaker(), user_api_interactor: UserApiInteractorFaker()), userApi: UserApiInteractorFaker(), checkoutLocalRepo: CheckoutLocalRepositoryImpl(context: context)))
    
    @StateObject var router = NavigationRouter()
    
    return StoresScreen(user: test_user)
        .environmentObject(storesViewModel)
        .environmentObject(catalogueViewModel)
        .environmentObject(productViewModel)
        .environmentObject(router)
}
