//
//  UserDetails.swift
//  GithubUsers
//
//  Created by Menaim on 01/07/2023.
//

import SwiftUI

protocol UserDetailsViewDependenciesProtocol {
  var viewModel: UserDetailsViewModel { get set }
}

struct UserDetailsView: View {
  // MARK: - Properties

  @ObservedObject private var viewModel: UserDetailsViewModel

  init(dependencies: UserDetailsViewDependenciesProtocol) {
    self.viewModel = dependencies.viewModel
  }

  @State var username = ""

  // MARK: - Views

  var body: some View {
    ScrollView {
      VStack(spacing: 8.0) {
        AsyncImage(
          url: URL(string: viewModel.userDetails?.avatarURL ?? "")
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
          Text(viewModel.userDetails?.fullName ?? "")
            .font(.largeTitle)
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
            .lineLimit(2)
          Text("@\(viewModel.userDetails?.userName ?? "")")
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
              OptionView(title: $viewModel.followers)
            })
            OptionView(title: $viewModel.following)
          }
          HStack(alignment: .center, spacing: 12.0) {
            NavigationLink(destination: {
              UserRepositoriesView(username: $username)
            }, label: {
              OptionView(title: $viewModel.repositories)
            })
            OptionView(title: $viewModel.gists)
          }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        VStack(
          alignment: .leading,
          spacing: 8.0
        ) {
          if viewModel.userDetails?.statuses.isWorkExisted ?? false {
            HStack {
              Text("Companies:")
                .fontWeight(.black)
                .font(.title3)
              Text(viewModel.userDetails?.company ?? "")
            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if viewModel.userDetails?.statuses.isLocationExisted ?? false {
            HStack {
              Text("Location:")
                .fontWeight(.black)
                .font(.title3)
              Text(viewModel.userDetails?.location ?? "")
            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if viewModel.userDetails?.statuses.isTwitterExisted ?? false {
            HStack {
              Text("Twiter: ")
                .fontWeight(.black)
                .font(.title3)
              Text("@\(viewModel.userDetails?.twitterUsername ?? "")")
            }
            .frame(minWidth: 200, maxWidth: .infinity, alignment: .leading)
          }

          if viewModel.userDetails?.statuses.isBioExisted ?? false {
            VStack(spacing: 8.0) {
              Text("Bio:")
                .underline()
                .fontWeight(.black)
                .font(.title3)
                .frame(minWidth: 50, maxWidth: .infinity, alignment: .leading)
              Text(viewModel.userDetails?.bio ?? "")
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

      if let profileLink = URL(string: viewModel.userDetails?.userProfileURL ?? "") {
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
      Task {
        await viewModel.userDetailsViewItem()
      }
    }
  }
}
