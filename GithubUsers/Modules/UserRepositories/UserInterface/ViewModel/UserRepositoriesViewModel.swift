//
//  UserRepositoriesViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation
import Resolver

@MainActor
final class UserRepositoriesViewModel: ObservableObject {
  // MARK: - Dependencies

  private let useCase: UserRepositoriesUseCaseProtocol = Resolver.resolve()

  // MARK: - Constants

  private enum Constants {
    static let privateStatus = "Private"
    static let publicStatus = "Public"
  }

  // MARK: - Properties

  @Published var repositoriesArray: [UserRepositoryViewItem] = []
  @Published var isLoading = true

  // MARK: - Privates

  private func convert(_ repository: UserRepositoryProtocol)
    -> UserRepositoryViewItem
  {
    UserRepositoryViewItem(
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
      updatedAt: repository.updatedAt.formattedDateString(),
      licenseName: repository.licenseName
    )
  }

  private func setPrivateStatus(_ status: Bool?) -> String {
    (status ?? true) ? Constants.privateStatus : Constants.publicStatus
  }
}

// MARK: - UserRepositoriesViewModelProtocol

extension UserRepositoriesViewModel: UserRepositoriesViewModelProtocol {
  func repositoriesViewItems() async {
    isLoading = useCase.notifyLoading()
    let repositories = await useCase.retrieve()
    repositoriesArray = repositories.map { repository in
      convert(repository)
    }
    isLoading = useCase.stopLoading()
  }
}
