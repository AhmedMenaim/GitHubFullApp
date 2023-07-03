//
//  OptionView.swift
//  GithubUsers
//
//  Created by Menaim on 03/07/2023.
//

import SwiftUI

struct OptionView: View {
  @Binding var title: String
  var body: some View {
    Text(title)
      .foregroundColor(.white)
      .fontWeight(.semibold)
      .frame(
        minWidth: 80,
        maxWidth: .infinity,
        minHeight: 40,
        alignment: .center)
      .background(.blue.gradient)
      .cornerRadius(8)
  }
}

#if DEBUG
struct OptionView_Previews: PreviewProvider {
  static var previews: some View {
    let title = "Option Title"
    OptionView(title: .constant(title))
  }
}
#endif
