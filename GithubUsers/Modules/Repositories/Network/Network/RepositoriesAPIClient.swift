//
//  RepositoriesAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Resolver

protocol RepositoriesAPIClientProtocol {
  func getRepositories(
    parameters: RepositoriesSearchParametersProtocol
  ) async throws -> RepositoriesNetworkResponse?
}

// MARK: - RepositoriesAPIClientProtocol

class RepositoriesAPIClient: RepositoriesAPIClientProtocol {
  private let client: BaseAPIClientProtocol = Resolver.resolve()

  func getRepositories(
    parameters: RepositoriesSearchParametersProtocol
  ) async throws -> RepositoriesNetworkResponse? {
    let request = RepositoriesAPIRequest.getRepositories(parameters: parameters)
    var response: RepositoriesNetworkResponse?
    response = try await client.perform(request)
    return response
  }
}
