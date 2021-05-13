import SwiftUI

enum MyView {

  struct ContentView: View {

    var body: some View {
      Text("What's up")
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
