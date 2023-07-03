//
//  FollowersView.swift
//  GithubUsers
//
//  Created by Menaim on 02/07/2023.
//

import SwiftUI

struct FollowersView: View {
  @Binding var username: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Followers_Previews: PreviewProvider {
    static var previews: some View {
      FollowersView(username: .constant("CryptoOo"))
    }
}

extension FollowersView {
  func fetchUsers() {
    APIService.shared.getUsers { result in
      switch result {
        case .success(let response):
          usersArray = response.map({ user in
            User(
              name: "\(user.userID ?? 0)",
              userName: user.userName ?? "",
              image: user.avatarURL ?? ""
            )
          })
          print(usersArray)
        case .failure(let failure):
          print(failure)
      }
    }
  }
}
