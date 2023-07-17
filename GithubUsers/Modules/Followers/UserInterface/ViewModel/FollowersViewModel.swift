//
//  FollowersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

@MainActor
final class FollowersViewModel: ObservableObject {
  @Published private (set) var followersArray: [Follower] = []

  func fetchUserFollowers(with username: String) async {
    do {
      let followers = try await FollowersAPIClient.shared.getFollowers(username: username)
      self.followersArray = followers.map({ follower in
        Follower(
          userName: follower.userName ?? "",
          avatarURL: follower.avatarURL ?? ""
        )
      })
    } catch let error {
      print(error)
    }
  }
}
