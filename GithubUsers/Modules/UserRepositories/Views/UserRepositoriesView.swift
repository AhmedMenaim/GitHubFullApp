//
//  RepositoriesView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct UserRepositoriesView: View {
  @Binding var username: String
  @StateObject private var viewModel = UserRepositoriesViewModel()

    var body: some View {
      VStack {
        List {
          ForEach(viewModel.repositoriesArray) { repository in
//            NavigationLink(
//              destination: UserDetails(username: user.userName)) {
//                UserCard(user: user)
//              }
            UserRepositoryCard(repository: repository)
          }
          .listRowSeparator(.visible)
        }
        .listStyle(.plain)
        .onAppear {
          Task {
            await viewModel.fetchRepositories(with: username)
          }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomizedBackButton())
      }
    }
}

struct UserRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
      let username = "cryptoOo"
      UserRepositoriesView(username: .constant(username))
    }
}
