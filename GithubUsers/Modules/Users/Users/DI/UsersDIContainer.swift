//
//  UsersDIContainer.swift
//  GithubUsers
//
//  Created by Menaim on 31/07/2023.
//

import Factory

extension Container {
  var baseAPIClient: Factory<BaseAPIClientProtocol> {
    self { BaseAPIClient() }
  }

  var usersAPIClient: Factory<UsersAPIClientProtocol> {
    self { UsersAPIClient() }
  }

  var usersRepository: Factory<UsersRepositoryProtocol> {
    self { UsersRepository() }
  }

  var usersDataSource: Factory<UsersDataSourceProtocol> {
    self { UsersDataSource() }
  }

  var usersUseCase: Factory<UsersUseCaseProtocol> {
    self { UsersUseCase() }
  }

  @MainActor
  var usersViewModel: Factory<UsersViewModel> {
    self { UsersViewModel() }
  }
}
