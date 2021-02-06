//: [Previous](@previous)

import UIKit

public struct AspectRatio {
  
  public let width: CGFloat
  public let height: CGFloat
  
  public init(width: CGFloat, height: CGFloat) {
    self.width = width
    self.height = height
  }
  
  public init(_ cgSize: CGSize) {
    self.init(width: cgSize.width, height: cgSize.height)
  }
    
  public func height(forWidth: CGFloat) -> CGFloat {
    forWidth * (height / width)
  }
  
  public func width(forHeight: CGFloat) -> CGFloat {
    forHeight * (width / height)
  }
}

let aspect = AspectRatio(width: 4, height: 2)

aspect.width(forHeight: 4)
aspect.width(forHeight: 2)

aspect.height(forWidth: 4)

//: [Next](@next)
