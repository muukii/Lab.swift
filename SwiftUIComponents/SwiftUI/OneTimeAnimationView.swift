
import SwiftUI

struct OneTimeAnimationView<Content: View>: View {

  @State var wasAnimated = false
  @Namespace var namespace

  private let makeContent: (Bool, Namespace.ID) -> Content
  private let title: String

  init(
    title: String = "",
    @ViewBuilder content: @escaping (Bool, Namespace.ID) -> Content
  ) {
    self.title = title
    self.makeContent = content
  }

  var body: some View {
    VStack {
      Text(title)
        .font(.headline)
      Button(wasAnimated ? "Revert" : "Animate") {
        withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 0)) {
          wasAnimated.toggle()
        }
      }
      makeContent(wasAnimated, namespace)
      Spacer()
    }
  }

}
