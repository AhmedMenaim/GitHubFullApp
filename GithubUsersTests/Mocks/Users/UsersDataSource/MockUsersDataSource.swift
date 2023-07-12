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
}

extension MockUsersDataSource: UsersDataSourceProtocol {

  var usersArray: [User] {
    get {
      return users
    }
    set {
      self.users = newValue
    }
  }
}
