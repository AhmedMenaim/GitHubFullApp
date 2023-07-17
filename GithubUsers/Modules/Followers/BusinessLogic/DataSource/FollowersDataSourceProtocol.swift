//
//  FollowersDataSourceProtocol.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation

protocol FollowersDataSourceProtocol {
  var followersArray: [Follower] { get set }
  var isLoading: Bool { get set }
}
