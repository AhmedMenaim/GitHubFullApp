//
//  FollowersDataSource.swift
//  GithubUsers
//
//  Created by Menaim on 16/07/2023.
//

import Foundation

struct FollowersDataSource: FollowersDataSourceProtocol {
  var followersArray: [Follower] = []
  var isLoading = true
}
