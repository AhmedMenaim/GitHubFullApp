//
//  MockUsersUseCase.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUsersUseCase: XCTestCase { }

extension MockUsersUseCase: UsersUseCaseProtocol {
  func fetchUsers() async throws -> [User] {
    [
      User(
        userName: "mojombo",
        image: "https://avatars.githubusercontent.com/u/1?v=4"
      ),
      User(
        userName: "defunkt",
        image: "https://avatars.githubusercontent.com/u/2?v=4"
      ),
      User(
        userName: "pjhyett",
        image: "https://avatars.githubusercontent.com/u/3?v=4"
      ),
    ]
  }

  func notifyLoading() -> Bool {
    true
  }

  func stopLoading() -> Bool {
    false
  }
}
