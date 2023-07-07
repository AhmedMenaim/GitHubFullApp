//
//  UserDetailsUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import Foundation

protocol UserDetailsUseCaseProtocol {
  func retrieveUserDetails() async throws -> UserDetailsItemProtocol?
}

protocol UserDetailsItemStatusesProtocol {
  var isBioExisted: Bool { get }
  var isTwitterExisted: Bool { get }
  var isLocationExisted: Bool { get }
  var isWorkExisted: Bool { get }
}

protocol UserDetailsItemProtocol {
  var userName: String { get }
  var fullName: String { get }
  var company: String { get }
  var avatarURL: String { get }
  var userProfileURL: String { get }
  var location: String { get }
  var bio: String { get }
  var twitterUsername: String { get }
  var numberOfPublicRepos: Int { get }
  var numberOfPublicGists: Int { get }
  var numberOfFollowers: Int { get }
  var numberOfFollowing: Int { get }
  var statuses: UserDetailsItemStatusesProtocol { get }
}
