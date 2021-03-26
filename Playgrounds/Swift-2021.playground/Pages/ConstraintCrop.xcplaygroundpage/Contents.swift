
import UIKit

let imageSize = CGSize.init(width: 200, height: 300)
var image = UIBezierPath(rect: .init(origin: .zero, size: imageSize))

let angle = 15 * (CGFloat.pi / 180)

let _cos = abs(cos(angle))
let _sin = abs(sin(angle))

let _width = imageSize.width * _cos + imageSize.height * _sin
let _height = imageSize.width * _sin + imageSize.height * _cos

CGRect(origin: .zero, size: imageSize).applying(.init(rotationAngle: angle))
