//
//  SessionDataTaskError.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

enum SessionDataTaskError: Error {
  case failWithError(Error)
  case noData
  case notFound
  case notAuthorized
  case server
  case noInternetConnection
}
