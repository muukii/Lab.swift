import Foundation
import QuartzCore
import UIKit
import SwiftUI

let label = UILabel()
label.text = "Hello"
label.sizeToFit()

let wrapper = UIView()
wrapper.addSubview(label)
wrapper.frame = label.frame

wrapper.alpha = 0

do {
  let snapshot = label.snapshotView(afterScreenUpdates: true)
  snapshot
}
