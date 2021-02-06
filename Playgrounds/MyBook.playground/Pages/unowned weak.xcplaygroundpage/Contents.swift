//: [Previous](@previous)

import Foundation

class Object {

  init() {

  }

  deinit {
    print("deinit")
  }
}

var strong: Object! = Object()

unowned var _unowned = strong!

strong = nil

//withUnsafePointer(to: &_unowned) { (p) -> Void in
//
//}

//let pointer = Unmanaged.passUnretained(_unowned)
//let hoge = unsafeBitCast(pointer, to: Object?.self)

//weak var _weak = _unowned


//print(_weak)
