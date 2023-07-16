//
//  UsersViewModelTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 12/07/2023.
//

import XCTest
@testable import GithubUsers

final class UserDetailsViewModelTests: XCTestCase {
  private var sut: UserDetailsViewModelProtocol!
  private let useCase = MockUserDetailsUseCase()

  @MainActor
  override func setUp() {
    let dependencies = UserDetailsViewModelDependencies(
      useCase: useCase
    )
    let viewModel = UserDetailsViewModel(dependencies: dependencies)
    sut = viewModel
  }

  override func tearDown() {
    sut = nil
  }

  func test_returns_fetched_user_details_view_item_not_nil() async {
    await sut.userDetailsViewItem()
    let userDetails = sut.userDetails
    XCTAssertNotNil(userDetails)
  }

  func test_returns_correct_fetched_UserDetails_view_items_mapping() async {
    await sut.userDetailsViewItem()
    let userDetails = sut.userDetails
    XCTAssertEqual(userDetails?.userName, "CryptoOo")
    XCTAssertEqual(userDetails?.fullName, "Ahmed Menaim")
    XCTAssertEqual(userDetails?.avatarURL, "https://avatars.githubusercontent.com/u/26345314?v=4")
    XCTAssertEqual(userDetails?.statuses.isTwitterExisted, false)
  }
}

// MARK: - UserDetailsViewModelDependenciesProtocol

private struct UserDetailsViewModelDependencies: UserDetailsViewModelDependenciesProtocol {
  var useCase: UserDetailsUseCaseProtocol
}