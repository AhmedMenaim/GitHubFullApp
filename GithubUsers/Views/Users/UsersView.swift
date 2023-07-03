//
//  UsersView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct UsersView: View {
  @State var usersArray: [User] = []

  var body: some View {
    VStack {
      List {
        ForEach(usersArray) { user in
          NavigationLink(
            destination: UserDetails(username: user.userName)) {
              UserCard(user: user)
            }
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .onAppear {
        fetchUsers()
      }
    }
  }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

extension UsersView {
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
