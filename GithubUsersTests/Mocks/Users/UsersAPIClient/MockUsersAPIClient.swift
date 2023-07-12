//
//  MockUsersAPIClient.swift
//  MockUsersAPIClient
//
//  Created by Menaim on 11/07/2023.
//

import XCTest
@testable import GithubUsers

final class MockUsersAPIClient {
  private func loadJson<T>(filename fileName: String) -> T? where T: Decodable {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
      return nil
    }
    do {
      let data = try Data(contentsOf: url)
      let decoder = JSONDecoder()
      let decodedData = try decoder.decode(T.self, from: data)
      return decodedData
    } catch {
      print("error:\(error)")
      return nil
    }
  }
}

extension MockUsersAPIClient: UsersAPIClientProtocol {
  func getUsers() async -> [UserNetworkResponse]? {
    let users: [UserNetworkResponse]?
    users = loadJson(filename: "MockUsersNetworkResponse")
    return users
  }

  func getUserDetails(parameters: UserDetailsParametersProtocol) async -> UserDetailsNetworkResponse? {
    let userDetails: UserDetailsNetworkResponse?
    userDetails = loadJson(filename: "MockUserDetailsNetworkResponse")
    return userDetails
  }
}
