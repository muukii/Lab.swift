
import UIKit

func make(
  topRight: CGFloat, topLeft: CGFloat, bottomRight: CGFloat, bottomLeft: CGFloat,
  size: CGSize
) -> UIBezierPath {

  let rect = CGRect(origin: .zero, size: size)

  let a = UIBezierPath(
    roundedRect: .init(x: 0, y: 0, width: rect.midX, height: rect.midY),
    byRoundingCorners: [.topLeft],
    cornerRadii: CGSize(width: topRight, height: topRight)
  )

  let b = UIBezierPath(
    roundedRect: .init(x: rect.midX, y: 0, width: rect.midX, height: rect.midY),
    byRoundingCorners: [.topRight],
    cornerRadii: CGSize(width: topLeft, height: topLeft)
  )

  let c = UIBezierPath(
    roundedRect: .init(x: 0, y: rect.midY, width: rect.midX, height: rect.midY),
    byRoundingCorners: [.bottomLeft],
    cornerRadii: CGSize(width: bottomLeft, height: bottomLeft)
  )

  let d = UIBezierPath(
    roundedRect: .init(x: rect.midX, y: rect.midY, width: rect.midX, height: rect.midY),
    byRoundingCorners: [.bottomRight],
    cornerRadii: CGSize(width: bottomRight, height: bottomRight)
  )

  let base = UIBezierPath()

  base.append(a)
  base.append(b)
  base.append(c)
  base.append(d)

  return base
}


let path = make(
  topRight: 2, topLeft: 4, bottomRight: 6, bottomLeft: 8,
  size: .init(width: 200, height: 120)
)

path

do {
  let path = make(
    topRight: 2, topLeft: 120, bottomRight: 6, bottomLeft: 8,
    size: .init(width: 200, height: 12)
  )

  path
}


let view = UIView(frame: .init(origin: .zero, size: .init(width: 120, height: 60)))

view.backgroundColor = .red

let mask = CALayer()
mask.frame = view.bounds
do {
  let shape = CAShapeLayer()

  let path = UIBezierPath(roundedRect: mask.bounds, byRoundingCorners: [.topLeft], cornerRadii: .init(width: 10, height: 10))
//  path.usesEvenOddFillRule = true

  shape.path = path.cgPath
  shape.fillRule = .nonZero
  shape.fillColor = UIColor.black.cgColor
  shape.frame = mask.bounds
  mask.addSublayer(shape)
}

//do {
//  let shape = CAShapeLayer()
//  shape.path = UIBezierPath(roundedRect: mask.bounds, byRoundingCorners: [.topRight], cornerRadii: .init(width: 10, height: 10)).reversing().cgPath
//  shape.fillColor = UIColor.black.cgColor
//  shape.frame = mask.bounds
//  mask.addSublayer(shape)
//}

view.layer.mask = mask

view
