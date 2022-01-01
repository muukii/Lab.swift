//
//  GridView.swift
//  SwiftUIComponents
//
//  Created by Muukii on 2021/12/15.
//

import SwiftUI

enum GridView {

  struct ContentView: View {

    func box() -> some View {
      Color.blue
        .overlay(Text("Hello"))
    }

    var body: some View {
      LazyVGrid(
        columns: [
          .init(.fixed(10), spacing: 16, alignment: .center),
          .init(.flexible(), spacing: 32, alignment: .center),
          .init(.fixed(10), spacing: 16, alignment: .center),
          .init(.flexible(), spacing: 32, alignment: .center)
        ],
        alignment: .leading,
        spacing: 16,
        pinnedViews: .sectionFooters
      ) {

        Text("hi")
        box()
        box()
        Text("hiffffff3245234523452345234")
        box()
        box()
        box()
        box()
        box()


      }
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
