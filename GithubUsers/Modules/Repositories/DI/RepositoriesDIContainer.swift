//
//  RepositoriesDIContainer.swift
//  GithubRepositories
//
//  Created by Menaim on 01/08/2023.
//

import Factory

extension Container {
  var repositoriesAPIClient: Factory<RepositoriesAPIClientProtocol> {
    self { RepositoriesAPIClient() }
  }

  var repositoriesRepository: Factory<RepositoriesRepositoryProtocol> {
    self { RepositoriesRepository() }
  }

  var repositoriesDataSource: Factory<RepositoriesDataSourceProtocol> {
    self { RepositoriesDataSource() }
  }

  var repositoriesUseCase: Factory<RepositoriesUseCaseProtocol> {
    self { RepositoriesUseCase() }
  }

  @MainActor
  var repositoriesViewModel: Factory<RepositoriesViewModel> {
    self { RepositoriesViewModel() }
  }
}
