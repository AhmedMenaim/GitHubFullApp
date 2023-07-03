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
      NavigationView {
        VStack {
          List {
            ForEach(usersArray) { user in
              NavigationLink(
                destination: UserDetails(username: user.userName)) {
                UserCard(user: user)
              }
            }
            .listRowSeparator(.hidden)
          }
          .listStyle(.plain)
          .onAppear {
            fetchUsers()
          }
        }
        .navigationBarTitle("Github Users")
      }
    }

  func fetchUsers() {
    APIService.shared.getUsers { result in
      switch result {
        case .success(let response):
          usersArray = response.map({ user in
            User(
              name: "\(user.userID ?? 0)",
              userName: user.userName ?? "",
              image: user.avatarURL ?? ""
            )
          })
          print(usersArray)
        case .failure(let failure):
          print(failure)
      }
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
