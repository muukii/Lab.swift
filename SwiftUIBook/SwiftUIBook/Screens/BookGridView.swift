import SwiftUI

struct BookGridView: BookView {

  var title: String = "BookGridView"

  var body: some View {

    ScrollView {
      LazyVGrid(
        columns: [
          GridItem(.flexible()),
          GridItem(.adaptive(minimum: 30))
        ],
        spacing: 20
      ) {
        ForEach(0..<31) { i in
          Text("\(i)")
            .background(Color.orange.aspectRatio(1, contentMode: .fill))
//          Color.orange.aspectRatio(1, contentMode: .fill)
//            .overlay(Text("\(i)"))
        }
      }
    }

  }
}
