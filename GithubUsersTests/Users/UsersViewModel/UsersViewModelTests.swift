//
//  UsersViewModelTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class UsersViewModelTests: XCTestCase {

  private var sut: UsersViewModelProtocol!
  private let useCase = MockUsersUseCase()

  @MainActor override func setUp() {
    let dependencies = UsersViewModelDependencies(
      useCase: useCase
    )
    let viewModel = UsersViewModel(dependencies: dependencies)
    sut = viewModel
  }

  override func tearDown() {
      sut = nil
  }
  
  func test_returns_fetched_users_view_items_not_empty() async {
    await sut.fetchUsers()
    let users = sut.usersArray
    XCTAssertFalse(users.isEmpty)
  }

  func test_returns_correct_fetched_users_view_items_count() async {
    await sut.fetchUsers()
    let users = sut.usersArray
    XCTAssertEqual(users.count, 3)
  }

  func test_returns_correct_fetched_users_view_items_mapping() async {
    await sut.fetchUsers()
    let users = sut.usersArray
    XCTAssertEqual(users[0].userName, "mojombo")
    XCTAssertEqual(users[1].image, "https://avatars.githubusercontent.com/u/2?v=4")
  }
}

// MARK: - UsersViewModelDependenciesProtocol
private struct UsersViewModelDependencies: UsersViewModelDependenciesProtocol {
  var useCase: UsersUseCaseProtocol
}
