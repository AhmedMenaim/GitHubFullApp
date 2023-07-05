//
//  RepositoriesView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct RepositoriesView: View {
  @StateObject private var viewModel = RepositoriesViewModel()

  var body: some View {
    ZStack {
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
        .opacity(viewModel.isSearchWorking ? 1 : 0)
      }
      SearchNoResultsView()
        .opacity(viewModel.isSearchWorking ? 0 : 1)
    }
    .searchable(text: $viewModel.searchText)
    .onChange(of: viewModel.searchText) { _ in
      viewModel.checkSearchableText()
    }
  }
}

struct RepositoriesView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}
