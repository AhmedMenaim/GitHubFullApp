//
//  UserDetails.swift
//  GithubUsers
//
//  Created by Menaim on 01/07/2023.
//

import SwiftUI

struct UserDetails: View {
  // MARK: - Properties

  @State var userDetails: UserDetailsNetworkResponse?

  //  var user = User(
  //    name: "User1",
  //    userName: "User1_1",
  //    image: "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656"
  //  )

  @State var repositoriesTitle = "Repositories"
  @State var followersTitle = "Followers"
  @State var followingTitle = "Following"
  @State var gistsTitle = "Gists"
  @State var company = ""
  @State var location = ""
  @State var twitterUsername = ""
  @State var bio = ""
  @State var profileURL = ""
  @State var isBioExisted = false
  @State var isTwitterExisted = false
  @State var isLocationExisted = false
  @State var isWorkExisted = false
  @State var username: String = ""

  // MARK: - Views

  var body: some View {
    ScrollView {
      VStack(spacing: 8.0) {
        AsyncImage(
          url: URL(string: userDetails?.avatarURL ?? "")
        ) { image in
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
          ImagePlaceholderView()
        }
        VStack(spacing: 4.0) {
          Text(userDetails?.fullName ?? "")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .lineLimit(2)
          Text("@\(userDetails?.userName ?? "")")
            .font(.footnote)
            .fontWeight(.bold)
            .foregroundColor(.gray)
        }
        Divider()
        VStack(spacing: 10) {
          HStack(spacing: 12.0) {
            NavigationLink(destination: {
              FollowersView(username: $username)
            }, label: {
              OptionView(title: $followersTitle)
            })
            OptionView(title: $followingTitle)
          }
          HStack(alignment: .center, spacing: 12.0) {
            NavigationLink(destination: {
              UserRepositoriesView(username: $username)
            }, label: {
              OptionView(title: $repositoriesTitle)
            })
            OptionView(title: $gistsTitle)
          }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        VStack(
          alignment: .leading,
          spacing: 8.0
        ) {
          if isWorkExisted {
            HStack {
              Text("Companies:")
                .fontWeight(.black)
                .font(.title3)
              Text(company)
            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if isLocationExisted {
            HStack {
              Text("Location:")
                .fontWeight(.black)
                .font(.title3)
              Text(location)
            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if isTwitterExisted {
            HStack {
              Text("Twiter: ")
                .fontWeight(.black)
                .font(.title3)
              Text("@\(twitterUsername)")

            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if isBioExisted {
            VStack(spacing: 8.0) {
              Text("Bio:")
                .underline()
                .fontWeight(.black)
                .font(.title3)
                .frame(minWidth: 50, maxWidth: .infinity, alignment: .leading)
              Text(bio)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
          }
        }
        .frame(
          maxHeight: .infinity,
          alignment: .top
        )
        .padding(.top, 36)
        .padding(.leading, 16)
        .padding(.trailing, 16)
      }

      if let profileLink = URL(string: profileURL) {
        Link(destination: profileLink) {
          HStack {
            Text("See my Profile!")
              .font(.title)
              .fontWeight(.bold)
              .foregroundColor(.white)
          }
          .frame(
            minWidth: 240,
            maxWidth: .infinity,
            minHeight: 48,
            maxHeight: 48,
            alignment: .center
          )
          .background(.purple.gradient.opacity(0.3))
        }
        .cornerRadius(8)
        .padding(24)
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: CustomizedBackButton())
    .navigationTitle(username)
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      fetchUserDetails()
    }
  }
}

// MARK: - Preview

struct UserDetails_Previews: PreviewProvider {
  static var previews: some View {
    let userDetails = UserDetailsNetworkResponse(
      userName: "UserName",
      fullName: "Menaim",
      company: "YASSIR",
      avatarURL: "https://static.wikia.nocookie.net/naruto/images/d/d6/Naruto_Part_I.png/revision/latest/scale-to-width-down/1200?cb=20210223094656",
      userProfileURL: "",
      location: "",
      bio: "",
      twitterUsername: "",
      numberOfPublicRepos: 10,
      numberOfPublicGists: 15,
      numberOfFollowers: 14,
      numberOfFollowing: 12
    )
    UserDetails(userDetails: userDetails)
  }
}

// MARK: - APIService Extension

extension UserDetails {
  func fetchUserDetails() {
    APIService.shared.getUserDetails(
      username: username
    ) { result in
      switch result {
        case .success(let response):
          userDetails = response
          repositoriesTitle = "\(userDetails?.numberOfPublicRepos ?? 0) Repositories"
          gistsTitle = "\(userDetails?.numberOfPublicGists ?? 0) Gists"
          followersTitle = "\(userDetails?.numberOfFollowers ?? 0) Followers"
          followingTitle = "\(userDetails?.numberOfFollowing ?? 0) Following"
          company = "\(userDetails?.company ?? "")"
          location = "\(userDetails?.location ?? "")"
          twitterUsername = "\(userDetails?.twitterUsername ?? "")"
          bio = "\(userDetails?.twitterUsername ?? "")"
          if bio == "" {
            isBioExisted = false
          } else {
            isBioExisted = true
          }
          if twitterUsername == "" {
            isTwitterExisted = false
          } else {
            isTwitterExisted = true
          }
          if location == "" {
            isLocationExisted = false
          } else {
            isLocationExisted = true
          }
          if company == "" {
            isWorkExisted = false
          } else {
            isWorkExisted = true
          }

          profileURL = userDetails?.userProfileURL ?? ""

        case .failure(let failure):
          print(failure)
      }
    }
  }
}
