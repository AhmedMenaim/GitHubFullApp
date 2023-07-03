//
//  CustomizedBackButton.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct CustomizedBackButton: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  var body : some View {
    Button(action: {
      presentationMode.wrappedValue.dismiss()
    }) {
      HStack {
        Image(systemName: "arrowshape.backward.fill")
          .aspectRatio(contentMode: .fit)
          .foregroundColor(.black)
      }
    }
  }
}

struct CustomizedBackButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedBackButton()
    }
}
