//
//  APIRequestConfiguration.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

protocol APIRequestConfiguration {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
  var headers: HTTPHeaders? { get }
}

extension APIRequestConfiguration {
  private var baseHeaders: HTTPHeaders {
    let headers = [
      "Content-Type": "application/json",
      "Accept": "application/json",
    ]
    /// If you are using authorized requests don't forget to add -> headers["Authorization"] = YOUR-TOKEN -> from keychain or whatever
    return headers
  }

  func asURLRequest() throws -> URLRequest {
    /// URL Components
    var components = components
    components.path = "/" + path

    /// Request
    var urlRequest = URLRequest(url: components.url!)
    if path.contains("https://") || path.contains("http://"),
       let url = URL(string: path) {
      urlRequest = URLRequest(url: url)
    }
    urlRequest.httpMethod = method.rawValue

    /// Headers
    /// If you need to add your own headers with the existed basic headers
    let requestHeaders = baseHeaders + headers
    requestHeaders.forEach {
      urlRequest.addValue($1, forHTTPHeaderField: $0)
    }

    /// Parameters you need to pass with the request
    if let parameters = parameters {
      do {
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
      } catch let error {
        throw error
      }
    }
    return urlRequest
  }

  /// For any URL Components especially if you are using Environment to specific in which Environment you are
  /// so you can change: 1. components.scheme = Assign the scheme you need
  /// 2. components.host = Assign the host you need
  var components: URLComponents {
    let components = URLComponents()
    return components
  }
}

enum HTTPMethod: String {
  case GET
  case POST
  case PUT
  case DELETE
  case PATCH
}

typealias HTTPHeaders = [String:String]
typealias Parameters = [String: Any]
