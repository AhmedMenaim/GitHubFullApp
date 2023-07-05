//
//  String+Extensions.swift
//  GithubUsers
//
//  Created by Menaim on 04/07/2023.
//

import Foundation

extension String {
  func formattedDateString() -> String {

    /// This doesn't work cause you need to convert to a readable date format first before formatting it to the needed format ❌
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
//    dateFormatter.dateFormat = "MMM d, yyyy"
//    guard let date = dateFormatter.date(from: self) else { return ""}
//    return dateFormatter.string(from: date)

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")

    guard let date = dateFormatter.date(from: self) else { return "" }
    let newDateFormatter = DateFormatter()
    newDateFormatter.dateFormat = "MMM d, yyyy"
    let newStr = newDateFormatter.string(from: date)
    return newStr
  }
}
