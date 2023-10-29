//
//  MockUserDetailsDataSource.swift
//  GithubUsersTests
//
//  Created by Menaim on 12/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUserDetailsDataSource: XCTestCase {
  var newUsername = "CryptoOo"
}

extension MockUserDetailsDataSource: UserDetailsDataSourceProtocol {
  var username: String {
    get {
      newUsername
    }
    set {
      newUsername = newValue
    }
  }
}
