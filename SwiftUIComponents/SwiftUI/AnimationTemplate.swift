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
            .offset(x: 10.0, y: 100.0)
            .frame(width: 100, height: 100)
        }
      }

      OneTimeAnimationView(title: "Move") { wasAnimated, namespace in
        if wasAnimated {
          Rectangle()
            .id("A")
            .frame(width: 10, height: 10)
        } else {
          Rectangle()
            .id("A")
            .frame(width: 30, height: 10)
        }
      }

      OneTimeAnimationView { wasAnimated, _ in
        Rectangle()
          .frame(width: wasAnimated ? CGFloat(100) : CGFloat(10), height: 10)
      }

    }
    .previewLayout(.fixed(width: 300, height: 300))

  }
}
