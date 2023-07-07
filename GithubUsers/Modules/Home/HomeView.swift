//
//  HomeView.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import SwiftUI

struct HomeView: View {
  @State var usersArray: [User] = []
  private var moduleFactory = UsersModuleFactory()
  var body: some View {
    TabView {
      NavigationView {
        if let usersView = moduleFactory.makeView() as? UsersView {
          usersView
            .navigationTitle("Users")
        }
      }
      .tabItem {
        VStack {
          Image(systemName: "person")
          Text("Users")
        }
      }

      NavigationView {
        RepositoriesView()
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
