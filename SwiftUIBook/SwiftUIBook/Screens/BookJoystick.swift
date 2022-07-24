import SwiftUI

struct BookJoystick: View {
  var body: some View {
    Joystick()
      .padding(100)
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

          PreviewLog.debug(.default, "\(velocity)")
          
          let distance = CGSize.zero - position
          
          let mappedVelocity = CGVector(
            dx: velocity.dx / distance.width,
            dy: velocity.dy / distance.height
          )
          
          withAnimation(
            .interpolatingSpring(
              stiffness: 100,
              damping: 99,
              initialVelocity: mappedVelocity.dx
            )
          ) {
            position.width = 0
          }
          withAnimation(
            .interpolatingSpring(
              stiffness: 100,
              damping: 99,
              initialVelocity:  mappedVelocity.dy
            )
          ) {
            position.height = 0
          }
        })
        .updatingVelocity($velocity)
        
      )

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
