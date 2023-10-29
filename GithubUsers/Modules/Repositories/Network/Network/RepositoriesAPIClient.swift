//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Factory

protocol RepositoriesAPIClientProtocol {
  func getRepositories(
    parameters: RepositoriesSearchParametersProtocol
  ) async throws -> RepositoriesNetworkResponse?
}

// MARK: - RepositoriesAPIClientProtocol

class RepositoriesAPIClient: RepositoriesAPIClientProtocol {
  private let client = Container.shared.baseAPIClient()

  func getRepositories(
    parameters: RepositoriesSearchParametersProtocol
  ) async throws -> RepositoriesNetworkResponse? {
    let request = RepositoriesAPIRequest.getRepositories(parameters: parameters)
    var response: RepositoriesNetworkResponse?
    response = try await client.perform(request)
    return response
  }
}
