
import UIKit

let label = UILabel()

label.text = "Hello"
label.font = .boldSystemFont(ofSize: 20)
label.sizeToFit()

let image = UIGraphicsImageRenderer(size: .init(width: 100, height: 100))
  .image { (c) in
    
    c.cgContext.scaleBy(x: 2, y: 2)
    label.layer.render(in: c.cgContext)
  }

image
