//
//  PlayAttributedText.swift
//  SwiftUIComponents
//
//  Created by Muukii on 2021/06/10.
//

import SwiftUI

@available(iOS 15, *)
enum PlayAttributedText {

  struct ContentView: View {
    var body: some View {
      Text(formattedDate)
    }

    var formattedDate: AttributedString {
      var formattedDate: AttributedString = Date().formatted(
        Date.FormatStyle().day().month(.wide).weekday(.wide).attributed
      )

      let weekday = AttributeContainer.dateField(.weekday)
      let color = AttributeContainer.foregroundColor(.orange)
      formattedDate.replaceAttributes(weekday, with: color)

      return formattedDate
    }
  }

  enum Preview: PreviewProvider {

    static var previews: some View {

      Group {
        ContentView()
      }
    }

  }
}
