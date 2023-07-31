//
//  RepositoriesRepositoryProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Foundation

protocol RepositoriesRepositoryProtocol: RepositoriesRepositoryGettable { }

protocol RepositoriesRepositoryGettable {
  func getRepositories(parameters: RepositoriesSearchParametersProtocol) async throws
    -> [RepositoryResponseProtocol]?
}

// MARK: - RepositoriesRepositoryResponseProtocol

protocol RepositoriesRepositoryResponseProtocol {
  var totalRepositoriesCount: Int? { get }
  var repositories: [RepositoryResponseProtocol]? { get }
}

struct RepositoriesRepositoryResponse: RepositoriesRepositoryResponseProtocol {
  var totalRepositoriesCount: Int?
  var repositories: [RepositoryResponseProtocol]?
}

// MARK: - RepositoryResponseProtocol

protocol RepositoryResponseProtocol {
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
  var license: RepositoryLicenseResponseProtocol? { get }
}

struct RepositoryResponse: RepositoryResponseProtocol {
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
  var license: RepositoryLicenseResponseProtocol?
}

// MARK: - RepositoryLicenseResponseProtocol

protocol RepositoryLicenseResponseProtocol {
  var licenseName: String? { get }
}

struct RepositoryLicenseResponse: RepositoryLicenseResponseProtocol {
  var licenseName: String?
}
