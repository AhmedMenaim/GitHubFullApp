//
//  UsersUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

protocol UsersUseCaseDependenciesProtocol {
  var dataSource: UsersDataSourceProtocol { get }
  var repository: UsersRepositoryProtocol { get }
}

final class UsersUseCase {
  // MARK: - Properties

  private var dataSource: UsersDataSourceProtocol
  private let repository: UsersRepositoryProtocol

  // MARK: - Init

  init(dependencies: UsersUseCaseDependenciesProtocol) {
    self.dataSource = dependencies.dataSource
    self.repository = dependencies.repository
  }
}

// MARK: - UsersUseCaseProtocol

extension UsersUseCase: UsersUseCaseProtocol {
  func fetchUsers() async throws -> [User] {
    dataSource.isLoading = true
    guard let users = try await repository.getUsers() else {
      return []
    }
    dataSource.usersArray = users.map { user in
      User(
        userName: user.userName ?? "",
        image: user.avatarURL ?? ""
      )
    }
    dataSource.isLoading = false
    return dataSource.usersArray
  }

  func notifyLoading() -> Bool {
    dataSource.isLoading
  }

  func stopLoading() -> Bool {
    dataSource.isLoading
  }
}
