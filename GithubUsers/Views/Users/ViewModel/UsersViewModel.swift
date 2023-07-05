//
//  UsersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
  
  @Published private (set) var usersArray: [User] = []
  
  func fetchUsers() async {
    do {
      let users = try await UsersAPIClient.shared.getUsers()
      self.usersArray = users.map({ user in
        User(
          name: "\(user.userID ?? 0)",
          userName: user.userName ?? "",
          image: user.avatarURL ?? ""
        )
      })
    } catch let error {
      print(error)
    }
  }
}
