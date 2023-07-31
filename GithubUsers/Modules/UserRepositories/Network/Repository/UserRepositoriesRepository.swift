//
//  UserRepositoriesRepository.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Resolver

struct UserRepositoriesRepository {
  // MARK: - Dependencies

  private var client: UserRepositoriesAPIClientProtocol = Resolver.resolve()

  // MARK: - Privates

  private func convert(_ response: [UserRepositoriesNetworkResponse]?)
    -> [UsersRepositoriesRepositoryResponseProtocol]?
  {
    response?.compactMap { repository in
      UsersRepositoriesRepositoryResponse(
        repositoryName: repository.repositoryName,
        isPrivate: repository.isPrivate,
        repositoryURL: repository.repositoryURL,
        description: repository.description,
        repositorySize: repository.repositorySize,
        repositoryForksCount: repository.repositoryForksCount,
        repositoryStarsCount: repository.repositoryStarsCount,
        repositoryOpenIssuesCount: repository.repositoryOpenIssuesCount,
        repositoryWatchersCount: repository.repositoryWatchersCount,
        repositoryDefaultBranch: repository.repositoryDefaultBranch,
        cloneURL: repository.cloneURL,
        programmingLanguage: repository.programmingLanguage,
        updatedAt: repository.updatedAt,
        licenseName: repository.license?.licenseName
      )
    }
  }
}

// MARK: - UserRepositoriesRepositoryProtocol

extension UserRepositoriesRepository: UserRepositoriesRepositoryProtocol {
  func getUserRepositories(parameters: UserRepositoriesSearchParametersProtocol) async throws
    -> [UsersRepositoriesRepositoryResponseProtocol]?
  {
    var repositories: [UsersRepositoriesRepositoryResponseProtocol]?
    do {
      let response = try await client.getUserRepositories(parameters: parameters)
      repositories = convert(response)
    } catch {
      guard let error = error as? SessionDataTaskError else {
        throw RepositoryError.unowned
      }
      throw RepositoryError(error: error)
    }
    return repositories
  }
}
