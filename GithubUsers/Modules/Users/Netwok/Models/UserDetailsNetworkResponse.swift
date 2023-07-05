//
//  UserDetailsNetworkResponse.swift
//  GithubUsers
//
//  Created by Menaim on 02/07/2023.
//

import Foundation

struct UserDetailsNetworkResponse: Codable {
  var userName: String?
  var fullName: String?
  var company: String?
  var avatarURL: String?
  var userProfileURL: String?
  var location: String?
  var bio: String?
  var twitterUsername: String?
  var numberOfPublicRepos: Int?
  var numberOfPublicGists: Int?
  var numberOfFollowers: Int?
  var numberOfFollowing: Int?

  enum CodingKeys: String, CodingKey {
    case userName = "login"
    case fullName = "name"
    case company
    case avatarURL = "avatar_url"
    case userProfileURL = "html_url"
    case location
    case bio
    case twitterUsername = "twitter_username"
    case numberOfPublicRepos = "public_repos"
    case numberOfPublicGists = "public_gists"
    case numberOfFollowers = "followers"
    case numberOfFollowing = "following"
  }
}
