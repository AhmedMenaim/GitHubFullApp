//
//  FollowersAPIRequest.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation

enum FollowersAPIRequest: APIRequestConfiguration {
  case getFollowers(parameters: FollowersParametersProtocol)

  var method: HTTPMethod {
    switch self {
      case .getFollowers:
        return .GET
    }
  }

  var path: String {
    switch self {
      case .getFollowers(let parameters):
        return "https://api.github.com/users/\(parameters.username)/followers"
    }
  }

  var parameters: Parameters? {
    nil
  }

  var headers: HTTPHeaders? {
    nil
  }
}

protocol FollowersParametersProtocol {
  var username: String { get }
}
