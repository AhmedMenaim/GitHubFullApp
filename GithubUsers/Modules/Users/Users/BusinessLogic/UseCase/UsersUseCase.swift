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
    guard let users = try await repository.getUsers() else {
      return []
    }
    dataSource.usersArray = users.map { user in
      User(
        name: "\(user.userID ?? 0)",
        userName: user.userName ?? "",
        image: user.avatarURL ?? ""
      )
    }
    return dataSource.usersArray
  }
}
