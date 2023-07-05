//
//  NetworkService.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import Foundation

protocol UsersAPIClientProtocol {
  func getUsers() async throws -> [UserNetworkResponse]
  func getUserDetails(username: String) async throws -> UserDetailsNetworkResponse?
}

class UsersAPIClient: UsersAPIClientProtocol {
  static let shared = UsersAPIClient()

  func getUsers() async throws -> [UserNetworkResponse] {
    guard let url = URL(string: "https://api.github.com/users") else {
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
    let decodedData = try decoder.decode([UserNetworkResponse].self, from: data)
    return decodedData
  }


  func getUserDetails(username: String) async throws -> UserDetailsNetworkResponse? {
    guard let url = URL(string: "https://api.github.com/users/\(username)") else {
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
      return nil
    }

    let decoder = JSONDecoder()
    let decodedData = try decoder.decode(UserDetailsNetworkResponse.self, from: data)
    return decodedData
  }
}

enum SessionDataTaskError: Error {
  case failWithError(Error)
  case noData
  case notFound
  case notAuthorized
  case server
  case noInternetConnection
}
