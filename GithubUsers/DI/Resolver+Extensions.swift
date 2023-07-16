//
//  Resolver+Extensions.swift
//  GithubUsers
//
//  Created by Menaim on 15/07/2023.
//

import Resolver

extension Resolver: ResolverRegistering {
  @MainActor
  public static func registerAllServices() {
    registerUsersDependencies()
    registerUserDetailsDependencies()
  }

  // MARK: - UsersDependencies

  @MainActor
  private static func registerUsersDependencies() {
    register { UsersAPIClient(client: BaseAPIClient()) as UsersAPIClientProtocol }
    register { UsersRepository() as UsersRepositoryProtocol }
    register { UsersDataSource() as UsersDataSourceProtocol }
    register { UsersUseCase() as UsersUseCaseProtocol }
    register { UsersViewModel() }
  }

  // MARK: - UserDetailsDependencies

  @MainActor
  private static func registerUserDetailsDependencies() {
    register { UserDetailsDataSource() as UserDetailsDataSourceProtocol }
    register { UserDetailsUseCase() as UserDetailsUseCaseProtocol }
    register { UserDetailsViewModel() }
  }
}
