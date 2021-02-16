//: [Previous](@previous)

import UIKit

struct ViewRepresentation: Equatable {

  var subviews: [ViewRepresentation]

  let frameInWindow: CGRect
  let alpha: CGFloat
  let accessibilityIdentifier: String?

  init(window: UIWindow) {
    self.init(view: window, parentFrame: window.frame)
  }

  private init(view: UIView, parentFrame: CGRect) {
    let _frameInWindow = Self.add(parentFrame, view.frame)
    self.frameInWindow = _frameInWindow
    self.subviews = view.subviews.map { .init(view: $0, parentFrame: _frameInWindow) }
    self.alpha = view.alpha
    self.accessibilityIdentifier = view.accessibilityIdentifier
  }

  func makePath() -> UIBezierPath {

    let path = UIBezierPath(rect: .zero)

    func recursive(view: ViewRepresentation) {

      for view in view.subviews {
        let _p = UIBezierPath(rect: view.frameInWindow)
        path.append(_p)
        recursive(view: view)
      }
    }

    recursive(view: self)

    return path
  }

  private static func add(_ a: CGRect, _ b: CGRect) -> CGRect {
    .init(
      x: a.origin.x + b.origin.x,
      y: a.origin.y + b.origin.y,
      width: a.size.width + b.size.width,
      height: a.size.height + b.size.height
    )
  }

}

//: [Next](@next)
