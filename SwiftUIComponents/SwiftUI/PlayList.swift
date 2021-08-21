import SwiftUI

enum PlayList {

  struct ContentView: View {

    struct Item: Identifiable {
      var id: String {
        text
      }
      var text: String
    }

    @State var items: [Item] = []

    var body: some View {
      Group {
        List($items) { $item in
          Text(item.text)
        }
        List($items) { item in
          Text(item.wrappedValue.text)
        }
      }
      .onAppear {


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
