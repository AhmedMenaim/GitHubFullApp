//
//  HomeView.swift
//  GithubUsers
//
//  Created by Menaim on 25/06/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      let usersArray: [User] = [
        User(
          name: "User1",
          userName: "User1_1",
          image: "user1"
        ),
        User(
          name: "User2",
          userName: "User2_2",
          image: "user1"
        ),
        User(
          name: "User3",
          userName: "User3_3",
          image: "user1"
        ),
        User(
          name: "User4",
          userName: "User4_4",
          image: "user1"
        ),
      ]
      NavigationView {
        VStack {
          List {
            ForEach(usersArray) { user in
              UserCard(user: user)
            }
            .listRowSeparator(.hidden)
          }
          .listStyle(.plain)
        }
        .navigationBarTitle("Movies")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
      // .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
       .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro max"))
    }
}
