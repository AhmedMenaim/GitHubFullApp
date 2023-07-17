//
//  FollowersUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation

protocol FollowersUseCaseProtocol {
  func retrieveFollowers() async throws -> [Follower]
  func notifyLoading() -> Bool
  func stopLoading() -> Bool
}

struct Follower: Identifiable {
  var id = UUID()
  var userName: String
  var avatarURL: String
}
