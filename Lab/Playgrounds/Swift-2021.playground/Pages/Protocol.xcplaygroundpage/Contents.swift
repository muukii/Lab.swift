
protocol My_View {
  associatedtype Content
}

protocol My_ViewModifier {

  associatedtype Body : My_View

  func body(content: Self.Content) -> Self.Body

  typealias Content
}
