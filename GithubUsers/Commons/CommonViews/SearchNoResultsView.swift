//
//  SearchNoResultsView.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import SwiftUI

struct SearchNoResultsView: View {
  // MARK: - Constants

  private enum Constants {
    static let searchImageName = "magnifyingglass"
    static let gitHubImageName = "github2"
    static let searchMessage = "magnifyingglass"
  }

  // MARK: - Views

  var body: some View {
    VStack {
      ZStack {
        Image(systemName: Constants.searchImageName)
          .resizable()
          .frame(width: 200, height: 200, alignment: .center)
          .foregroundColor(.purple.opacity(0.5))
        Image(Constants.gitHubImageName)
          .resizable()
          .frame(width: 100, height: 100, alignment: .center)
          .padding(.trailing, 35)
          .padding(.bottom, 30)
      }

      Text(Constants.searchMessage)
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .lineLimit(3)
        .foregroundColor(.purple.opacity(0.9))
    }
    .padding(24)
    .background(.black)
  }
}

struct SearchNoResultsView_Previews: PreviewProvider {
  static var previews: some View {
    SearchNoResultsView()
      .previewDevice("iPhone 14 Pro Max")
  }
}
