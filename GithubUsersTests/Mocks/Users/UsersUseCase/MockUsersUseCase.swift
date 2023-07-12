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
        name: "1",
        userName: "mojombo",
        image: "https://avatars.githubusercontent.com/u/1?v=4"
      ),
      User(
        name: "2",
        userName: "defunkt",
        image: "https://avatars.githubusercontent.com/u/2?v=4"
      ),
      User(
        name: "3",
        userName: "pjhyett",
        image: "https://avatars.githubusercontent.com/u/3?v=4"
      ),
    ]
  }
}
