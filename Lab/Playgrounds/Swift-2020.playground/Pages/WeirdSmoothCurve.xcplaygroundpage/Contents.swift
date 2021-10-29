import UIKit


let path = UIBezierPath(roundedRect: .init(origin: .zero, size: .init(width: 200, height: 95)), cornerRadius: 18)


let cgPath = CGPath(roundedRect: .init(origin: .zero, size: .init(width: 200, height: 95)), cornerWidth: 18, cornerHeight: 18, transform: nil)
let p = UIBezierPath(cgPath: cgPath)
