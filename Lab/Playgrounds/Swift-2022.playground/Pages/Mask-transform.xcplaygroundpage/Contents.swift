
import UIKit

let view = UIView()
view.frame = .init(x: 0, y: 0, width: 200, height: 200)
view.backgroundColor = .blue

let mask = UIView()
mask.backgroundColor = .white
mask.layer.cornerRadius = 8

mask.frame = view.bounds
view.mask = mask

view

view.transform = .init(scaleX: 0.1, y: 0.1)
view.frame
view
