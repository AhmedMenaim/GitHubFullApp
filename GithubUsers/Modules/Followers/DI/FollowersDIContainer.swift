//
//  FollowersDIContainer.swift
//  GithubUsers
//
//  Created by Menaim on 03/08/2023.
//

import Factory

extension Container {
  var followersAPIClient: Factory<FollowersAPIClientProtocol> {
    self { FollowersAPIClient() }
  }

  var followersRepository: Factory<FollowersRepositoryProtocol> {
    self { FollowersRepository() }
  }

  var followersDataSource: Factory<FollowersDataSourceProtocol> {
    self { FollowersDataSource() }
  }

  var followersUseCase: Factory<FollowersUseCaseProtocol> {
    self { FollowersUseCase() }
  }

  @MainActor
  var followersViewModel: Factory<FollowersViewModel> {
    self { FollowersViewModel() }
  }
}
