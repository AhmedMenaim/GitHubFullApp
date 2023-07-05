//
//  FollowersAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Foundation

/// All commented code here is being left as documentation for the previous implementation before using Async/Await to be able to check the difference👌🏻
/// The code will be left in FOLLOWERS MODULE only and will be removed from other modules.♻️

protocol FollowersAPIClientProtocol {
//  func getUserFollowers(
//    username: String,
//    completion: @escaping (Result<[FollowersNetworkResponse],
//                           SessionDataTaskError>) -> Void
//  )

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

//  func getUserFollowers(
//    username: String,
//    completion: @escaping (Result<[FollowersNetworkResponse], SessionDataTaskError>) -> Void
//  ) {
//    guard let url = URL(string: "https://api.github.com/users/\(username)/followers") else {
//      completion(.failure(.notFound))
//      return
//    }
//    let session = URLSession.shared
//    let request = URLRequest(url: url)
//    session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//
//      if let error = error,
//         let response = response as? HTTPURLResponse {
//        let statusCode = response.statusCode
//        switch statusCode {
//            /// 1020 means dataNotAllowed -> Internet is closed
//            /// 1009 Internet is opened but no connection happens
//          case 1009, 1020:
//            completion(.failure(.noInternetConnection))
//            return
//          case 404:
//            completion(.failure(.notFound))
//            return
//          case 400:
//            completion(.failure(.notAuthorized))
//            return
//          case 500 ... 599:
//            completion(.failure(.server))
//            return
//          default:
//            completion(.failure(SessionDataTaskError.failWithError(error)))
//            return
//        }
//      }
//      guard let data = data
//      else {
//        completion(.failure(SessionDataTaskError.noData))
//        return
//      }
//      do {
//        let decoder = JSONDecoder()
//        let response = try decoder.decode([FollowersNetworkResponse].self, from: data)
//        debugPrint(response)
//        completion(.success(response))
//
//      } catch {
//        completion(.failure(SessionDataTaskError.failWithError(error)))
//      }
//    }).resume()
//  }
//}
