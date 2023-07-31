//
//  UserRepositoriesDataSource.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation

struct UserRepositoriesDataSource: UserRepositoriesDataSourceProtocol {
  var repositoriesArray: [UserRepositoryProtocol] = []
  var isLoading = true
}
