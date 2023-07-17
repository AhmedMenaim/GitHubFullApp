//
//  FollowerCard.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct FollowerCard: View {
  var follower: FollowerViewItem

  var body: some View {
    VStack(alignment: .center, spacing: 8.0) {
      AsyncImage(
        url: URL(string: follower.image)
      ) { image in
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
