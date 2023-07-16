//
//  UsersView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import Resolver
import SwiftUI

struct UsersView: View {
  @ObservedObject private var usersViewModel: UsersViewModel = Resolver.resolve()
  @State private var selectedUser: UserViewItem?

  var body: some View {
    VStack {
      if usersViewModel.isLoading {
        ProgressView()
      } else {
        List(usersViewModel.usersArray, id: \.self, selection: $selectedUser) { user in
          NavigationLink<UserCard, UserDetailsView?>(
            destination: UserDetailsModuleFactory().makeView() as? UserDetailsView
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
