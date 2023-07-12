//
//  UsersViewModel.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

protocol UsersViewModelDependenciesProtocol {
  var useCase: UsersUseCaseProtocol { get }
}

@MainActor
final class UsersViewModel: ObservableObject {
  // MARK: - Properties

  @Published var usersArray: [UserViewItem] = []
  @Published var isLoading = true
  private let useCase: UsersUseCaseProtocol

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
    isLoading = useCase.notifyLoading()
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
      isLoading = useCase.stopLoading()
    } catch {
      print(error)
    }
  }
}
