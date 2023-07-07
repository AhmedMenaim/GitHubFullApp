//
//  UserCard.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import SwiftUI

struct UserCard: View {
  var user: UserViewItem
  var body: some View {
    HStack(alignment: .center, spacing: 16) {
      AsyncImage(
        url: URL(string: user.image)
      ) { image in
        image
          .resizable()
          .scaledToFill()
          .frame(
            width: 100,
            height: 80,
            alignment: .leading
          )
          .clipShape(RoundedRectangle(cornerRadius: 8))
      } placeholder: {
        ImagePlaceholderView()
      }

      VStack(alignment: .leading, spacing: 8) {
        Text(user.userName)
          .foregroundColor(user.userNameColor)
          .font(user.userNameFont)
      }
    }
  }
}
