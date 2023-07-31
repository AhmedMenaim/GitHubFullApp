//
//  RepositoriesView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Resolver
import SwiftUI

struct UserRepositoriesView: View {
  // MARK: - Dependencies

  @ObservedObject private var viewModel: UserRepositoriesViewModel = Resolver.resolve()

  // MARK: - Views

  var body: some View {
    VStack {
      List {
        ForEach(viewModel.repositoriesArray) { repository in
          UserRepositoryCard(repository: repository)
        }
        .listRowSeparator(.visible)
      }
      .listStyle(.plain)
      .onAppear {
        Task {
          await viewModel.repositoriesViewItems()
        }
      }
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: CustomizedBackButton())
    }
  }
}
