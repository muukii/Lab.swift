//: [Previous](@previous)

import UIKit

func setRadius(
  topRight: CGFloat,
  topLeft: CGFloat,
  bottomRight: CGFloat,
  bottomLeft: CGFloat,
  for rect: CGRect
) -> UIBezierPath {
  
  let path = UIBezierPath(rect: rect)
    
  let list: [(UIRectCorner, CGFloat)] = [
    (.topRight, topRight),
    (.topLeft, topLeft),
    (.bottomRight, bottomRight),
    (.bottomLeft, bottomLeft)
  ]
  
  for l in list {
    path.append(
      .init(
        roundedRect: rect,
        byRoundingCorners: [l.0],
        cornerRadii: .init(width: l.1, height: l.1)
      )
    )
  }
  
  path.usesEvenOddFillRule = true
  
  return path
}

let p = UIBezierPath(roundedRect: .init(x: 0, y: 0, width: 30, height: 30), cornerRadius: 20)

let path = setRadius(topRight: 50, topLeft: 25, bottomRight: 16, bottomLeft: 5, for: .init(x: 0, y: 0, width: 200, height: 200))

let layer = CAShapeLayer()
layer.frame = .init(x: 0, y: 0, width: 200, height: 200)
layer.path = path.cgPath
layer.fillRule = .evenOdd

layer.borderColor = UIColor.red.cgColor
layer.borderWidth = 2
layer.fillColor = UIColor.blue.cgColor
layer.backgroundColor = UIColor.clear.cgColor

let view = UIView(frame: layer.bounds)
view.layer.addSublayer(layer)

view

//: [Next](@next)
