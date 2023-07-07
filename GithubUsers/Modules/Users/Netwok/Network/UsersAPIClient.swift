//
//  NetworkService.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import Foundation

protocol UsersAPIClientProtocol {
  func getUsers() async throws -> [UserNetworkResponse]?
  func getUserDetails(parameters: UserDetailsParametersProtocol) async throws -> UserDetailsNetworkResponse?
}

class UsersAPIClient: UsersAPIClientProtocol {
  let client: BaseAPIClientProtocol
  init(client: BaseAPIClientProtocol) {
    self.client = client
  }

  func getUsers() async throws -> [UserNetworkResponse]? {
    let request = UsersAPIRequest.getUsers
    var users: [UserNetworkResponse]?
    users = try await client.perform(request)
    return users
  }

  func getUserDetails(parameters: UserDetailsParametersProtocol)
    async throws -> UserDetailsNetworkResponse?
  {
    let request = UsersAPIRequest.getUserDetails(parameters: parameters)
    var userDetails: UserDetailsNetworkResponse?
    userDetails = try await client.perform(request)
    return userDetails
  }
}
