//: [Previous](@previous)

import Foundation

struct MyValue {
  
  class Buffer {}
  
  var buffer = Buffer()
  
  var name: String = "" {
    didSet {
      if isKnownUniquelyReferenced(&buffer) {
        print("cow")
      } else {
        print("copy")
      }
    }
  }
  
}

var source = MyValue()

var value = source

withUnsafePointer(to: value) { (pointer) -> Void in
  
}

withUnsafePointer(to: &value) { pointer in
  
}
