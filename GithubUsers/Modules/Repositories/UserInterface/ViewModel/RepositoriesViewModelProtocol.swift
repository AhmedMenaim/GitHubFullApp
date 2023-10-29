//
//  RepositoriesViewModelProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Foundation

protocol RepositoriesViewModelProtocol: ObservableObject {
  var isLoading: Bool { get }
  func fetchRepositories(with searchText: String) async
  func checkSearchableText()
}

struct RepositoryViewItem: Identifiable {
  var id = UUID()
  var repositoryName: String
  var repositoryPrivateStatus: String
  var repositoryURL: String
  var description: String
  var repositorySize: Double
  var repositoryForksCount: Int
  var repositoryStarsCount: Int
  var repositoryOpenIssuesCount: Int
  var repositoryWatchersCount: Int
  var repositoryDefaultBranch: String
  var cloneURL: String
  var programmingLanguage: String
  var updatedAt: String
  var license: String
}
