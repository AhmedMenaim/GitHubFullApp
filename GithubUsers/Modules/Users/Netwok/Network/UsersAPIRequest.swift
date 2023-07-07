//
//  UsersAPIRouter.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

enum UsersAPIRequest: APIRequestConfiguration {
    case getUsers

    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .GET
        }
    }

    var path: String {
        switch self {
        case .getUsers:
            return "https://api.github.com/users"
        }
    }

    var parameters: Parameters? {
            return nil
    }

    var headers: HTTPHeaders? {
        return nil
    }
}
