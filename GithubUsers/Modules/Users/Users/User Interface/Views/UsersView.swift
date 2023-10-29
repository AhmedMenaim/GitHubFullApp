//
//  UsersView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Factory
import SwiftUI

struct UsersView: View {
  // MARK: - Dependencies

  @ObservedObject private var usersViewModel = Container.shared.usersViewModel()

  // MARK: - Properties

  @State private var selectedUser: UserViewItem?

  // MARK: - Views

  var body: some View {
    VStack {
      if usersViewModel.isLoading {
        ProgressView()
      } else {
        List(usersViewModel.usersArray, id: \.self, selection: $selectedUser) { user in
          NavigationLink<UserCard, UserDetailsView?>(
            destination: UserDetailsView()
          ) {
            UserCard(user: user)
          }
          .onChange(of: selectedUser, perform: { newValue in
            UserDefaults.standard.set(newValue?.userName, forKey: "Username")
          })
        }.listRowSeparator(.hidden)
          .listStyle(.plain)
      }
    }
    .onAppear {
      Task {
        await usersViewModel.fetchUsers()
      }
    }
  }
}
