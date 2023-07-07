//
//  UsersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

protocol UsersViewModelDependenciesProtocol {
  var useCase: UsersUseCase { get }
}

@MainActor
final class UsersViewModel: ObservableObject {

  // MARK: - Properties
  @Published private (set) var usersArray: [any UserViewItemProtocol] = []
  private let useCase: UsersUseCase

  // MARK: - Init
  init(dependencies: UsersViewModelDependenciesProtocol) {
    useCase = dependencies.useCase
  }

  // MARK: - Constants
  private enum Constants {
    static let nameFont: Font = .title2.weight(.heavy)
    static let nameColor: Color = .purple
  }
}

// MARK: - UsersViewModelProtocol
extension UsersViewModel: UsersViewModelProtocol {
  func fetchUsers() async {
    do {
      let users = try await useCase.fetchUsers()
      self.usersArray = users.map({ user in
        UserViewItem(
          userName: user.userName,
          image: user.image,
          userNameColor: Constants.nameColor,
          userNameFont: Constants.nameFont
        )
      })
    } catch let error {
      print(error)
    }
  }
}

// MARK: - UserViewItemProtocol
private struct UserViewItem: UserViewItemProtocol {
  var id = UUID()
  var userName: String
  var image: String
  var userNameColor: Color
  var userNameFont: Font
}
