//
//  FollowersRepositoryProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation

protocol FollowersRepositoryProtocol: FollowersRepositoryGettable { }

protocol FollowersRepositoryGettable {
  func getFollowers(parameters: FollowersParametersProtocol) async throws -> [FollowersRepositoryResponseProtocol]?
}

// MARK: - FollowersRepositoryResponseProtocol

protocol FollowersRepositoryResponseProtocol {
  var userName: String? { get }
  var avatarURL: String? { get }
}

struct FollowersRepositoryResponse: FollowersRepositoryResponseProtocol {
  var userName: String?
  var avatarURL: String?
}
