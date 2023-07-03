//
//  HomeView.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import SwiftUI

struct HomeView: View {
  @State var usersArray: [User] = []
  //  usersArray = [
  //    User(
  //      name: "User1",
  //      userName: "User1_1",
  //      image: "user1"
  //    ),
  //    User(
  //      name: "User2",
  //      userName: "User2_2",
  //      image: "user1"
  //    ),
  //    User(
  //      name: "User3",
  //      userName: "User3_3",
  //      image: "user1"
  //    ),
  //    User(
  //      name: "User4",
  //      userName: "User4_4",
  //      image: "user1"
  //    ),
  //  ]
  var body: some View {
    TabView {
      NavigationView {
        UsersView()
          .navigationTitle("Users")
      }
      .tabItem {
        VStack {
          Image(systemName: "person")
          Text("Users")
        }
      }

      NavigationView {
        UsersView()
          .navigationTitle("Repositories")
      }
      .tabItem {
        VStack {
          Image(systemName: "command")
          Text("Repositories")
        }
      }

      NavigationView {
        Text("My great Profile")
          .navigationTitle("My profile")
      }
      .tabItem {
        VStack {
          Image(systemName: "star")
          Text("My profile")
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
    /// Ctrl + Option  on previewDevice to select the needed device
      .previewDevice("iPhone 14 Pro Max")
  }
}
