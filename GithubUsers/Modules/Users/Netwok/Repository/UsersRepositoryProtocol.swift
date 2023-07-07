//
//  UsersRepositoryProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

protocol UsersRepositoryProtocol: UsersRepositoryGettable {}

protocol UsersRepositoryGettable {
  func getUsers() async throws -> [UsersRepositoryResponseProtocol]?
}

// MARK: - UsersRepositoryResponseProtocol

protocol UsersRepositoryResponseProtocol {
  var userName: String? { get }
  var userID: Int? { get }
  var avatarURL: String? { get }
  var userProfileURL: String? { get }
}

struct UsersRepositoryResponse: UsersRepositoryResponseProtocol {
  var userName: String?
  var userID: Int?
  var avatarURL: String?
  var userProfileURL: String?
}
