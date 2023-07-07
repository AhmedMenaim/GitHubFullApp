//
//  UsersView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

protocol UsersViewDependenciesProtocol {
  var usersViewModel: UsersViewModel { get set }
}

struct UsersView: View {
  @ObservedObject private var usersViewModel: UsersViewModel

  init(dependencies: UsersViewDependenciesProtocol) {
    usersViewModel = dependencies.usersViewModel
  }

  var body: some View {
    VStack {
      List {
        ForEach(usersViewModel.usersArray, id: \.self.id) { user in
          NavigationLink(
            destination: UserDetailsView(username: user.userName)) {
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
