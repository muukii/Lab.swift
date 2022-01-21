import UIKit

let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

visualEffectView.frame = .init(x: 0, y: 0, width: 30, height: 30)

UIViewPropertyAnimator(duration: 0.3, dampingRatio: 1) {
  visualEffectView.effect = UIBlurEffect(style: .dark)
}
.startAnimation()

let layer = CALayer()

layer.setValue(50, forKeyPath: "filters.gaussianBlur.inputRadius")
layer.value(forKeyPath: "filters.gaussianBlur.inputRadius")

let layerClass = NSClassFromString("UICABackdropLayer")

