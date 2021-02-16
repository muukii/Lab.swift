//: [Previous](@previous)

import UIKit

let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))

visualEffectView.subviews

var filters: [NSObject] = []
visualEffectView.subviews.forEach { subview in
  print(subview)
  print(subview.layer.filters)
  
  let f = (subview.layer.filters ?? []).compactMap { $0 as? NSObject }
  
  f.forEach {
    print(Unmanaged.passUnretained($0).toOpaque())
  }
  
  filters += f.map { $0.mutableCopy() as! NSObject }
}

filters.forEach { filter in
  print(Unmanaged.passUnretained(filter).toOpaque())
  print(filter)
  print(filter.value(forKey: "name"))
}

let blur = filters.filter { $0.value(forKey: "name") as! NSString == "gaussianBlur" }.first
blur?.perform("setDefaults")
blur?.setValue(2, forKey: "inputRadius")

let button = UIButton(type: .system)
button.setTitle("Hello", for: .normal)
button.sizeToFit()

button.layer.filters = [blur]

button

//: [Next](@next)
