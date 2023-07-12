//
//  UsersDataSourceProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 06/07/2023.
//

import Foundation

protocol UsersDataSourceProtocol {
  var usersArray: [User] { get set }
  var isLoading: Bool { get set }
}
