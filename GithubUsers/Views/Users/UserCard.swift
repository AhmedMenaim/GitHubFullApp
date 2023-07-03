//
//  UserCard.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import SwiftUI

struct UserCard: View {
  var user: User
    var body: some View {
      HStack(alignment: .center, spacing: 16) {
        AsyncImage(
          url: URL(string: user.image)) { image in
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
          Text(user.name)
            .foregroundColor(.purple)
            .fontWeight(.heavy)
            .font(.title2)
          Text(user.userName)
            .font(.footnote)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
            .lineLimit(3)
        }
      }

    }
}

struct userCard_Previews: PreviewProvider {
    static var previews: some View {
      let user =  User(
        name: "User1",
        userName: "User1_2",
        image: "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"
      )
      UserCard(user: user)
    }
}

struct User: Identifiable {
  var id = UUID()
  var name: String
  var userName: String
  var image: String
}

