//
//  UsersRepositoryProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

protocol UsersRepositoryProtocol: UsersRepositoryGettable { }

protocol UsersRepositoryGettable {
  func getUsers() async throws -> [UsersRepositoryResponseProtocol]?
  func getUserDetails(parameters: UserDetailsParametersProtocol)
    async throws -> UserDetailsRepositoryResponseProtocol?
}

// MARK: - UsersRepositoryResponseProtocol

protocol UsersRepositoryResponseProtocol {
  var userName: String? { get }
  var userID: Int? { get }
  var avatarURL: String? { get }
}

struct UsersRepositoryResponse: UsersRepositoryResponseProtocol {
  var userName: String?
  var userID: Int?
  var avatarURL: String?
}

// MARK: - UserDetailsRepositoryResponseProtocol

protocol UserDetailsRepositoryResponseProtocol {
  var userName: String? { get }
  var fullName: String? { get }
  var company: String? { get }
  var avatarURL: String? { get }
  var userProfileURL: String? { get }
  var location: String? { get }
  var bio: String? { get }
  var twitterUsername: String? { get }
  var numberOfPublicRepos: Int? { get }
  var numberOfPublicGists: Int? { get }
  var numberOfFollowers: Int? { get }
  var numberOfFollowing: Int? { get }
}

struct UserDetailsRepositoryResponse: UserDetailsRepositoryResponseProtocol {
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
}
