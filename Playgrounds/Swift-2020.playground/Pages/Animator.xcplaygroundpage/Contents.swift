import UIKit



class MyView: UIView {
  
  @objc dynamic var myProperty: CGFloat = 0
  
  override func action(for layer: CALayer, forKey event: String) -> CAAction? {
    let action = super.action(for: layer, forKey: event)
    print(action, layer, event, UIView.inheritedAnimationDuration, UIView.areAnimationsEnabled)
    print(CAAnimation.defaultValue(forKey: "path"))
    return action
  }
}

let view = MyView()

view.frame.origin.y += 30

let animator = UIViewPropertyAnimator(
  duration: 0.5,
  timingParameters: UISpringTimingParameters(
    dampingRatio: 0.6,
    initialVelocity: CGVector(dx: 1, dy: 3)
  )
)

animator.addAnimations {
  view.frame.origin.y += 10
  view.myProperty += 10
}

animator.startAnimation()



//let anims = view.layer.animationKeys()!.compactMap {
//  view.layer.animation(forKey: $0)
//}

//anims.forEach {
//  print("")
//  debugPrint($0)
//}
