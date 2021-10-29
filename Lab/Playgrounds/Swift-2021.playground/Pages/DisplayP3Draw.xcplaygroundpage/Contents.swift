
import TinyConstraints
import UIKit

let appBlue02 = UIColor(
  intP3: 0x00C4CC,
  _unused_colorLiteral: #colorLiteral(red: 0, green: 0.768627451, blue: 0.8, alpha: 1)
)

print("Color-space", appBlue02.cgColor.colorSpace)

final class ShapeLayerView: UIView {
  override class var layerClass: AnyClass {
    CAShapeLayer.self
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let shapeLayer = layer as! CAShapeLayer

    shapeLayer.path = UIBezierPath(rect: bounds).cgPath
    shapeLayer.fillColor = appBlue02.cgColor
    print(shapeLayer.contentsFormat)
  }
}

final class ShapeRenderingView: UIView {
  override func draw(_ rect: CGRect) {
    let path = UIBezierPath(rect: bounds)
    appBlue02.setFill()
    path.fill()
  }
}

let _layer = ShapeLayerView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
let _rendering = ShapeRenderingView(frame: .init(origin: .zero, size: .init(width: 100, height: 100)))
