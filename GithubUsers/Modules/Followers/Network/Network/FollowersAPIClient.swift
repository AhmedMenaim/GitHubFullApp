//
//  FollowersAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Foundation

protocol FollowersAPIClientProtocol {
  func getFollowers(username: String) async throws -> [FollowersNetworkResponse]
}

class FollowersAPIClient: FollowersAPIClientProtocol {
  static let shared = FollowersAPIClient()

  func getFollowers(username: String) async throws -> [FollowersNetworkResponse] {
    guard let url = URL(string: "https://api.github.com/users/\(username)/followers") else {
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
    let decodedData = try decoder.decode([FollowersNetworkResponse].self, from: data)
    return decodedData
  }
}
