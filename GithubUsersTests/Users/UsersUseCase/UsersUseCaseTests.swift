//
//  UsersUseCaseTests.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import Factory
import XCTest
@testable import GithubUsers

final class UsersUseCaseTests: XCTestCase {
  private var sut: UsersUseCaseProtocol!

  override func setUp() {
    Container.shared.usersDataSource.register { MockUsersDataSource() }
    Container.shared.usersRepository.register { MockUsersRepository() }
    let useCase = UsersUseCase()
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

  func test_returns_loading_starting_status() {
    let actualValue = sut.notifyLoading()
    XCTAssertEqual(actualValue, true)
  }

  func test_returns_loading_stopped_status_before_fetching_users() {
    let actualValue = sut.stopLoading()
    XCTAssertEqual(actualValue, true)
  }

  func test_returns_loading_stopped_status_after_fetching_users() async {
    do {
      let _ = try await sut.fetchUsers()
      let actualValue = sut.stopLoading()
      XCTAssertEqual(actualValue, false)
    } catch {
      XCTAssertNotNil(error, "Test failed because of the \(error)")
    }
  }
}
