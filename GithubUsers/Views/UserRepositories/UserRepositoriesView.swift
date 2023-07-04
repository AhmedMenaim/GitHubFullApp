//
//  RepositoriesView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct RepositoriesView: View {
  @Binding var username: String
  @State var repositoriesArray: [Repository] = []

    var body: some View {
      VStack {
        List {
          ForEach(repositoriesArray) { repository in
//            NavigationLink(
//              destination: UserDetails(username: user.userName)) {
//                UserCard(user: user)
//              }
            RepositoryCard(repository: repository)
          }
          .listRowSeparator(.visible)
        }
        .listStyle(.plain)
        .onAppear {
          fetchUserRepositories()
        }
      }
    }
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
      let username = "cryptoOo"
      RepositoriesView(username: .constant(username))
    }
}

extension RepositoriesView {
  func fetchUserRepositories() {
    RepositoriesAPIClient.shared.getUserRepositories(username: username) { result in
      switch result {
        case .success(let response):
          repositoriesArray = response.map({ repository in
            Repository(
              repositoryName: repository.repositoryName ?? "",
              isPrivate: repository.isPrivate ?? false,
              repositoryURL: repository.repositoryURL ?? "",
              description: repository.description ?? "",
              repositorySize: repository.repositorySize ?? 0.0,
              repositoryForksCount: repository.repositoryForksCount ?? 0,
              repositoryStarsCount: repository.repositoryStarsCount ?? 0,
              repositoryOpenIssuesCount: repository.repositoryOpenIssuesCount ?? 0,
              repositoryWatchersCount: repository.repositoryWatchersCount ?? 0,
              repositoryDefaultBranch: repository.repositoryDefaultBranch ?? "",
              cloneURL: repository.cloneURL ?? "",
              programmingLanguage: repository.programmingLanguage ?? "",
              updatedAt: repository.updatedAt?.formattedDateString() ?? "",
              licenseName: repository.license?.licenseName ?? "")

          })
        case .failure(let failure):
          print(failure)
      }
    }
  }
}
