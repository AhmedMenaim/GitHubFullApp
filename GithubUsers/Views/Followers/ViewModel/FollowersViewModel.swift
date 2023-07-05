//
//  FollowersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

/// All commented code here is being left as documentation for the previous implementation before using Async/Await to be able to check the difference👌🏻
/// The code will be left in FOLLOWERS MODULE only and will be removed from other modules.♻️

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

  //  func fetchUserFollowers(with username: String) {
  //    FollowersAPIClient.shared.getUserFollowers(username: username) { [weak self] result in
  //      guard let self = self else { return }
  //      switch result {
  //        case .success(let response):
  ////          DispatchQueue.main.async {
  //            self.followersArray = response.map({ follower in
  //              Follower(
  //                userName: follower.userName ?? "",
  //                avatarURL: follower.avatarURL ?? ""
  //              )
  //            })
  ////          }
  //        case .failure(let failure):
  //          print(failure)
  //      }
  //    }
  //  }
}

