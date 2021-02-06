import UIKit
var str = "Hello, playground"
//rect CGRect (origin = (x = 0, y = 0), size = (width = 130.66666666666666, height = 48))
let rect = CGRect(origin: .zero, size: .init(width: 330, height: 299))
let topRight: CGFloat = 2
let topLeft: CGFloat = 24
let bottomRight: CGFloat = 8
let bottomLeft: CGFloat = 24
let path = UIBezierPath()
//
//path.append(.init(roundedRect: rect, byRoundingCorners: .topRight, cornerRadii: .init(width: topRight, height: topRight)))
//path.append(.init(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: .init(width: topLeft, height: topLeft)))
//path.append(.init(roundedRect: rect, byRoundingCorners: .bottomLeft, cornerRadii: .init(width: bottomLeft, height: bottomLeft)))
//path.append(.init(roundedRect: rect, byRoundingCorners: .bottomRight, cornerRadii: .init(width: bottomRight, height: bottomRight)))

path.append(.init(roundedRect: rect, byRoundingCorners: .bottomRight, cornerRadii: .init(width: bottomRight, height: bottomRight)))
path.append(.init(roundedRect: rect, byRoundingCorners: .topRight, cornerRadii: .init(width: topRight, height: topRight)))
path.append(.init(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: .init(width: topLeft, height: topLeft)))
//path.append(.init(roundedRect: rect, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: .init(width: topLeft, height: topLeft)))

path.usesEvenOddFillRule = true

path



