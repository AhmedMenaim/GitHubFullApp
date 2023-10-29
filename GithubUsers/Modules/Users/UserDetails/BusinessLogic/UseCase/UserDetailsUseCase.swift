//
//  UserDetailsUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import Foundation
import Factory

final class UserDetailsUseCase {
  // MARK: - Properties

  private var dataSource = Container.shared.userDetailsDataSource()
  private var repository = Container.shared.usersRepository()

  // MARK: - Privates

  private func convert(_ response: UserDetailsRepositoryResponseProtocol)
    -> UserDetailsItemProtocol
  {
    UserDetailsItem(
      userName: response.userName ?? "",
      fullName: response.fullName ?? "",
      company: response.company ?? "",
      avatarURL: response.avatarURL ?? "",
      userProfileURL: response.userProfileURL ?? "",
      location: response.location ?? "",
      bio: response.bio ?? "",
      twitterUsername: response.twitterUsername ?? "",
      numberOfPublicRepos: response.numberOfPublicRepos ?? 0,
      numberOfPublicGists: response.numberOfPublicGists ?? 0,
      numberOfFollowers: response.numberOfFollowers ?? 0,
      numberOfFollowing: response.numberOfFollowing ?? 0,
      statuses: UserDetailsItemStatuses(
        isBioExisted: !(response.bio?.isEmpty ?? true),
        isTwitterExisted: !(response.twitterUsername?.isEmpty ?? true),
        isLocationExisted: !(response.location?.isEmpty ?? true),
        isWorkExisted: !(response.company?.isEmpty ?? true)
      )
    )
  }
}

// MARK: - UserDetailsUseCaseProtocol

extension UserDetailsUseCase: UserDetailsUseCaseProtocol {
  func retrieveUserDetails() async throws -> UserDetailsItemProtocol? {
    guard let username = UserDefaults.standard.string(forKey: "Username") else { return nil }
    dataSource.username = username
    let parameters = UserDetailsParameters(username: username)
    guard let userDetailsResponse = try await repository.getUserDetails(parameters: parameters) else {
      return nil
    }
    let userDetails = convert(userDetailsResponse)
    return userDetails
  }

  func setUsername() {
    UserDefaults.standard.set(dataSource.username, forKey: "Username")
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

// MARK: - UserDetailsViewItemStatusesProtocol

private struct UserDetailsItemStatuses: UserDetailsItemStatusesProtocol {
  var isBioExisted: Bool
  var isTwitterExisted: Bool
  var isLocationExisted: Bool
  var isWorkExisted: Bool
}

// MARK: - UserDetailsParametersProtocol

private struct UserDetailsParameters: UserDetailsParametersProtocol {
  var username: String
}
