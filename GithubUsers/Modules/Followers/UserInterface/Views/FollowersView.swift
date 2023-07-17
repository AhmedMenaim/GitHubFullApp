//
//  FollowersView.swift
//  GithubUsers
//
//  Created by Menaim on 02/07/2023.
//

import Resolver
import SwiftUI

struct FollowersView: View {
  // MARK: - Properties

  @ObservedObject private var viewModel: FollowersViewModel = Resolver.resolve()
  let columns = Array(repeating: GridItem(), count: 2)

  // MARK: - Views

  var body: some View {
    VStack {
      if viewModel.isLoading {
        ProgressView()
      } else {
        ScrollView {
          LazyVGrid(columns: columns, spacing: 10.0) {
            ForEach(viewModel.followersArray) { follower in
              FollowerCard(follower: follower)
            }
          }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomizedBackButton())
        .navigationTitle(viewModel.staticViewItem?.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
      }
    }
    .onAppear {
      Task {
        await viewModel.followersViewItems()
      }
    }
  }
}
