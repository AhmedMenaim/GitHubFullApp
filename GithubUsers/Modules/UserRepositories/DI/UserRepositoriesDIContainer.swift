//
//  UserRepositoriesDIContainer.swift
//  GithubUsers
//
//  Created by Menaim on 03/08/2023.
//

import Factory

extension Container {
  var userRepositoriesAPIClient: Factory<UserRepositoriesAPIClientProtocol> {
    self { UserRepositoriesAPIClient() }
  }

  var userRepositoriesRepository: Factory<UserRepositoriesRepositoryProtocol> {
    self { UserRepositoriesRepository() }
  }

  var userRepositoriesDataSource: Factory<UserRepositoriesDataSourceProtocol> {
    self { UserRepositoriesDataSource() }
  }

  var userRepositoriesUseCase: Factory<UserRepositoriesUseCaseProtocol> {
    self { UserRepositoriesUseCase() }
  }

  @MainActor
  var userRepositoriesViewModel: Factory<UserRepositoriesViewModel> {
    self { UserRepositoriesViewModel() }
  }
}
