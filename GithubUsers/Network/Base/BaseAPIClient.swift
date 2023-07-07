//
//  BaseAPIClient.swift
//  GithubUsers
//
//  Created by Menaim on 05/07/2023.
//

import Foundation

protocol BaseAPIClient {
    func perform<T: Decodable>(_ configuration: APIConfiguration) async throws -> T?
}
