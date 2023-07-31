//
//  UserRepositoriesAPIRequest.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation

enum UserRepositoriesAPIRequest: APIRequestConfiguration {
  case getUserRepositories(parameters: UserRepositoriesSearchParametersProtocol)

  var method: HTTPMethod {
    switch self {
      case .getUserRepositories:
        return .GET
    }
  }

  var path: String {
    switch self {
      case .getUserRepositories(let parameters):
        return "https://api.github.com/users/\(parameters.username)/repos"
    }
  }

  var parameters: Parameters? {
    nil
  }

  var headers: HTTPHeaders? {
    nil
  }
}

protocol UserRepositoriesSearchParametersProtocol {
  var username: String { get }
}
