import SwiftUI

struct BookJoystick: View {
  var body: some View {
    Joystick()
      .frame(height: 400)
  }
}

struct Joystick: View {

  /**
   ???
   Use just State instead of GestureState to trigger animation on gesture ended.
   This approach is right?

   refs:
   https://stackoverflow.com/questions/72880712/animate-gesturestate-on-reset
   */
  @State private var position: CGSize = .zero

  @GestureVelocity private var velocity: CGVector

  var body: some View {
    stick
      .padding(10)
  }

  private var stick: some View {
    Circle()
      .fill(Color.blue)
      .frame(width: 100, height: 100)
      .overlay {
        VelocityVisualizer(velocity: velocity)
      }
      .offset(position)
      .gesture(
        DragGesture(
          minimumDistance: 0,
          coordinateSpace: .local
        )
        .onChanged({ value in
          withAnimation(.interactiveSpring()) {
            position = value.translation
          }
        })
        .onEnded({ value in

          let distance = CGSize(width: abs(position.width), height: abs(position.height))

          let mappedVelocity = CGVector(
            dx: velocity.dx / distance.width,
            dy: velocity.dy / distance.height
          )
          
          PreviewLog.debug(.default, "\(mappedVelocity), \(velocity)")

          withAnimation(
            .interpolatingSpring(
              stiffness: 5,
              damping: 20,
              initialVelocity: mappedVelocity.dx
            )
          ) {
            position.width = 0
          }
          withAnimation(
            .interpolatingSpring(
              stiffness: 5,
              damping: 20,
              initialVelocity: mappedVelocity.dy
            )
          ) {
            position.height = 0
          }
        })
        .updatingVelocity($velocity)

      )

  }
}

struct VelocityVisualizer: View {

  let velocity: CGVector

  var body: some View {

    ZStack {
      GeometryReader { proxy in
        
        let horizontal = Rectangle()
          .frame(width: max(velocity.dx / 100, 6), height: 2)
          .animation(.interactiveSpring(), value: velocity)

        let vertical = Rectangle()
          .frame(width: 2, height: max(velocity.dy / 100, 6))
          .animation(.interactiveSpring(), value: velocity)

        if velocity.dx > 0 {
          HStack(alignment: .center) {
            Spacer()
              .frame(width: proxy.size.width)
            horizontal
            Spacer()
          }
        } else {

          HStack(alignment: .center) {
            Spacer()
            horizontal
            Spacer()
              .frame(width: proxy.size.width)
          }
        }

        if velocity.dy > 0 {

          VStack(alignment: .center) {
            Spacer()
              .frame(width: proxy.size.width)
            vertical
            Spacer()
          }
        } else {
          VStack(alignment: .center) {
            Spacer()
            vertical
            Spacer()
              .frame(width: proxy.size.width)
          }
        }

      }

    }

  }

}

struct BookJoystick_Previews: PreviewProvider {
  static var previews: some View {

    VStack {
      BookJoystick()
      LogView()
    }

  }
}
