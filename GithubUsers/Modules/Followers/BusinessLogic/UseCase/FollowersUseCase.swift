//
//  FollowersUseCase.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation
import Factory

final class FollowersUseCase {
  // MARK: - Properties

  private var dataSource = Container.shared.followersDataSource()
  private let repository = Container.shared.followersRepository()
}

// MARK: - FollowersUseCaseProtocol

extension FollowersUseCase: FollowersUseCaseProtocol {
  func retrieveFollowers() async throws -> [Follower] {
    dataSource.isLoading = true
    guard let username = UserDefaults.standard.string(forKey: "Username") else { return [] }
    let parameters = FollowersParameters(username: username)
    guard let followers = try await repository.getFollowers(parameters: parameters) else {
      return []
    }
    dataSource.followersArray = followers.map { follower in
      Follower(
        userName: follower.userName ?? "",
        avatarURL: follower.avatarURL ?? ""
      )
    }
    dataSource.isLoading = false
    return dataSource.followersArray
  }

  func notifyLoading() -> Bool {
    dataSource.isLoading
  }

  func stopLoading() -> Bool {
    dataSource.isLoading
  }
}

// MARK: - FollowersParametersProtocol

private struct FollowersParameters: FollowersParametersProtocol {
  var username: String
}
