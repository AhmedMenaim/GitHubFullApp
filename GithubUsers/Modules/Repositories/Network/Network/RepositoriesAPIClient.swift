//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

protocol RepositoriesAPIClientProtocol {
  func getRepositories(searchText: String) async throws -> [RepositoryNetworkResponse]
}

class RepositoriesAPIClient: RepositoriesAPIClientProtocol {
  private let client: BaseAPIClientProtocol
  init(client: BaseAPIClientProtocol) {
    self.client = client
  }

  func getUsers() async throws -> [RepositoryNetworkResponse]? {
    let request = RepositoriesAPIRequest.getRepositories
    var repositories: [RepositoryNetworkResponse]?
    repositories = try await client.perform(request)
    return repositories
  }
}


class RepositoriesAPIClient: RepositoriesAPIClientProtocol {
  static let shared = RepositoriesAPIClient()

  func getRepositories(searchText: String) async throws -> [RepositoryNetworkResponse] {
    guard let url = URL(string: "https://api.github.com/search/repositories?q=\(searchText)") else {
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
    let decodedData = try decoder.decode(RepositoriesNetworkResponse.self, from: data)
    return decodedData.repositories ?? []
  }
}
