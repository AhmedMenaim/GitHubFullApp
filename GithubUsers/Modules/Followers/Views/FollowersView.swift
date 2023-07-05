//
//  FollowersView.swift
//  GithubUsers
//
//  Created by Menaim on 02/07/2023.
//

import SwiftUI

struct FollowersView: View {
  //  @State var followersArray: [Follower] = []

  @Binding var username: String
  @StateObject private var followersViewModel = FollowersViewModel()
  let columns = Array(repeating: GridItem(), count: 2)

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 10.0) {
        ForEach(followersViewModel.followersArray) { follower in
          FollowerCard(follower: follower)
        }
      }
    }
    .onAppear {
      Task {
        await followersViewModel.fetchUserFollowers(with: username)
      }
//      fetchUserFollowers()
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: CustomizedBackButton())
    .navigationTitle("Followers")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct Followers_Previews: PreviewProvider {
    static var previews: some View {
      FollowersView(username: .constant("CryptoOo"))
        .previewDevice("iPhone 14 Pro Max")
    }
}
