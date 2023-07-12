//
//  UsersRepositoryTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class UsersRepositoryTests: XCTestCase {

  private var sut: UsersRepositoryProtocol!
  private let mockUsersAPIClient = MockUsersAPIClient()

  override func setUp() {
    let dependencies = UsersRepositoryDependencies(
      client: mockUsersAPIClient
    )
    let repository = UsersRepository(dependencies: dependencies)
    sut = repository
  }

  override func tearDown() {
      sut = nil
  }

  // MARK: - Users
  func test_returns_correct_fetched_users_not_empty() async {
    do {
      let users = try await sut.getUsers() ?? []
      XCTAssertFalse(users.isEmpty)
    } catch let error {
      XCTAssertNotNil(error, "Error existed ❌")
    }
  }

  func test_returns_correct_fetched_users_count() async {
    do {
      let users = try await sut.getUsers() ?? []
      XCTAssertEqual(users.count, 4)
    } catch let error {
      XCTAssertNotNil(error, "Error existed ❌")
    }
  }

  func test_returns_correct_fetched_users_mapping() async {
    do {
      let users = try await sut.getUsers() ?? []
      XCTAssertEqual(users[0].avatarURL, "https://avatars.githubusercontent.com/u/1?v=4")
      XCTAssertEqual(users[1].userName, "defunkt")
      XCTAssertEqual(users[2].avatarURL, "https://avatars.githubusercontent.com/u/3?v=4")
    } catch let error {
      XCTAssertNotNil(error, "Error existed ❌")
    }
  }

  // MARK: - UserDetails

  func test_returns_correct_fetched_user_details_mapping() async {
    do {
      let userDetails = try await sut.getUserDetails(parameters: UserDetailsParameters(username: "CryptoOo"))
      XCTAssertEqual(userDetails?.company, "Yassir")
      XCTAssertEqual(userDetails?.twitterUsername, nil)
    } catch let error {
      XCTAssertNotNil(error, "Error existed ❌")
    }
  }
}

// MARK: - UserDetailsParametersProtocol
private struct UserDetailsParameters: UserDetailsParametersProtocol {
  var username: String
}

// MARK: - UsersRepositoryDependenciesProtocol
private struct UsersRepositoryDependencies: UsersRepositoryDependenciesProtocol {
  var client: UsersAPIClientProtocol
}
