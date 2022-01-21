
import UIKit

let container = UIView(frame: .init(x: 0, y: 0, width: 300, height: 300))

let subContainer = UIView(frame: .init(x: 20, y: 20, width: 100, height: 100))

let view = UIView(frame: .init(x: 20, y: 20, width: 30, height: 30))

container.addSubview(subContainer)
subContainer.addSubview(view)

view.convert(view.bounds, to: container)

view.transform = .init(scaleX: 2, y: 2)

view.convert(view.bounds, to: container)

