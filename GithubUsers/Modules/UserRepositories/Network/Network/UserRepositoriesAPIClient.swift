//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Factory

protocol UserRepositoriesAPIClientProtocol {
  func getUserRepositories(parameters: UserRepositoriesSearchParametersProtocol) async throws
    -> [UserRepositoriesNetworkResponse]?
}

// MARK: - UserRepositoriesAPIClientProtocol
class UserRepositoriesAPIClient: UserRepositoriesAPIClientProtocol {
  private let client = Container.shared.baseAPIClient()

  func getUserRepositories(parameters: UserRepositoriesSearchParametersProtocol) async throws -> [UserRepositoriesNetworkResponse]? {

    let request = UserRepositoriesAPIRequest.getUserRepositories(parameters: parameters)
    var response: [UserRepositoriesNetworkResponse]?
    response = try await client.perform(request)
    return response
  }
}
