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

  func test_returns_fetched_users_not_empty() async {
    do {
      let users = try await sut.fetchUsers()
      XCTAssertFalse(users.isEmpty)
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }

  func test_returns_correct_fetched_users_count() async {
    do {
      let users = try await sut.fetchUsers()
      XCTAssertEqual(users.count, 3)
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }

  func test_returns_correct_fetched_users_mapping() async {
    do {
      let users = try await sut.fetchUsers()
      XCTAssertEqual(users[0].userName, "mojombo")
      XCTAssertEqual(users[1].image, "https://avatars.githubusercontent.com/u/2?v=4")
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }
}

// MARK: - UsersUseCaseDependenciesProtocol

private struct UsersUseCaseDependencies: UsersUseCaseDependenciesProtocol {
  var dataSource: UsersDataSourceProtocol
  var repository: UsersRepositoryProtocol
}
