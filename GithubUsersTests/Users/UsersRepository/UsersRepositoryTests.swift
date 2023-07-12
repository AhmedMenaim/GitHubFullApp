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

  func testGetUsers() async {
    do {
      let users = try await sut.getUsers() ?? []
      XCTAssertEqual(users.count, 4)
      XCTAssertEqual(users[0].userName, "mojombo")
    } catch let error {
      XCTAssertNotNil(error, "Error existed ❌")
    }
  }

  func testGetUserDetails() async {
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
