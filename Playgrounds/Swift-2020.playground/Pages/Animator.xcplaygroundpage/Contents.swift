import UIKit

let view = UIView()

let animator = UIViewPropertyAnimator(
  duration: 0.3,
  timingParameters: UISpringTimingParameters(
    dampingRatio: 0.6,
    initialVelocity: CGVector(dx: 1, dy: 3)
  )
)

animator.addAnimations {
  view.frame.origin.y += 10
}

animator.startAnimation()

let anims = view.layer.animationKeys()!.compactMap {
  view.layer.animation(forKey: $0)
}

anims.forEach {
  print("")
  debugPrint($0)
}
