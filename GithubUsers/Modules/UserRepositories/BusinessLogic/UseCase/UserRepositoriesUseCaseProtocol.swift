//
//  UserRepositoriesUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation

protocol UserRepositoriesUseCaseProtocol {
  func retrieve() async -> [UserRepositoryProtocol]
  func notifyLoading() -> Bool
  func stopLoading() -> Bool
}

protocol UserRepositoryProtocol {
  var repositoryName: String { get }
  var isPrivate: Bool { get }
  var repositoryURL: String { get }
  var description: String { get }
  var repositorySize: Double { get }
  var repositoryForksCount: Int { get }
  var repositoryStarsCount: Int { get }
  var repositoryOpenIssuesCount: Int { get }
  var repositoryWatchersCount: Int { get }
  var repositoryDefaultBranch: String { get }
  var cloneURL: String { get }
  var programmingLanguage: String { get }
  var updatedAt: String { get }
  var licenseName: String { get }
}
