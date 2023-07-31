//
//  RepositoriesAPIRequest.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Foundation

enum RepositoriesAPIRequest: APIRequestConfiguration {
  case getRepositories(parameters: RepositoriesSearchParametersProtocol)

  var method: HTTPMethod {
    switch self {
      case .getRepositories:
        return .GET
    }
  }

  var path: String {
    switch self {
      case .getRepositories(let parameters):
        return "https://api.github.com/search/repositories?q=\(parameters.searchableText)"
    }
  }

  var parameters: Parameters? {
    nil
  }

  var headers: HTTPHeaders? {
    nil
  }
}

protocol RepositoriesSearchParametersProtocol {
  var searchableText: String { get }
}
