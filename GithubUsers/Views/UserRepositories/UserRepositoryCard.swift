//
//  RepositoryCard.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct UserRepositoryCard: View {
  @State var repository: Repository
  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      HStack(spacing: 8.0) {
        Text(repository.repositoryName)
          .foregroundColor(.purple.opacity(0.8))
          .font(.title3)
          .fontWeight(.heavy)
        Text(repository.isPrivate ? "Private" : "Public")
          .fontWeight(.bold)
          .foregroundColor(.gray)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .clipShape(RoundedRectangle(cornerRadius: 12.0))
          .overlay(
            RoundedRectangle(cornerRadius: 16.0)
              .stroke(.gray.gradient, lineWidth: 1)
          )
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      if !repository.description.isEmpty {
        Text(repository.description)
          .foregroundColor(.gray.opacity(0.7))
          .fontWeight(.semibold)
          .lineLimit(2)
          .multilineTextAlignment(.leading)
      }
      HStack(spacing: 16.0) {
        if !repository.programmingLanguage.isEmpty {
          Text(repository.programmingLanguage)
        }
        HStack(spacing: 2) {
          Image(systemName: "star")
          Text("\(repository.repositoryStarsCount)")
        }
        HStack(spacing: 2) {
          Image(systemName: "tuningfork")
          Text("\(repository.repositoryForksCount)")
        }
        if !repository.licenseName.isEmpty {
          Text(repository.licenseName)
        }

        VStack(spacing: 2) {
          Text("Updated on")
          Text("\(repository.updatedAt)")
        }
      }
      .foregroundColor(.gray.opacity(0.9))
    }
//    .frame(maxWidth: .infinity, minHeight: 300)
  }
}

struct UserRepositoryCard_Previews: PreviewProvider {
  static var previews: some View {
    let repository = Repository(
      repositoryName: "30daysoflaptops.github.io",
      isPrivate: false,
      repositoryURL: "https://github.com/mojombo/30daysoflaptops.github.io",
      description: "description",
      repositorySize: 1197,
      repositoryForksCount: 4,
      repositoryStarsCount: 8,
      repositoryOpenIssuesCount: 0,
      repositoryWatchersCount: 7,
      repositoryDefaultBranch: "gh-pages",
      cloneURL: "https://github.com/mojombo/30daysoflaptops.github.io.git",
      programmingLanguage: "CSS",
      updatedAt: "Apr 5, 2023",
      licenseName: "MIT License"
    )
    UserRepositoryCard(repository: repository)
      .previewDevice("iPhone 14 Pro Max")
  }
}
