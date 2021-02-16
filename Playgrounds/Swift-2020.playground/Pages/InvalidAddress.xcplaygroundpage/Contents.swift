//: [Previous](@previous)

import UIKit

let view = UIView()

let pointer = Unmanaged.passUnretained(view).toOpaque()

// Take value from pointer
do {
  let v = unsafeBitCast(pointer, to: UIView.self)
  // check value is correct.
  v.bounds
}

// Take value from pointer
do {
  let v = Unmanaged<UIView>.fromOpaque(pointer).takeRetainedValue()
  // check value is correct.
  v.bounds
}


//view.bounds

//: [Next](@next)
