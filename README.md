# GitHubFullApp

⚠️⚠️ Everything here depends on my understanding & experience, it may contain some things not implemented in the best way, We are here to learn from each other 👌🏻 ⚠️⚠️
 
This repo is created to introduce the implementation of the clean architecture over the MVVM architecture, In this repo I'm following the approach of the different branches and each branch contains some specific updates.

Some approaches were followed in this repo:

1. Clean architecture with the below diagram
2. Design patterns like a repository to manage the network responses and the cache (If exists)
3. Design patterns like dataSource to manage the variables that exist in business logic.
4. Using SwiftUI in the UI layer.
5. Network layer from scratch.
6. Depending on modern concurrency (Async, Await)
7. Unit tests for two modules.
8. Dependency injection using [Resolver](https://github.com/hmlongco/Resolver).
9. Dependency injection using [Factory](https://github.com/hmlongco/Factory).

Approaches not implemented yet -> Will be implemented soon **OR** Feel free to implement any of them ✊🏻

1. Coordinator pattern.
2. Add caching.
3. Logger in the Network layer.



The profile page is left empty for you to attach the suitable design you need to talk about yourself, Maybe I can set a template for it as a portfolio to facilitate the process.

Here are the branches I have created: 

Main branch

This is the branch contains the basic implementation for couple of modules, You can consider it as the base branch to start from

MVVM-Clean branch

This branch is to show how to achieve the diagram mentioned before but I have completed only two modules -> **Users & UserDetails** with most of the needed layers but other modules are the same in this branch.

DI-Resolver branch 

Instead of using the normal dependency injection, I have chosen to use one of the third-party libraries that can support and facilitate the process which is [Resolver](https://github.com/hmlongco/Resolver) & I completed implementing it for all the needed, and this branch now contains all the modules  completed with all the needed layers. 

DI-Factory branch 

As Resolver may not be supported in the future and all the support will go to the factory which is created by the same author, I thought that this is gonna be a good opportunity to have a look about [Factory](https://github.com/hmlongco/Factory) and the dfferencves between it and the resolver it an opportunity in this branch DI-Factory 
