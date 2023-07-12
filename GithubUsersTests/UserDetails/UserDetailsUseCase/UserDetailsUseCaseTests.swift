//
//  UserDetailsUseCaseTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 12/07/2023.
//

import XCTest
@testable import GithubUsers

final class UserDetailsUseCaseTests: XCTestCase {
  private var sut: UserDetailsUseCaseProtocol!

  override func setUp() {
    let dependencies = UserDetailsUseCaseDependencies(
      repository: MockUsersRepository(),
      dataSource: MockUserDetailsDataSource()
    )
    let useCase = UserDetailsUseCase(dependencies: dependencies)
    sut = useCase
  }

  override func tearDown() {
    sut = nil
  }

  func test_returns_fetched_user_details_not_nil() async {
    do {
      let userDetails = try await sut.retrieveUserDetails()
      XCTAssertNotNil(userDetails)
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }

  func test_returns_correct_fetched_user_details_mapping() async {
    do {
      let userDetails = try await sut.retrieveUserDetails()
      XCTAssertEqual(userDetails?.userName, "CryptoOo")
      XCTAssertEqual(userDetails?.avatarURL, "https://avatars.githubusercontent.com/u/26345314?v=4")
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }
}

// MARK: - UserDetailsUseCaseDependenciesProtocol

private struct UserDetailsUseCaseDependencies: UserDetailsUseCaseDependenciesProtocol {
  var repository: UsersRepositoryProtocol
  var dataSource: UserDetailsDataSourceProtocol
}
