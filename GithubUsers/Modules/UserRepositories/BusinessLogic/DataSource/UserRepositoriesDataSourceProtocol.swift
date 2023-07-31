//
//  UserRepositoriesDataSourceProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 29/07/2023.
//

import Foundation

protocol UserRepositoriesDataSourceProtocol {
  var repositoriesArray: [UserRepositoryProtocol] { get set }
  var isLoading: Bool { get set }
}
