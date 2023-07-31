//
//  RepositoriesUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Resolver

final class RepositoriesUseCase {
  // MARK: - Dependencies

  private var dataSource: RepositoriesDataSourceProtocol = Resolver.resolve()
  private let repository: RepositoriesRepositoryProtocol = Resolver.resolve()

  // MARK: - Privates

  private
  func convert(_ response: [RepositoryResponseProtocol])
    -> [RepositoryProtocol]
  {
    response.compactMap { repository in
      Repository(
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
        license: repository.license?.licenseName ?? ""
      )
    }
  }
}

// MARK: - RepositoriesUseCaseProtocol

extension RepositoriesUseCase: RepositoriesUseCaseProtocol {
  func retrieve(using searchText: String) async -> [RepositoryProtocol] {
    dataSource.isLoading = true
    let parameters = RepositoriesSearchParameters(searchableText: searchText)
    do {
      guard
        let response = try await repository.getRepositories(parameters: parameters)
      else { return [] }
      dataSource.repositories = convert(response)
    } catch {
      print(error)
    }
    dataSource.isLoading = false
    return dataSource.repositories
  }

  func checkSearchState(for searchText: String) -> Bool {
    searchText.count >= 3 ? true : false
  }

  func notifyLoading() -> Bool {
    dataSource.isLoading
  }

  func stopLoading() -> Bool {
    dataSource.isLoading
  }
}

// MARK: - RepositoriesSearchParametersProtocol

private struct RepositoriesSearchParameters: RepositoriesSearchParametersProtocol {
  var searchableText: String
}

// MARK: - RepositoryProtocol

private struct Repository: RepositoryProtocol {
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
  var license: String
}
