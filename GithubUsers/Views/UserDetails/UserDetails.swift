//
//  UserDetails.swift
//  GithubUsers
//
//  Created by Menaim on 01/07/2023.
//

import SwiftUI

struct UserDetails: View {
  var user = User(
    name: "User1",
    userName: "User1_1",
    image: "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"
  )
  @State var repositoriesTitle: String = "Repositories"
  @State var followersTitle: String = "Followers"
  @State var followingTitle: String = "Following"
  @State var gistsTitle: String = "Gists"
  var body: some View {
    VStack(alignment: .center, spacing: 8.0) {
      AsyncImage(
        url: URL(string: user.image)) { image in
          image
            .resizable()
            .scaledToFill()
            .frame(
              width: 200,
              height: 200,
              alignment: .center
              )
            .clipShape(Circle())
        } placeholder: {
          Image(systemName: "photo.fill")
            .resizable()
            .scaledToFit()
            .frame(
              width: 100,
              height: 80,
              alignment: .leading
              )
            .foregroundColor(.gray)
        }
      VStack(spacing: 4.0) {
        Text(user.name)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .lineLimit(2)
        Text("@\(user.userName)")
          .font(.footnote)
          .fontWeight(.bold)
          .foregroundColor(.gray)
      }
      Divider()
      Spacer()
      HStack(spacing: 12.0) {
        OptionView(title: $followersTitle)
        OptionView(title: $followingTitle)
      }
      HStack(alignment: .center, spacing: 12.0) {
        OptionView(title: $repositoriesTitle)
        OptionView(title: $gistsTitle)
      }
      Spacer()
    }
  }
}

struct UserDetails_Previews: PreviewProvider {
  static var previews: some View {
    UserDetails()
  }
}

struct OptionView: View {
  @Binding var title: String
  var body: some View {
    Text(title)
      .foregroundColor(.blue)
      .underline()
      .fontWeight(.semibold)
      .frame(
        minWidth: 200,
        maxWidth: .infinity,
        alignment: .center)
  }
}
