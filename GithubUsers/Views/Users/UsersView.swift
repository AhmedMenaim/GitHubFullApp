//
//  UsersView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct UsersView: View {
  @StateObject private var usersViewModel = UsersViewModel()

  var body: some View {
    VStack {
      List {
        ForEach(usersViewModel.usersArray) { user in
          NavigationLink(
            destination: UserDetails(username: user.userName)) {
              UserCard(user: user)
            }
        }
        .listRowSeparator(.hidden)
      }
      .listStyle(.plain)
      .onAppear {
        Task {
          await usersViewModel.fetchUsers()
        }
      }
    }
  }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
