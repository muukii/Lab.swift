import SwiftUI

struct BookTinySwitch: View {
  var body: some View {
    TinySwitch()
  }
}

struct BookTinySwitch_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      BookTinySwitch()
      BookTinySwitch()
      BookTinySwitch()
      BookTinySwitch()
    }
  }
}

public struct TinySwitch: View {

  @State private var isOn: Bool = false
  
  public init(isOn: Binding<Bool>? = nil) {

  }

  public var body: some View {
    ZStack {
      
      Capsule(style: .continuous)
        .fill(Color(white: 0.5, opacity: 0.5))

      HStack {
        if isOn {
          Spacer()
        }
        Capsule(style: .continuous)
          .fill(isOn ? Color.green : Color.red)
          .frame(width: 6)
        if !isOn {
          Spacer()
        }
      }

    }
    .frame(width: 10, height: 6)
    .padding(4)
    .onTapGesture {
      withAnimation(.interactiveSpring(response: 0.4)) {
        isOn.toggle()
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
      }
    }
  }
}
