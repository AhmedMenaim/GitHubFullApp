//
//  RepositoriesNetworkResponse.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

struct RepositoriesNetworkResponse: Codable {
  var totalRepositoriesCount: Int?
  var repositories: [RepositoryNetworkResponse]?
  
  enum CodingKeys: String, CodingKey {
    case totalRepositoriesCount = "total_count"
    case repositories = "items"
  }
}

struct RepositoryNetworkResponse: Codable {
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
  var license: RepositoryLicense?

  enum CodingKeys: String, CodingKey {
    case repositoryName = "name"
    case isPrivate = "private"
    case repositoryURL = "html_url"
    case description
    case repositorySize = "size"
    case repositoryForksCount = "forks"
    case repositoryStarsCount = "stargazers_count"
    case repositoryOpenIssuesCount = "open_issues"
    case repositoryWatchersCount = "watchers"
    case repositoryDefaultBranch = "default_branch"
    case cloneURL = "clone_url"
    case programmingLanguage = "language"
    case updatedAt = "updated_at"
    case license
  }
}

struct RepositoryLicense: Codable {
  var licenseName: String?

  enum CodingKeys: String, CodingKey {
    case licenseName = "name"
  }
}
