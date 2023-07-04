//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

protocol UserRepositoriesAPIClientProtocol {
  func getUserRepositories(
    username: String,
    completion: @escaping (Result<[UserRepositoriesNetworkResponse],
                           SessionDataTaskError>) -> Void
  )
}

class UserRepositoriesAPIClient: UserRepositoriesAPIClientProtocol {
  static let shared = UserRepositoriesAPIClient()

  func getUserRepositories(
    username: String,
    completion: @escaping (Result<[UserRepositoriesNetworkResponse], SessionDataTaskError>) -> Void
  ) {
    guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else {
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
        let response = try decoder.decode([UserRepositoriesNetworkResponse].self, from: data)
        debugPrint(response)
        completion(.success(response))

      } catch {
        completion(.failure(SessionDataTaskError.failWithError(error)))
      }
    }).resume()
  }
}
