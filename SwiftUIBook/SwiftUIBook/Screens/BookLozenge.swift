import SwiftUI

struct BookLozenge: View {
  var body: some View {
    Text("こんにちは")
      .padding(10)
      .background(
        Color.blue
          .clipShape(RoundedCorner(radius: 10, corners: [.topLeft]))
          .clipShape(RoundedCorner(radius: 20, corners: [.topRight]))
          .clipShape(RoundedCorner(radius: 20, corners: [.bottomLeft]))
          .clipShape(RoundedCorner(radius: 10, corners: [.bottomRight]))

      )
  }
}

struct RoundedCorner: Shape {

  var radius: CGFloat = .infinity
  var corners: UIRectCorner = .allCorners

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}

struct BookLozenge_Previews: PreviewProvider {
  static var previews: some View {
    BookLozenge()
  }
}
