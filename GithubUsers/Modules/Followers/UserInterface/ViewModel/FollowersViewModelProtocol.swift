//
//  FollowersViewModelProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import SwiftUI

protocol FollowersViewModelProtocol: ObservableObject {
  var followersArray: [FollowerViewItem] { get set }
  var isLoading: Bool { get set }
  func followersViewItems() async
}

struct FollowerViewItem: Identifiable, Hashable {
  var id = UUID()
  var userName: String
  var image: String
  var userNameColor: Color
  var userNameFont: Font
}

struct FollowersStaticViewItem {
  var title: String
}
