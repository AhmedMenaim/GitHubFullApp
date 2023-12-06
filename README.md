# GitHubFullApp
 
👉🏻 This repo is created to introduce the implementation of the clean architecture concepts over MVVM.

👉🏻 In this repo I'm following the approach of using the different branches and each branch contains some specific updates.

👉🏻 More design patterns can be added but I thought it's better to be like this for now, as they are not being used in the project and it's not a good thing to add more design patterns even if they are not being used or not needed at this time (**You can do that only in practicing/educational purposes)**.

![Simulator Screen Recording - iPhone 15 Pro - 2023-12-03 at 21 32 40](https://github.com/AhmedMenaim/GitHubFullApp/assets/26345314/4bc2024a-8649-4934-9921-d0627637b603)


# Approaches followed

1. Clean architecture with the below diagram.

![MVVM-Clean-Diagram](https://github.com/AhmedMenaim/GitHubFullApp/assets/26345314/7ad00c4a-2ca4-467e-9a26-a33ff8fefe3a)

2. Design patterns like a repository to manage the network responses and the cache (If exists)
3. Design patterns like dataSource to manage the variables that exist in business logic.
4. Using **SwiftUI** in the UI layer.
5. Network layer from scratch.
6. Depending on modern concurrency (Async, Await)
7. Unit tests for two modules.
8. Dependency injection using [Resolver](https://github.com/hmlongco/Resolver).
9. Dependency injection using [Factory](https://github.com/hmlongco/Factory).

# Branches

[Main Branch](https://github.com/AhmedMenaim/GitHubFullApp/tree/main)

This is the branch that contains the basic implementation for a couple of modules, You can consider it as your starter project.

[MVVM Branch](https://github.com/AhmedMenaim/GitHubFullApp/tree/MVVM)

I have implemented the normal (The most commonly used MVVM) with some files/folders organization with the base layers needed, You can consider it as your **(MVVM)** starter project.

[MVVM-Clean branch](https://github.com/AhmedMenaim/GitHubFullApp/tree/MVVM-Clean)

This branch is to show how to achieve the diagram mentioned before but I have completed only two modules -> **Users & UserDetails** with most of the needed layers but other modules are the same in this branch.

[DI-Resolver branch](https://github.com/AhmedMenaim/GitHubFullApp/tree/DI-Resolver) 

Instead of using the normal dependency injection, I have chosen to use one of the third-party libraries that can support and facilitate the process which is [Resolver](https://github.com/hmlongco/Resolver) & I completed implementing it for all the needed, and this branch now contains all the modules completed with all the needed layers. 

[DI-Factory branch](https://github.com/AhmedMenaim/GitHubFullApp/tree/DI-Factory)

As Resolver may not be supported in the future and all the support will go to the factory which is created by the same author, I thought that this is gonna be a good opportunity to have a look at [Factory](https://github.com/hmlongco/Factory) and the differences between it and the resolver it an opportunity in this branch DI-Factory


# What could be improved? 

**Will be implemented soon **OR** Feel free to implement any of them ✊🏻**

1. Coordinator pattern.
2. Add caching.
3. Logger in the Network layer.
4. Combine.
5. Implement template design for the profile page. (For now, it is left empty for you to attach the suitable design you need to talk about yourself, Maybe I can set a template for it as a portfolio to facilitate the process.

# Communication

📳 You can find me on:

[![Linkedin: Ahmed Menaim](https://img.shields.io/badge/-Menaim-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/menaim/)](https://www.linkedin.com/in/menaim/) [![YT-Logo](https://user-images.githubusercontent.com/26345314/162580151-8af04674-1da2-4934-98e1-9067dd93ea84.png)](https://www.youtube.com/@MenaimAcademy) 
<a href="https://stackoverflow.com/users/14437411/menaim"> <img src= "https://user-images.githubusercontent.com/26345314/162581545-9cec2771-efa9-4992-a331-ebda39ddb7fc.png" width="40">
