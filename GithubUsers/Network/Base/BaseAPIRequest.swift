//
//  BaseAPIRouter.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

enum BaseAPIRequest: APIRequestConfiguration {

  // MARK: - HTTPMethod
  internal var method: HTTPMethod {
    switch self {
      default:
        return .GET
    }
  }

  // MARK: - Path
  internal var path: String {
    return ""
  }

  // MARK: - Parameters
  internal var parameters: Parameters? {
    return [:]
  }

  // MARK: - Headers
  internal var headers: HTTPHeaders? {
    return nil
  }
}
