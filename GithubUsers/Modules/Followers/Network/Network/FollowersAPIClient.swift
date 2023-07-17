//
//  FollowersAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Foundation
import Resolver

protocol FollowersAPIClientProtocol {
  func getFollowers(parameters: FollowersParametersProtocol) async throws -> [FollowersNetworkResponse]?
}

class FollowersAPIClient: FollowersAPIClientProtocol {
  private let client: BaseAPIClientProtocol = Resolver.resolve()

  func getFollowers(parameters: FollowersParametersProtocol) async throws -> [FollowersNetworkResponse]? {
    let request = FollowersAPIRequest.getFollowers(parameters: parameters)
    var followers: [FollowersNetworkResponse]?
    followers = try await client.perform(request)
    return followers
  }
}
