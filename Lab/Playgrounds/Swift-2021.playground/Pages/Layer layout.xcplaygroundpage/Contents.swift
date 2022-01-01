import UIKit
import Foundation

class MyLayer: CALayer {

  override func layoutSublayers() {
    super.layoutSublayers()
    print("layoutSubLayers")
  }
}

class MyView: UIView {

  override class var layerClass: AnyClass {
    MyLayer.self
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    print("layoutSubviews")
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)

    print("layoutSublayers of \(layer)")
  }

}

let view = MyView()
do {
  print("🟡" + "update view.frame")
  print(view.layer.needsLayout())
  view.frame = .init(x: 0, y: 0, width: 30, height: 30)
  print(view.layer.needsLayout())
}

do {
  print("🟡" + "update layer.frame")
  print(view.layer.needsLayout())
  view.layer.frame = .init(x: 0, y: 0, width: 100, height: 100)
  print(view.layer.needsLayout())
}

do {
  print("🟡" + "update view.transform")
  view.transform = .init(translationX: 10, y: 10)
}

do {
  print("🟡" + "update layer.transform")
  view.layer.transform = CATransform3DMakeAffineTransform(.init(translationX: 10, y: 10))
}

do {
  print("🟡" + "update layer.transform + mark & layout")
  view.layer.transform = CATransform3DMakeAffineTransform(.init(translationX: 10, y: 10))
  print(view.layer.needsLayout())

  view.layer.setNeedsLayout()
  view.layer.layoutIfNeeded()
}
