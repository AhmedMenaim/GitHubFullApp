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
  var avatarURL: String?
  var userProfileURL: String?

  enum CodingKeys: String, CodingKey {
  case userName = "login"
  case userID = "id"
  case avatarURL = "avatar_url"
  case userProfileURL = "html_url"
  }
}
