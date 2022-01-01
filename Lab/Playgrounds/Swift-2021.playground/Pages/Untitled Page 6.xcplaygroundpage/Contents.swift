//: [Previous](@previous)

import Foundation

struct MyValue {
  var name: String = "Hello"
  var age: Int = 18
}

MemoryLayout<MyValue>.size
MemoryLayout<MyValue>.alignment

let value = MyValue()

withUnsafePointer(to: value) { pointer in
  let ageOffset = MemoryLayout<MyValue>.offset(of: \.age)!
  let a = pointer
    .advanced(by: ageOffset)

  let v = UnsafeRawPointer(a)
    .assumingMemoryBound(to: Int.self)
    .pointee

  print(v)

}

var memories = ContiguousArray<Void>.init(
  repeating: (),
  count: MemoryLayout<MyValue>.size
)


