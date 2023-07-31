//
//  RepositoriesViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation
import Resolver

@MainActor
final class RepositoriesViewModel {
  // MARK: - Dependencies

  private let useCase: RepositoriesUseCaseProtocol = Resolver.resolve()

  // MARK: - Constants

  private enum Constants {
    static let privateStatus = "Private"
    static let publicStatus = "Public"
  }

  // MARK: - Properties

  @Published private(set) var repositoriesArray: [RepositoryViewItem] = []
  @Published private(set) var isSearchWorking = false
  @Published var searchText = ""
  @Published var isLoading = false

  // MARK: - Privates

  private func convert(_ repository: RepositoryProtocol)
    -> RepositoryViewItem
  {
    RepositoryViewItem(
      repositoryName: repository.repositoryName,
      repositoryPrivateStatus: setPrivateStatus(repository.isPrivate),
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
      license: repository.license
    )
  }

  private func setPrivateStatus(_ status: Bool?) -> String {
    (status ?? true) ? Constants.privateStatus : Constants.publicStatus
  }
}

// MARK: - RepositoriesViewModelProtocol

extension RepositoriesViewModel: RepositoriesViewModelProtocol {
  func fetchRepositories(with searchText: String) async {
    let repositories = await useCase.retrieve(using: searchText)
    repositoriesArray = repositories.map { repository in
      convert(repository)
    }
  }

  func checkSearchableText() {
    isSearchWorking = useCase.checkSearchState(for: searchText)
    if isSearchWorking {
      isLoading = useCase.notifyLoading()
      Task {
        await fetchRepositories(with: searchText)
        isLoading = useCase.stopLoading()
      }
    }
  }
}
