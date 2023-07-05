//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

protocol UserRepositoriesAPIClientProtocol {
  func getUserRepositories(username: String) async throws -> [UserRepositoriesNetworkResponse]
}

class UserRepositoriesAPIClient: UserRepositoriesAPIClientProtocol {
  static let shared = UserRepositoriesAPIClient()

  func getUserRepositories(username: String) async throws -> [UserRepositoriesNetworkResponse] {
    guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else {
      throw SessionDataTaskError.notFound
    }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse,
          response.statusCode == 200
    else {
      if let response = response as? HTTPURLResponse {
        let statusCode = response.statusCode
        switch statusCode {
            /// 1020 means dataNotAllowed -> Internet is closed
            /// 1009 Internet is opened but no connection happens
          case 1009, 1020:
            throw SessionDataTaskError.noInternetConnection
          case 404:
            throw SessionDataTaskError.notFound
          case 400:
            throw SessionDataTaskError.notAuthorized
          case 500 ... 599:
            throw SessionDataTaskError.server
          default:
            throw SessionDataTaskError.noData
        }
      }
      return []
    }
    let decoder = JSONDecoder()
    let decodedData = try decoder.decode([UserRepositoriesNetworkResponse].self, from: data)
    return decodedData
  }
}
