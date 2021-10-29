
import UIKit

let view = UIView(frame: .init(x: 4, y: 4, width: 4, height: 4))

view.transform = .init(scaleX: 0.8, y: 0.8)

print(view.frame)

view.transform = .identity

print(view.frame)
view.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1)
print(view.frame)
