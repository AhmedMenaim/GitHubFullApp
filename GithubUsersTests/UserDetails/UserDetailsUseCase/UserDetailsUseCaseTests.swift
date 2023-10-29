//
//  UserDetailsUseCaseTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 12/07/2023.
//

import Factory
import XCTest
@testable import GithubUsers

final class UserDetailsUseCaseTests: XCTestCase {
  private var sut: UserDetailsUseCaseProtocol!
  private var dataSource: UserDetailsDataSourceProtocol!
  private var repository: UsersRepositoryProtocol!

  override func setUp() {
    Container.shared.userDetailsDataSource.register { MockUserDetailsDataSource() }
    Container.shared.usersRepository.register { MockUsersRepository() }
    let useCase = UserDetailsUseCase()
    sut = useCase
  }

  override func tearDown() {
    dataSource = nil
    repository = nil
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
