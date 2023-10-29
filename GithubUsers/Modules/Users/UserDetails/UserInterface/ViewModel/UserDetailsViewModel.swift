//
//  UserDetailsViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Factory
import SwiftUI

@MainActor
final class UserDetailsViewModel {

  // MARK: - Dependencies
  private var useCase = Container.shared.userDetailsUseCase()

  // MARK: - Constants

  private enum Constants {
    static let linkTitle = "See my Profile!"
    static let linkTitleFont: Font = .title.bold()
    static let backgroundColor: any ShapeStyle = .purple.gradient.opacity(0.3)
    static let cornerRadius: CGFloat = 8
  }

  // MARK: - Properties

  @Published var userDetails: UserDetailsViewItemProtocol?
  var repositories = ""
  var gists = ""
  var followers = ""
  var following = ""
}

// MARK: - UserDetailsViewModelProtocol

extension UserDetailsViewModel: UserDetailsViewModelProtocol {
  func userDetailsViewItem() async {
    do {
      guard let details = try await useCase.retrieveUserDetails() else { return }
      repositories = "\(details.numberOfPublicRepos) Repositories"
      gists = "\(details.numberOfPublicGists) Gists"
      followers = "\(details.numberOfFollowers) Followers"
      following = "\(details.numberOfFollowing) Following"
      userDetails = UserDetailsViewItem(
        userName: details.userName,
        fullName: details.fullName,
        company: details.company,
        avatarURL: details.avatarURL,
        userProfileURL: details.userProfileURL,
        location: details.location,
        bio: details.bio,
        twitterUsername: details.twitterUsername,
        numberOfPublicRepos: repositories,
        numberOfPublicGists: gists,
        numberOfFollowers: followers,
        numberOfFollowing: following,
        statuses: UserDetailsViewItemStatuses(
          isBioExisted: details.statuses.isBioExisted,
          isTwitterExisted: details.statuses.isTwitterExisted,
          isLocationExisted: details.statuses.isLocationExisted,
          isWorkExisted: details.statuses.isWorkExisted
        ), linkViewItem: LinkViewItem(
          title: (
            title: Constants.linkTitle,
            font: Constants.linkTitleFont
          ),
          webURL: details.userProfileURL,
          backgroundColor: Constants.backgroundColor
        )
      )
    } catch {
      print(error)
    }
  }

  func saveUsername() {
    useCase.setUsername()
  }
}

// MARK: - UserDetailsViewItemProtocol

private struct UserDetailsViewItem: UserDetailsViewItemProtocol {
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
  var statuses: UserDetailsViewItemStatusesProtocol
  var linkViewItem: LinkViewItemProtocol
}

// MARK: - UserDetailsViewItemStatusesProtocol

private struct UserDetailsViewItemStatuses: UserDetailsViewItemStatusesProtocol {
  var isBioExisted: Bool
  var isTwitterExisted: Bool
  var isLocationExisted: Bool
  var isWorkExisted: Bool
}

// MARK: - LinkViewItemProtocol

private struct LinkViewItem: LinkViewItemProtocol {
  var title: (title: String, font: Font)
  var webURL: String
  var backgroundColor: any ShapeStyle
}
