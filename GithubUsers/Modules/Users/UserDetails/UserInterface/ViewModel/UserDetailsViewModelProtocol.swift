//
//  UserDetailsViewModelProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import SwiftUI

protocol UserDetailsViewModelProtocol {
  var userDetails: UserDetailsViewItemProtocol? { get }
  func userDetailsViewItem() async
}

protocol UserDetailsViewItemProtocol {
  var userName: String { get }
  var fullName: String { get }
  var company: String { get }
  var avatarURL: String { get }
  var userProfileURL: String { get }
  var location: String { get }
  var bio: String { get }
  var twitterUsername: String { get }
  var numberOfPublicRepos: String { get }
  var numberOfPublicGists: String { get }
  var numberOfFollowers: String { get }
  var numberOfFollowing: String { get }
  var statuses: UserDetailsViewItemStatusesProtocol { get }
  var linkViewItem: LinkViewItemProtocol { get }
}

protocol UserDetailsViewItemStatusesProtocol {
  var isBioExisted: Bool { get }
  var isTwitterExisted: Bool { get }
  var isLocationExisted: Bool { get }
  var isWorkExisted: Bool { get }
}

protocol LinkViewItemProtocol {
  var title: (title: String, font: Font) { get }
  var webURL: String { get }
  var backgroundColor: any ShapeStyle { get }
}
