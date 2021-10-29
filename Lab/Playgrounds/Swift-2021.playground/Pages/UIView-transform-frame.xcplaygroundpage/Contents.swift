import UIKit

let view = UIView(frame: .init(x: 0, y: 0, width: 30, height: 60))

view.transform = .init(scaleX: 2, y: 2)

PT.assertEqual(view.frame.width, 60)


view.transform = .init(rotationAngle: CGFloat.pi / 2)
view.frame

view.transform = .init(rotationAngle: CGFloat.pi / 4)
view.frame
