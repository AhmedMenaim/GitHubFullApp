//
//  FollowersAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Foundation

protocol FollowersAPIClientProtocol {
  func getUserFollowers(
    username: String,
    completion: @escaping (Result<[FollowersNetworkResponse],
                           SessionDataTaskError>) -> Void
  )
}

class FollowersAPIClient: FollowersAPIClientProtocol {
  static let shared = FollowersAPIClient()

  func getUserFollowers(
    username: String,
    completion: @escaping (Result<[FollowersNetworkResponse], SessionDataTaskError>) -> Void
  ) {
    guard let url = URL(string: "https://api.github.com/users/\(username)/followers") else {
      completion(.failure(.notFound))
      return
    }
    let session = URLSession.shared
    let request = URLRequest(url: url)
    session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

      if let error = error,
         let response = response as? HTTPURLResponse {
          let statusCode = response.statusCode
          switch statusCode {
              /// 1020 means dataNotAllowed -> Internet is closed
              /// 1009 Internet is opened but no connection happens
            case 1009, 1020:
              completion(.failure(.noInternetConnection))
              return
            case 404:
              completion(.failure(.notFound))
              return
            case 400:
              completion(.failure(.notAuthorized))
              return
            case 500 ... 599:
              completion(.failure(.server))
              return
            default:
              completion(.failure(SessionDataTaskError.failWithError(error)))
              return
          }
      }
      guard let data = data
      else {
        completion(.failure(SessionDataTaskError.noData))
        return
      }
      do {
        let decoder = JSONDecoder()
        let response = try decoder.decode([FollowersNetworkResponse].self, from: data)
        debugPrint(response)
        completion(.success(response))

      } catch {
        completion(.failure(SessionDataTaskError.failWithError(error)))
      }
    }).resume()
  }
}
