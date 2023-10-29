//
//  UsersViewModelTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import Factory
import XCTest
@testable import GithubUsers

final class UsersViewModelTests: XCTestCase {
  private var sut: (any UsersViewModelProtocol)?

  @MainActor
  override func setUp() {
    Container.shared.usersUseCase.register { MockUsersUseCase() }
    let viewModel = UsersViewModel()
    sut = viewModel
  }

  override func tearDown() {
    sut = nil
  }

  func test_returns_fetched_users_view_items_not_empty() async {
    await sut?.fetchUsers()
    let users = sut!.usersArray
    XCTAssertFalse(users.isEmpty)
  }

  func test_returns_correct_fetched_users_view_items_count() async {
    await sut?.fetchUsers()
    let users = sut!.usersArray
    XCTAssertEqual(users.count, 3)
  }

  func test_returns_correct_fetched_users_view_items_mapping() async {
    await sut!.fetchUsers()
    let users = sut!.usersArray
    XCTAssertEqual(users[0].userName, "mojombo")
    XCTAssertEqual(users[1].image, "https://avatars.githubusercontent.com/u/2?v=4")
  }
}
