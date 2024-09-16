
<br />
<div align="center">
  <a href="https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/IOS_logo.svg/800px-IOS_logo.svg.png">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/IOS_logo.svg/800px-IOS_logo.svg.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">iOS Clean Architecture and MVVM</h3>

  <p align="center">
    Multi-modular delivery app example with Clean Architecture and MVVM
    <br />
    <a href="https://www.youtube.com/watch?v=FACdjfABhXs">View Demo</a>
  </p>

  <p align="center">
    This app was developed also for Android devices
    <br />
    <a href="https://github.com/alexanderommel/Android-Modular-Clean-Architecture-MVVM">Repository of the Android app</a>
   
  </p>

  
</div>

## About The Project

<img width="1507" alt="image" src="https://github.com/user-attachments/assets/419c140c-39dd-4d78-a7e6-aa73b6efd3d2">

<br />
<br />

This repository contains an example of an iOS application that applies the concepts of modularization in frameworks, clean architecture principles, and mvvm. 


This application was developed under the agile development methodology with the main objective of delivering functional increments of the software, you can check the feature branchs to see the evolution of the development of this app.


## Concepts

I included some definitions of some of the principles and concepts from Clean Architecture used to develop this app:

* The Dependency Inversion Principle (DIP) tells us that the most flexible systems are those in which source code dependencies refer only to abstractions, not to concretions.
* Volatile modules (components) are the modules that we are actively developing, and that are undergoing frequent change.
* The Single Responsability Principle (SRP) tell us that a module should be responsible to one, and only one, actor.
* DIP violations ocur when a concrete module  depends on another concrete module. Generally, you will have at least one DIP violation since there should be a class that is responsible of creating the implementations of the abstractions in the system. The 'Main' class (app module) is the one that does it.
* A use case is a description of the way that an automated system is used. It specifies the input to be provided by the user, the output to be returned to the user, and the processing steps involved in producing that output.
* The Dependency Rule states that source code dependencies must point only inward, toward higher-level policies (business rules). High-level policies are expected to be located in the inner layers of the Clean Architecture.

## Clean Architecture



<img width="753" alt="image" src="https://github.com/user-attachments/assets/055f48d2-4d43-4cc2-a7d5-1e1b8bb1048e">

Layers in clean architecture are the sets of classes and components that have similar responsabilities, and as a consequence, you might have probably seen different folder structures that claim to be Clean Architecture. This project doesn't have a folder structure in layers, but there's an example of some classes in the app that belong to the most common layers in clean architectures. 

- Presentation Layer: `ShoppingCartsScreen, CheckoutScreen, CheckoutViewModel`
- Infrastructure/Data Layer: `CheckoutLocalRepositoryImpl, StoresRemoteRepositoryImpl`
- Application Layer: `UserApiInteractor, StoresApiInteractor, CheckoutApiInteractor, FetchStoresUseCase, AddLineItemUseCase`
- Domain Layer: `Store, Catalogue, Product, Shopping Cart, Checkout`


## Modules

The following diagram shows the modules of the application and the dependency graph between them

<img width="1101" alt="image" src="https://github.com/user-attachments/assets/2f769d15-4554-4939-b00c-9f2f7b0df875">


The dependency graph was built considering the dependency inversion principle which states that concrete classes should depend on abstract classes, and abstract classes should avoid dependencies on other classes. 

* The module 'app:dandelion' contains the app class with the @main annotation. This module is an iOS app that depends on every module of the system in order to create the implementations (concrete modules) of the protocols (abstract modules) and do the depedency injection activities throught the environment variables.
* The orange modules 'feature:<name>' are abstract modules that contain the business logic and protocols that must be implemented by the concrete modules. Abstractions are inside the 'api' folder, and the business logic is wrapped as use case classes.
* The module 'common' contains models that are common to the different business activities. This module doesn't depend on any module.
* The module 'ui-dandelion' contains ui custom components and despite being a concrete module, it is a type of reausable module.
* The blue modules 'feature:<name>-ui' are concrete modules that contain the views and screens of the app. View classes are considered to be volatile classes due to the fact that they have the tendency to change frequently. This modules depend on abstract modules 'feature:<name>'.
* The module 'persistence' contains the database logic and it belongs to the infrastructure layer (frameworks and drivers layer) of Clean Architecture, and satisfies the dependency rule which states that the direction of dependencies between layers point inwards.
* The module 'networking' contains the network logic (api calls) to connect the app with the server. The repositories are mocked to make the testing and installation of the app simple.
* The module 'routing' contains a class used to centralize the navigation logic.


 ## Logic Database Diagram

 The initial database diagram of the system had the following structure:

 ![image](https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/49670047-7877-43e9-b293-ec936d276669)

 ## Installation

 This app doesn't rely on any external dependencies or services (The calls to the backend server are mocked). You can just clone, open in XCode and run. 

