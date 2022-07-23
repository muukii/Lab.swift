import SwiftUI

struct BookJoystick: View {
  var body: some View {
    Joystick()
  }
}

struct Joystick: View {
  
  /**
   ???
   Use just State instead of GestureState to trigger animation on gesture ended.
   This approach is right?
   */
  @State var position: CGSize = .zero
    
  var body: some View {
    
    Circle()
      .fill(Color.blue)
      .offset(position)
      .gesture(
        DragGesture(
          minimumDistance: 0,
          coordinateSpace: .local
        )
        .onChanged({ value in
          position = value.translation
        })
        .onEnded({ value in
          withAnimation(.spring(dampingFraction: 0.7)) {
            position = .zero
          }
        })
      )
    
  }
}

struct BookJoystick_Previews: PreviewProvider {
  static var previews: some View {
    BookJoystick()
  }
}
