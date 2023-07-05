//
//  UserRepositoriesViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

@MainActor
final class UserRepositoriesViewModel: ObservableObject {
  @Published private (set) var repositoriesArray: [Repository] = []

  func fetchRepositories(with username: String) async {
    do {
      let repositories = try await UserRepositoriesAPIClient.shared.getUserRepositories(username: username)
      self.repositoriesArray = repositories.map({ repository in
        Repository(
          repositoryName: repository.repositoryName ?? "",
          isPrivate: repository.isPrivate ?? false,
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
          updatedAt: repository.updatedAt?.formattedDateString() ?? "",
          licenseName: repository.license?.licenseName ?? "")
      })
    } catch let error {
      print(error)
    }
  }
}
