//
//  FollowerCard.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct FollowerCard: View {
  @Binding var follower: Follower

    var body: some View {
      VStack(alignment: .center, spacing: 8.0) {
        AsyncImage(
          url: URL(string: follower.avatarURL)) { image in
            image
              .resizable()
              .scaledToFill()
              .frame(
                width: 100,
                height: 100,
                alignment: .center
                )
              .clipShape(Circle())
              .overlay(
                Circle()
                  .stroke(.purple.gradient, lineWidth: 2)
              )

          } placeholder: {
            ImagePlaceholderView()
          }

        Text("@\(follower.userName)")
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.purple.opacity(0.5))
      }
      .frame(width: 160, height: 200)
      .background(.black.gradient.opacity(0.7))
      .clipShape(RoundedRectangle(cornerRadius: 12))
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .stroke(.purple.gradient.opacity(0.3), lineWidth: 2)
      )
    }
}

struct FollowerCard_Previews: PreviewProvider {
    static var previews: some View {
      let follower = Follower(
        userName: "CryptoOo",
        avatarURL: "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"
      )
      FollowerCard(follower: .constant(follower))
    }
}
