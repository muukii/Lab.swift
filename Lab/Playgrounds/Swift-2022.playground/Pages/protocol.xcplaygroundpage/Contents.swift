
import SwiftUI

protocol _ButtonStyle {
  associatedtype Body: View
  func makeBody() -> Body
}

protocol MyProtocol: _ButtonStyle {
  associatedtype BorderShape: Shape
}

struct Box<BorderShape: Shape>: MyProtocol {

  func makeBody() -> some View {
    Text("Normal")
  }

}

extension Box where BorderShape == Rectangle {

  func makeBody() -> some View {
    Text("Rectangle")
  }

}

var c: ButtonStyleConfiguration!

//Box<Capsule>().makeBody()
Box<Rectangle>().makeBody()

let box: some MyProtocol = Box<Rectangle>()

box.makeBody()

print("done")
