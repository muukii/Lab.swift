//: [Previous](@previous)

import Foundation

struct Value {
  
  var name: String
}

var value = Value(name: "Hello")

withUnsafeMutablePointer(to: &value) { (pointer) in
  
  pointer.pointee.name = "hoo"
  var moved = pointer.move()
  pointer.deinitialize(count: 1)
}

print(value)

//: [Next](@next)
