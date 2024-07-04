# Dandelion
 
 This iOS delivery application is being developed following Clean Architecture guidelines and the Agile development methodolog. 

 ## Purpose
 
 This project aims to show you an example of how the development process of an agile applications looks and show you a modular architecture that envolves at the same time as the new features get integrated into the application.

 ## Sprint Zero

 This sprint defines the base database diagram and architecture or modular structure that the application will probably follow during the development cycle, however, this documentation is just for communication purposes, not for documenting the application.

 The initial database diagram of the system has the following structure:

 ![image](https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/49670047-7877-43e9-b293-ec936d276669)

 The modules of the application are:

 ![image](https://github.com/alexanderommel/iOS-Clean-Architecture/assets/70469919/592f47a8-594b-41b9-aa05-20fc26aea3ba)


 ## Sprint 1

 The objective of this Sprint is to develop the stores module (the login screen is not important for our virtual customer since its contribution for the business is quite low). Before to develop this module, some questions may emerge:

 - ¿Where the data of the stores, catalogue and product details will be stored?
 - ¿What happens with the login screen?
 - ¿The product details screen should include the button to add the item to the shopping cart?

Since we are using Swift UI, the problem of not having the login screen is trivial due to the Preview feature that lets our screens be tested in isolation, to get the data of the user we have to create a protocol named UserApiInteractor in the user module and a protocol named StoreApiInteractor that has the methods to fetch the data from the remote server. Finally, to answer the last question, we should include the button to add the item to the shopping cart by creating another ShoppingApiInteractor with some DTO classes in order to avoid wasting efforts in creating a proper domain model that maight change in the future when the shopping cart feature gets implemented.

The Screens developed as result of this Sprint are the following:


