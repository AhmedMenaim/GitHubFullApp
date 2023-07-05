//
//  ImagePlaceholderView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct ImagePlaceholderView: View {
  var body: some View {
    Image(systemName: "photo.fill")
      .resizable()
      .scaledToFit()
      .frame(
        width: 100,
        height: 80,
        alignment: .leading
      )
      .foregroundColor(.gray)
  }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
    }
}
