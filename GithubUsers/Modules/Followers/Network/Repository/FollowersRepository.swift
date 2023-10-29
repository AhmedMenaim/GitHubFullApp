//
//  FollowersRepository.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation
import Factory

struct FollowersRepository {
  private var client = Container.shared.followersAPIClient()
}

// MARK: - FollowersRepositoryProtocol

extension FollowersRepository: FollowersRepositoryProtocol {
  func getFollowers(parameters: FollowersParametersProtocol) async throws -> [FollowersRepositoryResponseProtocol]? {
    var followers: [FollowersRepositoryResponseProtocol]?
    do {
      followers = try await client.getFollowers(parameters: parameters)?.compactMap { follower in
        FollowersRepositoryResponse(
          userName: follower.userName,
          avatarURL: follower.avatarURL
        )
      }
    } catch {
      guard let error = error as? SessionDataTaskError else {
        throw RepositoryError.unowned
      }
      throw RepositoryError(error: error)
    }
    return followers
  }
}
