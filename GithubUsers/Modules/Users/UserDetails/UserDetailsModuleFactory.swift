//
//  UserDetailsModuleFactory.swift
//  GithubUserDetails
//
//  Created by Menaim on 07/07/2023.
//

import SwiftUI
import Resolver

protocol UserDetailsModuleFactoryProtocol {
  func makeView() -> any View
}

final class UserDetailsModuleFactory { }

// MARK: - UserDetailsModuleFactoryProtocol

extension UserDetailsModuleFactory: UserDetailsModuleFactoryProtocol {
  @MainActor
  func makeView() -> any View {
//    let repositoryDependencies = UsersRepositoryDependencies(
//      client: UsersAPIClient(client: BaseAPIClient())
//    )
    let repository: UsersRepositoryProtocol = Resolver.resolve()
    let useCaseDependencies = UserDetailsUseCaseDependencies(
      dataSource: UserDetailsDataSource(),
      repository: repository
    )
    let useCase = UserDetailsUseCase(dependencies: useCaseDependencies)
    let viewModelDependencies = UserDetailsViewModelDependencies(useCase: useCase)
    let userDetailsViewModel = UserDetailsViewModel(dependencies: viewModelDependencies)
    let userDetailsViewDependencies = UserDetailsViewDependencies(viewModel: userDetailsViewModel)
    let view = UserDetailsView(dependencies: userDetailsViewDependencies)
    return view
  }
}

// MARK: - UserDetailsViewModelDependenciesProtocol

private struct UserDetailsViewModelDependencies: UserDetailsViewModelDependenciesProtocol {
  var useCase: UserDetailsUseCaseProtocol
}

// MARK: - UserDetailsUseCaseDependenciesProtocol

private struct UserDetailsUseCaseDependencies: UserDetailsUseCaseDependenciesProtocol {
  var dataSource: UserDetailsDataSourceProtocol
  var repository: UsersRepositoryProtocol
}

// MARK: - UserDetailsViewDependenciesProtocol

private struct UserDetailsViewDependencies: UserDetailsViewDependenciesProtocol {
  var viewModel: UserDetailsViewModel
}

// MARK: - UsersRepositoryDependenciesProtocol

//private struct UsersRepositoryDependencies: UsersRepositoryDependenciesProtocol {
//  var client: UsersAPIClientProtocol
//}
