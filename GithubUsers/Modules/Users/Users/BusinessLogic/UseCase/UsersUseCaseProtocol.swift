//
//  UsersUseCaseProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 07/07/2023.
//

import Foundation

protocol UsersUseCaseProtocol {
  func fetchUsers() async throws -> [User]
}

struct User: Identifiable {
  var id = UUID()
  var userName: String
  var image: String
}
