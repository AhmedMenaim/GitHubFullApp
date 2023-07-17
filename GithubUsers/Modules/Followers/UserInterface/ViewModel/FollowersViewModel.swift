//
//  FollowersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Resolver
import SwiftUI

@MainActor
final class FollowersViewModel {
  // MARK: - Constants

  private enum Constants {
    enum Texts {
      static let title = "Followers"
    }

    enum Styles {
      static let nameFont: Font = .title3.weight(.bold)
      static let nameColor: Color = .purple
    }
  }

  // MARK: - Properties

  @Published var followersArray: [FollowerViewItem] = []
  @Published var staticViewItem: FollowersStaticViewItem?
  @Published var isLoading = true
  private var useCase: FollowersUseCaseProtocol = Resolver.resolve()

  // MARK: - Privates

  private func setStaticViewItem() {
    staticViewItem = FollowersStaticViewItem(title: Constants.Texts.title)
  }
}

// MARK: - FollowersViewModelProtocol

extension FollowersViewModel: FollowersViewModelProtocol {
  func followersViewItems() async {
    isLoading = useCase.notifyLoading()
    do {
      let followers = try await useCase.retrieveFollowers()
      followersArray = followers.map { follower in
        FollowerViewItem(
          userName: follower.userName,
          image: follower.avatarURL,
          userNameColor: Constants.Styles.nameColor,
          userNameFont: Constants.Styles.nameFont
        )
      }
      setStaticViewItem()
      isLoading = useCase.stopLoading()
    } catch {
      print(error)
    }
  }
}
