import UIKit

let label = UILabel()
label.text = "Hey"
label.layer.contentsFormat

dump(label.layer)

label.layer.perform(Selector("acceleratesDrawing"))
