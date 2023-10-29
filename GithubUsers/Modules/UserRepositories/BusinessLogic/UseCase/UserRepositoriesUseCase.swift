//
//  UserRepositoriesUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation
import Factory

final class UserRepositoriesUseCase {
  // MARK: - Dependencies

  private var dataSource = Container.shared.userRepositoriesDataSource()
  private let repository = Container.shared.userRepositoriesRepository()

  // MARK: - Privates

  private
  func convert(_ response: [UsersRepositoriesRepositoryResponseProtocol])
    -> [UserRepositoryProtocol]
  {
    response.compactMap { repository in
      UserRepository(
        repositoryName: repository.repositoryName ?? "",
        isPrivate: repository.isPrivate ?? true,
        repositoryURL: repository.repositoryURL ?? "",
        description: repository.description ?? "",
        repositorySize: repository.repositorySize ?? 0.0,
        repositoryForksCount: repository.repositoryForksCount ?? 0,
        repositoryStarsCount: repository.repositoryStarsCount ?? 0,
        repositoryOpenIssuesCount: repository.repositoryOpenIssuesCount ?? 0,
        repositoryWatchersCount: repository.repositoryWatchersCount ?? 0,
        repositoryDefaultBranch: repository.repositoryDefaultBranch ?? "",
        cloneURL: repository.cloneURL ?? "",
        programmingLanguage: repository.programmingLanguage ?? "",
        updatedAt: repository.updatedAt ?? "",
        licenseName: repository.licenseName ?? ""
      )
    }
  }
}

// MARK: - UserRepositoriesUseCaseProtocol

extension UserRepositoriesUseCase: UserRepositoriesUseCaseProtocol {
  func retrieve() async -> [UserRepositoryProtocol] {
    dataSource.isLoading = true
    guard let username = UserDefaults.standard.string(forKey: "Username") else { return [] }
    let parameters = UserRepositoriesSearchParameters(username: username)
    do {
      guard let repositories = try await repository.getUserRepositories(parameters: parameters) else {
        return []
      }
      dataSource.repositoriesArray = convert(repositories)
      dataSource.isLoading = false
    } catch {
      print(error)
    }
    return dataSource.repositoriesArray
  }

  func notifyLoading() -> Bool {
    dataSource.isLoading
  }

  func stopLoading() -> Bool {
    dataSource.isLoading
  }
}

// MARK: - UserRepositoryProtocol

private struct UserRepository: UserRepositoryProtocol {
  var repositoryName: String
  var isPrivate: Bool
  var repositoryURL: String
  var description: String
  var repositorySize: Double
  var repositoryForksCount: Int
  var repositoryStarsCount: Int
  var repositoryOpenIssuesCount: Int
  var repositoryWatchersCount: Int
  var repositoryDefaultBranch: String
  var cloneURL: String
  var programmingLanguage: String
  var updatedAt: String
  var licenseName: String
}

// MARK: - UserRepositoriesSearchParametersProtocol

private struct UserRepositoriesSearchParameters: UserRepositoriesSearchParametersProtocol {
  var username: String
}
