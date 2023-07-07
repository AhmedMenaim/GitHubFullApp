//
//  RepositoryError.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import Foundation

enum RepositoryError: Error {
  case noInternetConnection
  case notFound
  case notAuthorized
  case server
  case noData
  case unowned

  init(error: SessionDataTaskError) {
    switch error {
      case .noInternetConnection:
        self = .noInternetConnection
      case .server:
        self = .server
      case .notFound:
        self = .notFound
      case .notAuthorized:
        self = .notAuthorized
      default:
        self = .unowned
    }
  }
}
