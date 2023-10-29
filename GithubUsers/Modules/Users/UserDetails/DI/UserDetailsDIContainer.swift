//
//  UserDetailsDIContainer.swift
//  GithubUsers
//
//  Created by Menaim on 01/08/2023.
//

import Factory

extension Container {
  var userDetailsDataSource: Factory<UserDetailsDataSourceProtocol> {
    self { UserDetailsDataSource() }
  }
  var userDetailsUseCase: Factory<UserDetailsUseCaseProtocol> {
    self { UserDetailsUseCase() }
  }
  @MainActor
  var userDetailsViewModel: Factory<UserDetailsViewModel> {
    self { UserDetailsViewModel() }
  }
}
