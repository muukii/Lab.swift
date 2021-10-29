//: [Previous](@previous)

import Foundation

class Model {
  
  private let lock = NSLock()
  
  var value: Int {
    get {
      lock.lock(); defer { lock.unlock() }
      return _value
    }
    set {
      lock.lock(); defer { lock.unlock() }
      _value = newValue
    }
  }
  
  private var _value: Int = 0
}


let model = Model()

let v = model.value

model.value = v + 10

//: [Next](@next)
