//
//  RepositoriesDataSourceProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 28/07/2023.
//

import Foundation

protocol RepositoriesDataSourceProtocol {
  var repositories: [RepositoryProtocol] { get set }
  var isLoading: Bool { get set }
}
