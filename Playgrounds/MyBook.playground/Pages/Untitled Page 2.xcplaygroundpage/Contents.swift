//: [Previous](@previous)

import Foundation

public struct ValueBox<Value> {
  var updatedAt: Date = .init()
  var value: Value {
    didSet {
      updatedAt = .init()
    }
  }
}

var value = ValueBox(value: "hhhe")

let old = value.updatedAt

value.value = ""

let new = value.updatedAt

print(old == new)

//: [Next](@next)
