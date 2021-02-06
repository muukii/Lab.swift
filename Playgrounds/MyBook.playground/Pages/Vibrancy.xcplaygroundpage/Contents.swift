//: [Previous](@previous)

import UIKit
import ObjectiveC

class ContainerView: UIView {

  let imageView = UIImageView(image: #imageLiteral(resourceName: "muukii-color-square.jpg"))

  let label = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)

    imageView.frame = bounds

    addSubview(imageView)

    label.text = "Hello"
    label.font = .boldSystemFont(ofSize: 28)

    let effect = UIVibrancyEffect(blurEffect: UIBlurEffect(style: .dark), style: .label)
    let effectView = UIVisualEffectView(effect: effect)

    addSubview(effectView)

    effectView.frame = bounds
    label.sizeToFit()
    effectView.contentView.addSubview(label)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

let view = ContainerView(frame: .init(origin: .zero, size: .init(width: 300, height: 300)))


//: [Next](@next)

