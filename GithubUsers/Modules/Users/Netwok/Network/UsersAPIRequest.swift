//
//  UsersAPIRouter.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

enum UsersAPIRequest: APIRequestConfiguration {
  case getUsers
  case getUserDetails(parameters: UserDetailsParametersProtocol)

  var method: HTTPMethod {
    switch self {
      case .getUsers:
        return .GET
      case .getUserDetails:
        return .GET
    }
  }

  var path: String {
    switch self {
      case .getUsers:
        return "https://api.github.com/users"
      case .getUserDetails(let parameters):
        return "https://api.github.com/users/\(parameters.username)"
    }
  }

  var parameters: Parameters? {
    nil
  }

  var headers: HTTPHeaders? {
    nil
  }
}

protocol UserDetailsParametersProtocol {
  var username: String { get }
}
