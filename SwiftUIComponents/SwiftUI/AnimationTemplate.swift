import SwiftUI

enum Preview: PreviewProvider {

  static var previews: some View {
    Group {

      OneTimeAnimationView(title: "A") { wasAnimated, namespace in
        if wasAnimated {
          Rectangle()
            .frame(width: 10, height: 10)
            .id("A")
        } else {
          Rectangle()
            .frame(width: 100, height: 100)
            .id("A")
        }
      }

      OneTimeAnimationView(title: "Matched") { wasAnimated, namespace in
        if wasAnimated {
          Rectangle()
            .matchedGeometryEffect(
              id: "1",
              in: namespace,
              properties: [.size, .position],
              anchor: .top,
              isSource: true
            )
            .frame(width: 10, height: 10)
        } else {
          Rectangle()
            .matchedGeometryEffect(
              id: "1",
              in: namespace,
              properties: [.size, .position],
              anchor: .top,
              isSource: true
            )
            .frame(width: 100, height: 100)
        }
      }

      OneTimeAnimationView(title: "Move") { wasAnimated, namespace in
        if wasAnimated {
          Rectangle()
            .frame(width: 10, height: 10)
            .id("A")
          //            .matchedGeometryEffect(id: "10", in: namespace)
        } else {
          Rectangle()

            .frame(width: 30, height: 10)
            .id("A")
          //            .matchedGeometryEffect(id: "10", in: namespace)
        }
      }

      OneTimeAnimationView { wasAnimated, _ in
        Rectangle()
          .frame(width: wasAnimated ? 100 : 10, height: 10)
      }

    }
  }
}
