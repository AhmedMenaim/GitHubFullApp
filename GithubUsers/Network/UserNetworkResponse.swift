//
//  UserNetworkResponse.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import Foundation

struct UserNetworkResponse: Codable {
  var userName: String?
  var userID: Int?
  var nodeID: String?
  var avatarURL: String?
  var userProfileURL: String?
  var followersURL: String?
  var followingURL: String?
  var gistsURL: String?
  var starredURL: String?
  var repositoriesURL: String?

  enum CodingKeys: String, CodingKey {
  case userName = "login"
  case userID = "id"
  case nodeID = "node_id"
  case avatarURL = "avatar_url"
  case userProfileURL = "url"
  case followersURL = "followers_url"
  case followingURL = "following_url"
  case gistsURL = "gists_url"
  case starredURL = "starred_url"
  case repositoriesURL = "repos_url"
  }
}
