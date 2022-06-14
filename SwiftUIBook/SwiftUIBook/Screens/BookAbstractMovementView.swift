import SwiftUI
import swiftui_color

struct BookAbstractMovementView: View, PreviewProvider {
  
  static var previews: some View {
    Group {
      Self.init()
    }
  }
  
  var body: some View {
    ZStack {
      Color.black
      Text("Hello")
      Circle()
        .foregroundColor(Color(hexInt: 0xFFFFFF))
    }
    .ignoresSafeArea(.all)
  }
}

