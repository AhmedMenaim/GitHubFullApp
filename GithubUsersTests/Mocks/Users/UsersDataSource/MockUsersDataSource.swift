//
//  MockUsersDataSource.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUsersDataSource: XCTestCase {
  var users: [User] = []
  var isLoadingWorking = true
}

extension MockUsersDataSource: UsersDataSourceProtocol {
  var isLoading: Bool {
    get {
      isLoadingWorking
    }
    set {
      isLoadingWorking = newValue
    }
  }

  var usersArray: [User] {
    get {
      users
    }
    set {
      users = newValue
    }
  }
}
