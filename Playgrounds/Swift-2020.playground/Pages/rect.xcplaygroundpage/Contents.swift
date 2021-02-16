import UIKit

let frame = CGRect(x: 0, y: 0, width: 320, height: 320)
let out = CGRect(x: 45, y: 15, width: 300, height: 30)
let view = CGRect(x: 30, y: 30, width: 30, height: 30)

view.intersection(frame)
view.intersection(out)
frame.intersection(view)

extension CGRect {

  func subtract(_ r2: CGRect) -> CGRect {

    let iRect = intersection(r2)

    

  }
}
