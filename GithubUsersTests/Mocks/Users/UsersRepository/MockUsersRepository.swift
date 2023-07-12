//
//  MockUsersRepository.swift
//  GithubUsersTests
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUsersRepository { }

extension MockUsersRepository: UsersRepositoryProtocol {
  func getUsers() async throws -> [UsersRepositoryResponseProtocol]? {
    [
      UsersRepositoryResponse(
        userName: "mojombo",
        userID: 1,
        avatarURL: "https://avatars.githubusercontent.com/u/1?v=4"
      ),
      UsersRepositoryResponse(
        userName: "defunkt",
        userID: 2,
        avatarURL: "https://avatars.githubusercontent.com/u/2?v=4"
      ),
      UsersRepositoryResponse(
        userName: "pjhyett",
        userID: 3,
        avatarURL: "https://avatars.githubusercontent.com/u/3?v=4"
      ),
    ]
  }

  func getUserDetails(parameters: UserDetailsParametersProtocol) async throws
    -> (UserDetailsRepositoryResponseProtocol)?
  {
    UserDetailsRepositoryResponse(
      userName: "CryptoOo",
      fullName: "Ahmed Menaim",
      company: "Yassir",
      avatarURL: "https://avatars.githubusercontent.com/u/26345314?v=4",
      userProfileURL: "https://github.com/CryptoOo",
      location: "Cairo, Egypt",
      bio: "Senior iOS Software Engineer with +5 years of experience in the industry with solid knowledge in clean architecture, Design Patterns, SOLID Principles, etc...",
      twitterUsername: nil,
      numberOfPublicRepos: 28,
      numberOfPublicGists: 19,
      numberOfFollowers: 35,
      numberOfFollowing: 4
    )
  }
}
