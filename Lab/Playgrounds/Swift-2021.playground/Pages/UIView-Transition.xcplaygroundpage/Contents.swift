//: [Previous](@previous)

import UIKit

extension UIView {

  func allAnimations() {
    let anims = layer.animationKeys()!.compactMap {
      layer.animation(forKey: $0)
    }

    anims.forEach {
      print("")
      debugPrint($0)
    }
  }

}

let containerView = UIView()

let fromView = UIView()
let toView = UIView()

containerView.addSubview(fromView)

UIView.transition(
  with: containerView,
  duration: 0.3,
  options: [.transitionCrossDissolve],
  animations: {},
  completion: { _ in

    fromView.removeFromSuperview()
    containerView.addSubview(toView)
  }
)

containerView.allAnimations()
fromView.layer.animationKeys()
toView.layer.animationKeys()

print(CATransition())
//: [Next](@next)
