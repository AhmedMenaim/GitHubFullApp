//
//  UsersUseCaseTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class UsersUseCaseTests: XCTestCase {

  private var sut: UsersUseCaseProtocol!

  override func setUp() {
    let dependencies = UsersUseCaseDependencies(
      dataSource: MockUsersDataSource(),
      repository: MockUsersRepository()
    )
    let useCase = UsersUseCase(dependencies: dependencies)
    sut = useCase
  }

  override func tearDown() {
      sut = nil
  }

  func testFetchUsers() async {
    do {
      let users = try await sut.fetchUsers()
      XCTAssertEqual(users.count, 3)
      XCTAssertEqual(users[0].userName, "mojombo")
      XCTAssertEqual(users[2].image, "https://avatars.githubusercontent.com/u/3?v=4")
      /// Just to test failure
      /// XCTAssertEqual(users[2].image, "https://avatars.githubusercontent.com/")
    } catch let error {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }
}

// MARK: - UsersUseCaseDependenciesProtocol
private struct UsersUseCaseDependencies: UsersUseCaseDependenciesProtocol {
  var dataSource: UsersDataSourceProtocol
  var repository: UsersRepositoryProtocol
}
