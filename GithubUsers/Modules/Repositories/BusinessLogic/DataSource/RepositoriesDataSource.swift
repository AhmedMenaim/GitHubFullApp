//
//  RepositoriesDataSource.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Foundation

struct RepositoriesDataSource: RepositoriesDataSourceProtocol {
  var repositories: [RepositoryProtocol] = []
  var isLoading = true
}
