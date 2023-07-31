//
//  UserRepositoriesRepositoryProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation

protocol UserRepositoriesRepositoryProtocol: UserRepositoriesRepositoryGettable { }

protocol UserRepositoriesRepositoryGettable {
  func getUserRepositories(parameters: UserRepositoriesSearchParametersProtocol) async throws
    -> [UsersRepositoriesRepositoryResponseProtocol]?
}

// MARK: - UsersRepositoriesRepositoryResponseProtocol

protocol UsersRepositoriesRepositoryResponseProtocol {
  var repositoryName: String? { get }
  var isPrivate: Bool? { get }
  var repositoryURL: String? { get }
  var description: String? { get }
  var repositorySize: Double? { get }
  var repositoryForksCount: Int? { get }
  var repositoryStarsCount: Int? { get }
  var repositoryOpenIssuesCount: Int? { get }
  var repositoryWatchersCount: Int? { get }
  var repositoryDefaultBranch: String? { get }
  var cloneURL: String? { get }
  var programmingLanguage: String? { get }
  var updatedAt: String? { get }
  var licenseName: String? { get }
}

struct UsersRepositoriesRepositoryResponse: UsersRepositoriesRepositoryResponseProtocol {
  var repositoryName: String?
  var isPrivate: Bool?
  var repositoryURL: String?
  var description: String?
  var repositorySize: Double?
  var repositoryForksCount: Int?
  var repositoryStarsCount: Int?
  var repositoryOpenIssuesCount: Int?
  var repositoryWatchersCount: Int?
  var repositoryDefaultBranch: String?
  var cloneURL: String?
  var programmingLanguage: String?
  var updatedAt: String?
  var licenseName: String?
}
