
import UIKit
import Foundation

class View: UIView, CustomReflectable {
  
  var customMirror: Mirror {
    return .init(self, children: [("frame", frame)])
  }
}

let view = View()
view.description
view.debugDescription
view.customMirror.description
print(view)
