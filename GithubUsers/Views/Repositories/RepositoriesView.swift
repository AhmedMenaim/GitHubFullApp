//
//  RepositoriesView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct RepositoriesView: View {
  @State var repositoriesArray: [Repository] = []
  @State var searchText = ""
  @State var isSearchWorking = false
  
  var body: some View {
    ZStack {
      VStack {
        List {
          ForEach(repositoriesArray) { repository in
            //            NavigationLink(
            //              destination: UserDetails(username: user.userName)) {
            //                UserCard(user: user)
            //              }
            UserRepositoryCard(repository: repository)
          }
          .listRowSeparator(.visible)
        }
        .listStyle(.plain)
        .opacity(isSearchWorking ? 1 : 0)
      }
      SearchNoResultsView()
        .opacity(isSearchWorking ? 0 : 1)
    }
    .searchable(text: $searchText)
    .onChange(of: searchText) { newValue in
      if newValue.count >= 3 {
        fetchUserRepositories(using: searchText)
      }
      isSrearchStarted()
    }
  }
}

struct RepositoriesView_Previews: PreviewProvider {
  static var previews: some View {
    RepositoriesView()
  }
}

extension RepositoriesView {
  func isSrearchStarted() {
    if searchText.count >= 3 {
      isSearchWorking = true
    } else {
      isSearchWorking = false
    }
  }

  func fetchUserRepositories(using searchText: String) {
    RepositoriesAPIClient.shared.getRepositories(searchText: searchText) { result in
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

