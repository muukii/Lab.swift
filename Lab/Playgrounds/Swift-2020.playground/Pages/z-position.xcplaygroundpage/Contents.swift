import UIKit

let container = UIView(frame: .init(origin: .zero, size: .init(width: 120, height: 120)))
let view1 = UIView(frame: .init(origin: .zero, size: .init(width: 60, height: 60)))
view1.backgroundColor = .red
let view2 = UIView(frame: .init(origin: .zero, size: .init(width: 60, height: 60)))
view2.backgroundColor = .blue
view2.frame.origin = .init(x: 30, y: 30)

view1.addSubview(view2)
view1.clipsToBounds = true

container.addSubview(view1)
container

view2.layer.zPosition = 1
container
