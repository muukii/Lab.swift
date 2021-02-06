//: [Previous](@previous)

import UIKit

let layer = CALayer()
layer.bounds = .init(x: 0, y: 0, width: 300, height: 300)

layer.backgroundColor = UIColor.black.cgColor

layer.perform(Selector(("setContinuousCorners:")), with: NSNumber(booleanLiteral: true))
//layer.cornerCurve = .continuous
layer.cornerRadius = 30

let view = UIView(frame: layer.bounds)
view.backgroundColor = .white
view.layer.addSublayer(layer)
view


do {
  
  let image = #imageLiteral(resourceName: "download.jpeg")
  let imageView = UIImageView(image: image)
  imageView.intrinsicContentSize
  
  let containerView = UIView()
  containerView.frame.size = imageView.intrinsicContentSize
  containerView.addSubview(imageView)
  
  do {
    let shape = UIView()
    
    containerView.addSubview(shape)
    
    shape.frame = .init(x: 441, y: 609, width: 320, height: 320)
    shape.backgroundColor = UIColor(white: 0, alpha: 0.5)
    shape.layer.cornerRadius = 128
    shape.layer.cornerCurve = .continuous
  }
  
  do {
    let shape = UIView()
    
    containerView.addSubview(shape)
    
    shape.frame = .init(x: 20, y: 609, width: 320, height: 320)
    shape.backgroundColor = UIColor(white: 0.7, alpha: 1)
    shape.layer.cornerRadius = 128
    shape.layer.cornerCurve = .continuous
    
    shape
  }
  
  
  containerView
}

let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 80, height: 80), cornerRadius: 20)

path
