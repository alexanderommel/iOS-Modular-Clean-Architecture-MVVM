
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
</div>

## About The Project

<img width="1507" alt="image" src="https://github.com/user-attachments/assets/419c140c-39dd-4d78-a7e6-aa73b6efd3d2">

<br />
<br />

This repository contains an example of an iOS application that applies the concepts of modularization in frameworks, clean architecture principles, and mvvm. 


This application was developed under the agile development methodology with the main objective of delivering functional increments of the software, you can check the feature branchs to see the evolution of the development of this app.


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


 ## Sprint Zero

 This sprint defines the base database diagram and architecture or modular structure that the application will probably follow during the development cycle, however, this documentation is just for communication purposes, not for documenting the application.

 The initial database diagram of the system has the following structure:

 ![image](https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/49670047-7877-43e9-b293-ec936d276669)

 The high-level view of the modules in the application are:

 <p align="center">
  <img src="https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/592f47a8-594b-41b9-aa05-20fc26aea3ba">
</p>

The project is structured in a way that some modules are platform-specific and feature-specific, feature-modularization easies the division of work and since we are developing two applications, the classification of platform-specific modules makes the synchronization tasks more easy and even if we plan to use multiplatform technologies such as Kotlin KMM, the integration of shared code will be much easier since the high-level policies are not platform-specific.

Platform specific modules are the ones that start with the prefix 'ui' inside the features folder the other modules inside the same folder are not platform specific (they can be used in any apple environment). The module core-ios contains libraries that are specific to iOS and are not supported for the rest of platforms.

 ## Sprint 1

 The objective of this Sprint is to develop the stores module (the login screen is not important for our virtual customer since its contribution for the business is quite low). Before to develop this module, some questions may emerge:

 - ¿Where the data of the stores, catalogue and product details will be stored?
 - ¿What happens with the login screen?
 - ¿The product details screen should include the button to add the item to the shopping cart?

Since we are using Swift UI, the problem of not having the login screen is trivial due to the Preview feature that lets our screens be tested in isolation, to get the data of the user we have to create a protocol named UserApiInteractor in the user module and a protocol named StoreApiInteractor that has the methods to fetch the data from the remote server. Finally, to answer the last question, we should include the button to add the item to the shopping cart by creating another ShoppingApiInteractor with some DTO classes in order to avoid wasting efforts in creating a proper domain model that maight change in the future when the shopping cart feature gets implemented.

The Screens developed as result of this Sprint are the following:

<img width="1006" alt="image" src="https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/de9cc62f-9458-4772-9a0a-818dfed3e2ba">


## Sprint 2

The objective of this sprint is to develop the checkout module.

<img width="1006" alt="image" src="https://github.com/user-attachments/assets/7c38c344-d413-4022-8556-51e0f9be839e">


