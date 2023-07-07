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

protocol UserViewItemProtocol: Identifiable {
  var id: UUID { get set }
  var userName: String { get set }
  var image: String { get set }
  var userNameColor: Color { get set }
  var userNameFont: Font { get set }
}
