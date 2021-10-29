
import UIKit

open class ZStackView: UIView {

  public init(views: [UIView]) {
    super.init(frame: .zero)

    views.forEach { view in
      addSubview(view)
      view.translatesAutoresizingMaskIntoConstraints = false

      NSLayoutConstraint.activate([
        view.leftAnchor.constraint(greaterThanOrEqualTo: self.leftAnchor),
        view.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor),
        view.rightAnchor.constraint(lessThanOrEqualTo: self.rightAnchor),
        view.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor),

        {
          let c = view.centerXAnchor.constraint(equalTo: self.centerXAnchor)
          c.priority = .defaultLow
          return c
        }(),
        {
          let c = view.centerYAnchor.constraint(equalTo: self.centerYAnchor)
          c.priority = .defaultLow
          return c
        }(),
      ])
    }

    setContentHuggingPriority(.defaultHigh, for: .horizontal)
    setContentHuggingPriority(.defaultHigh, for: .vertical)

  }

  public required init?(coder: NSCoder) {
    fatalError()
  }

}
func make(size: CGSize, color: UIColor) -> UIView {
  let view = UIView()
  view.translatesAutoresizingMaskIntoConstraints = false

  NSLayoutConstraint.activate([
    view.widthAnchor.constraint(equalToConstant: size.width),
    view.heightAnchor.constraint(equalToConstant: size.height)
  ])

  view.backgroundColor = color
  return view
}

let view = ZStackView(views: [
  make(size: .init(width: 10, height: 10), color: UIColor(white: 0.5, alpha: 0.5)),
  make(size: .init(width: 20, height: 20), color: UIColor(white: 0.5, alpha: 0.5)),
  make(size: .init(width: 30, height: 30), color: UIColor(white: 0.5, alpha: 0.5)),

  make(size: .init(width: 300, height: 30), color: UIColor(white: 0.5, alpha: 0.5)),
  make(size: .init(width: 30, height: 300), color: UIColor(white: 0.5, alpha: 0.5)),

])

let size = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
view.frame.size = size
view.layoutIfNeeded()
view.backgroundColor = .systemYellow
view

view.hasAmbiguousLayout

view.subviews.forEach {
  print($0.frame)
}
