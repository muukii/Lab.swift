import SwiftUI

struct BookDonuts: View {
  var body: some View {
    Donuts()
      .frame(width: 30, height: 30)
  }
}

func BlackCanvas(@ViewBuilder _ content: () -> some View) -> some View {
  ZStack {
    Color.black.ignoresSafeArea(.all)
    content()
  }
}

func WhiteCanvas(@ViewBuilder _ content: () -> some View) -> some View {
  ZStack {
    Color.white.ignoresSafeArea(.all)
    content()
  }
}

struct BookDonuts_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      
      BlackCanvas {
        BookDonuts()
      }
          
      WhiteCanvas {
        BookDonuts()
      }
      
    }
    .previewLayout(.fixed(width: 100, height: 100))
  }
}

public struct Donuts: View {

  @State private var isAnimating = false

  public var body: some View {

    ZStack {
      Circle()
        .stroke(
          Color(white: 0.5, opacity: 0.3),
          lineWidth: 4
        )

      Circle()
        .trim(from: 0, to: 0.2)
        .stroke(
          Color(white: 0.5, opacity: 0.7),
          style: StrokeStyle(lineWidth: 4.5, lineCap: .round)
        )
        .rotationEffect(isAnimating ? .degrees(360) : .degrees(0))
    }
    .onAppear {
      withAnimation(
        .linear(duration: 0.5)
        .repeatForever(autoreverses: false)
      ) {
        isAnimating = true
      }
    }

  }
}
