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
    registerFollowersDependencies()
  }

  // MARK: - UsersDependencies

  @MainActor
  private static func registerUsersDependencies() {
    register { BaseAPIClient() as BaseAPIClientProtocol }
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

  // MARK: - FollowersDependencies

  @MainActor
  private static func registerFollowersDependencies() {
    register { FollowersAPIClient() as FollowersAPIClientProtocol }
    register { FollowersRepository() as FollowersRepositoryProtocol }
    register { FollowersDataSource() as FollowersDataSourceProtocol }
    register { FollowersUseCase() as FollowersUseCaseProtocol }
    register { FollowersViewModel() }
  }
}
