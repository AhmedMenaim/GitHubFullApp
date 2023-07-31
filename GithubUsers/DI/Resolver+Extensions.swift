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
    registerRepositoriesDependencies()
    registerUserRepositoriesDependencies()
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

  // MARK: - RepositoriesDependencies

  @MainActor
  private static func registerRepositoriesDependencies() {
    register { RepositoriesAPIClient() as RepositoriesAPIClientProtocol }
    register { RepositoriesRepository() as RepositoriesRepositoryProtocol }
    register { RepositoriesDataSource() as RepositoriesDataSourceProtocol }
    register { RepositoriesUseCase() as RepositoriesUseCaseProtocol }
    register { RepositoriesViewModel() }
  }

  // MARK: - UserRepositoriesDependencies

  @MainActor
  private static func registerUserRepositoriesDependencies() {
    register { UserRepositoriesAPIClient() as UserRepositoriesAPIClientProtocol }
    register { UserRepositoriesRepository() as UserRepositoriesRepositoryProtocol }
    register { UserRepositoriesDataSource() as UserRepositoriesDataSourceProtocol }
    register { UserRepositoriesUseCase() as UserRepositoriesUseCaseProtocol }
    register { UserRepositoriesViewModel() }
  }
}
