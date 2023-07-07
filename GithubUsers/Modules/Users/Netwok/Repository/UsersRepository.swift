//
//  UsersRepository.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

struct UsersRepository {
  private let client = UsersAPIClient(client: BaseAPIClient())
}

// MARK: -  UsersRepositoryProtocol
extension UsersRepository: UsersRepositoryProtocol {
  func getUsers() async throws -> [UsersRepositoryResponseProtocol]? {
    var users: [UsersRepositoryResponseProtocol]?
    do {
      users = try await client.getUsers()?.compactMap({ user in
        UsersRepositoryResponse(
          userName: user.userName,
          userID: user.userID,
          avatarURL: user.avatarURL,
          userProfileURL: user.userProfileURL
        )
      })
    }
    catch let error {
      guard let error = error as? SessionDataTaskError else {
        throw RepositoryError.unowned
      }
      throw RepositoryError(error: error)
    }
    return users
  }
}
