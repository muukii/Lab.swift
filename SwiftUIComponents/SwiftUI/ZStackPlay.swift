import SwiftUI

enum ZStackPlay {

  struct ContentView: View {

    var body: some View {

      ZStack {
        Rectangle()
          .frame(width: 30, height: 30)
          .foregroundColor(.init(white: 0.5, opacity: 0.5))

        Rectangle()
          .frame(width: 40, height: 60)
          .foregroundColor(.init(white: 0.5, opacity: 0.5))

        Rectangle()
          .frame(width: 80, height: 60)
          .foregroundColor(.init(white: 0.5, opacity: 0.5))

        Rectangle()
          .frame(width: 10, height: 120)
          .foregroundColor(.init(white: 0.5, opacity: 0.5))

      }
      .background(Color.blue)

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

