//
//  UserDetailsViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

@MainActor
final class UserDetailsViewModel: ObservableObject {

  @Published private (set) var userDetails: UserDetails?
  @Published private (set) var isBioExisted = false
  @Published private (set) var isTwitterExisted = false
  @Published private (set) var isLocationExisted = false
  @Published private (set) var isWorkExisted = false
  @Published var repositories = ""
  @Published var gists = ""
  @Published var followers = ""
  @Published var following = ""

  func fetchUserDetails(with username: String) async {
    do {
      let details = try await UsersAPIClient.shared.getUserDetails(username: username)
       repositories = "\(details?.numberOfPublicRepos ?? 0) Repositories"
       gists = "\(details?.numberOfPublicGists ?? 0) Gists"
       followers = "\(details?.numberOfFollowers ?? 0) Followers"
       following = "\(details?.numberOfFollowing ?? 0) Following"
      self.userDetails = UserDetails(
        userName: details?.userName ?? "",
        fullName: details?.fullName ?? "",
        company: details?.company ?? "",
        avatarURL: details?.avatarURL ?? "",
        userProfileURL: details?.userProfileURL ?? "",
        location: details?.location ?? "",
        bio: details?.bio ?? "",
        twitterUsername: details?.twitterUsername ?? "",
        numberOfPublicRepos: repositories,
        numberOfPublicGists: gists,
        numberOfFollowers: followers,
        numberOfFollowing: following
      )
      if userDetails?.bio == "" {
        isBioExisted = false
      } else {
        isBioExisted = true
      }
      if userDetails?.twitterUsername == "" {
        isTwitterExisted = false
      } else {
        isTwitterExisted = true
      }
      if userDetails?.location == "" {
        isLocationExisted = false
      } else {
        isLocationExisted = true
      }
      if userDetails?.company == "" {
        isWorkExisted = false
      } else {
        isWorkExisted = true
      }
    } catch let error {
      print(error)
    }
  }
}


struct UserDetails {
  var userName: String
  var fullName: String
  var company: String
  var avatarURL: String
  var userProfileURL: String
  var location: String
  var bio: String
  var twitterUsername: String
  var numberOfPublicRepos: String
  var numberOfPublicGists: String
  var numberOfFollowers: String
  var numberOfFollowing: String
}
