//
//  UsersModuleFactory.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import SwiftUI

protocol UsersModuleFactoryProtocol {
  func makeView() -> any View
}

final class UsersModuleFactory {}

// MARK: - UsersModuleFactoryProtocol
extension UsersModuleFactory: UsersModuleFactoryProtocol {
  @MainActor
  func makeView() -> any View {
    let useCaseDependencies = UsersUseCaseDependencies(
      dataSource: UsersDataSource(),
      repository: UsersRepository()
    )
    let useCase = UsersUseCase(dependencies: useCaseDependencies)
    let viewModelDependencies = UsersViewModelDependencies(useCase: useCase)
    let usersViewModel = UsersViewModel(dependencies: viewModelDependencies)
    let usersViewDependencies = UsersViewDependencies(usersViewModel: usersViewModel)
    let view = UsersView(dependencies: usersViewDependencies)
    return view
  }
}

// MARK: - UsersViewModelDependenciesProtocol
private struct UsersViewModelDependencies: UsersViewModelDependenciesProtocol {
  var useCase: UsersUseCase
}

// MARK: - UsersUseCaseDependenciesProtocol
private struct UsersUseCaseDependencies: UsersUseCaseDependenciesProtocol {
  var dataSource: UsersDataSourceProtocol
  var repository: UsersRepositoryProtocol
}

// MARK: - UsersViewDependenciesProtocol
private struct UsersViewDependencies: UsersViewDependenciesProtocol {
  var usersViewModel: UsersViewModel
}
