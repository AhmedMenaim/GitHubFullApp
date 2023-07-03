//
//  FollowersView.swift
//  GithubUsers
//
//  Created by Menaim on 02/07/2023.
//

import SwiftUI

struct FollowersView: View {
  @Binding var username: String
  @State var followersArray: [Follower] = []

  let columns = Array(repeating: GridItem(), count: 2)

  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 10.0) {
        ForEach($followersArray) { follower in
          FollowerCard(follower: follower)
        }
      }
    }
    .onAppear {
      fetchUserFollowers()
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

extension FollowersView {
  func fetchUserFollowers() {
    FollowersAPIClient.shared.getUserFollowers(username: username) { result in
      switch result {
        case .success(let response):
          followersArray = response.map({ follower in
            Follower(
              userName: follower.userName ?? "",
              avatarURL: follower.avatarURL ?? ""
            )
          })
        case .failure(let failure):
          print(failure)
      }
    }
  }
}
