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

  func testUsersViewItems() async {
    await sut.fetchUsers()
    let users = sut.usersArray
    XCTAssertEqual(users.count, 3)
  }
}

// MARK: - UsersViewModelDependenciesProtocol
private struct UsersViewModelDependencies: UsersViewModelDependenciesProtocol {
  var useCase: UsersUseCaseProtocol
}
