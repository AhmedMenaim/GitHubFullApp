//
//  UserRepositoriesViewModelProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 30/07/2023.
//

import Foundation

protocol UserRepositoriesViewModelProtocol {
  var repositoriesArray: [UserRepositoryViewItem] { get set }
  var isLoading: Bool { get set }
  func repositoriesViewItems() async
}

struct UserRepositoryViewItem: Identifiable {
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
  var licenseName: String
}
