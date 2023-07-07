//
//  UserDetailsModuleFactory.swift
//  GithubUserDetails
//
//  Created by Menaim on 07/07/2023.
//

import SwiftUI

protocol UserDetailsModuleFactoryProtocol {
  func makeView() -> any View
}

final class UserDetailsModuleFactory { }

// MARK: - UserDetailsModuleFactoryProtocol

extension UserDetailsModuleFactory: UserDetailsModuleFactoryProtocol {
  @MainActor
  func makeView() -> any View {
    let useCaseDependencies = UserDetailsUseCaseDependencies(
      dataSource: UserDetailsDataSource(),
      repository: UsersRepository()
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
  var useCase: UserDetailsUseCase
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