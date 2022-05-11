
import SwiftUI

struct BookPlaceholderView: BookView {

  var title: String = "BookPlaceholderView"

  @State private var isLoading = false

  var body: some View {

    VStack {
      Button(action: {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
          self.isLoading = false
        }
      }, label: {
        Text("Button")
      })

      HStack {
        Text("Hello")
        Color.red.frame(width: 100, height: 100, alignment: .center)
        Text("Hello")
      }
      .redacted(reason: .placeholder)
      .unredacted()
    }

  }
}
