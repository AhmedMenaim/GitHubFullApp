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

  @Published private(set) var usersArray: [UserViewItem] = []
  private let useCase: UsersUseCase

  // MARK: - Init

  init(dependencies: UsersViewModelDependenciesProtocol) {
    self.useCase = dependencies.useCase
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
      usersArray = users.map { user in
        UserViewItem(
          userName: user.userName,
          image: user.image,
          userNameColor: Constants.nameColor,
          userNameFont: Constants.nameFont
        )
      }
    } catch {
      print(error)
    }
  }
}
