//
//  MockUserDetailsUseCase.swift
//  GithubUsersTests
//
//  Created by Menaim on 12/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUserDetailsUseCase: XCTestCase { }

extension MockUserDetailsUseCase: UserDetailsUseCaseProtocol {
  func retrieveUserDetails() async throws -> UserDetailsItemProtocol? {
    UserDetailsItem(
      userName: "CryptoOo",
      fullName: "Ahmed Menaim",
      company: "Yassir",
      avatarURL: "https://avatars.githubusercontent.com/u/26345314?v=4",
      userProfileURL: "https://github.com/CryptoOo",
      location: "Cairo, Egypt",
      bio: "Senior iOS Software Engineer with +5 years of experience in the industry with solid knowledge in clean architecture, Design Patterns, SOLID Principles, etc...",
      twitterUsername: "",
      numberOfPublicRepos: 28,
      numberOfPublicGists: 19,
      numberOfFollowers: 35,
      numberOfFollowing: 4,
      statuses: UserDetailsItemStatuses(
        isBioExisted: true,
        isTwitterExisted: false,
        isLocationExisted: true,
        isWorkExisted: true
      )
    )
  }
}

// MARK: - UserDetailsItemProtocol

private struct UserDetailsItem: UserDetailsItemProtocol {
  var userName: String
  var fullName: String
  var company: String
  var avatarURL: String
  var userProfileURL: String
  var location: String
  var bio: String
  var twitterUsername: String
  var numberOfPublicRepos: Int
  var numberOfPublicGists: Int
  var numberOfFollowers: Int
  var numberOfFollowing: Int
  var statuses: UserDetailsItemStatusesProtocol
}

// MARK: - UserDetailsItemStatusesProtocol

private struct UserDetailsItemStatuses: UserDetailsItemStatusesProtocol {
  var isBioExisted: Bool
  var isTwitterExisted: Bool
  var isLocationExisted: Bool
  var isWorkExisted: Bool
}
