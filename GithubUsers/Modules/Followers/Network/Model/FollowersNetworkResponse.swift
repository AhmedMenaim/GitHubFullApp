//
//  FollowersNetworkResponse.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Foundation

struct FollowersNetworkResponse: Codable {
  var userName: String?
  var avatarURL: String?

  enum CodingKeys: String, CodingKey {
  case userName = "login"
  case avatarURL = "avatar_url"
  }
}

struct Follower: Identifiable {
  var id = UUID()
  var userName: String
  var avatarURL: String
}
