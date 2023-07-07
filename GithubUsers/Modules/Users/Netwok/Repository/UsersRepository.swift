//
//  UsersRepository.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

struct UsersRepository {
  private let client = UsersAPIClient(client: BaseAPIClient())

  // MARK: - Privates

  private func convert(_ response: UserDetailsNetworkResponse?)
    -> UserDetailsRepositoryResponseProtocol
  {
    UserDetailsRepositoryResponse(
      userName: response?.userName,
      fullName: response?.fullName,
      company: response?.company,
      avatarURL: response?.avatarURL,
      userProfileURL: response?.userProfileURL,
      location: response?.location,
      bio: response?.bio,
      twitterUsername: response?.twitterUsername,
      numberOfPublicRepos: response?.numberOfPublicRepos,
      numberOfPublicGists: response?.numberOfPublicGists,
      numberOfFollowers: response?.numberOfFollowers,
      numberOfFollowing: response?.numberOfFollowing
    )
  }
}

// MARK: -  UsersRepositoryProtocol

extension UsersRepository: UsersRepositoryProtocol {
  func getUsers() async throws -> [UsersRepositoryResponseProtocol]? {
    var users: [UsersRepositoryResponseProtocol]?
    do {
      users = try await client.getUsers()?.compactMap { user in
        UsersRepositoryResponse(
          userName: user.userName,
          userID: user.userID,
          avatarURL: user.avatarURL,
          userProfileURL: user.userProfileURL
        )
      }
    } catch {
      guard let error = error as? SessionDataTaskError else {
        throw RepositoryError.unowned
      }
      throw RepositoryError(error: error)
    }
    return users
  }

  func getUserDetails(parameters: UserDetailsParametersProtocol)
    async throws -> UserDetailsRepositoryResponseProtocol?
  {
    var userDetails: UserDetailsRepositoryResponseProtocol?
    do {
      userDetails = try await convert(client.getUserDetails(parameters: parameters))
    } catch {
      guard let error = error as? SessionDataTaskError else {
        throw RepositoryError.unowned
      }
      throw RepositoryError(error: error)
    }
    return userDetails
  }
}
