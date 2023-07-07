//
//  UsersViewModelProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import SwiftUI

protocol UsersViewModelProtocol {
  func fetchUsers() async
}

struct UserViewItem: Identifiable, Hashable {
  var id = UUID()
  var userName: String
  var image: String
  var userNameColor: Color
  var userNameFont: Font
}