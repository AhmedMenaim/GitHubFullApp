//
//  UsersUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Factory

final class UsersUseCase {
  // MARK: - Dependencies

  private var dataSource = Container.shared.usersDataSource()
  private var repository = Container.shared.usersRepository()
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
