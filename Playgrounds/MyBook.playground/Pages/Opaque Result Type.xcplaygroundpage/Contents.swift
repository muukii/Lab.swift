//: [Previous](@previous)

import Foundation

struct MyObject {
  
  let a: Int8
  let b: Int8
  let c: Int8
    
}

class ClassMyObject {
  
  let a: Int8 = 0
  let b: String = ""
  let c: Int8 = 0
  
}

protocol MyProtocol {
  func run()
}

protocol ClassMyProtocol: AnyObject {
  func run()
}

struct Concrete: MyProtocol {
  let a = ""
  let b = ""
  let c = ""
  func run() {
    
  }
}

struct AConcrete: MyProtocol {
  let a = ""
  func run() {
    
  }
}

MemoryLayout<MyObject>.size

MemoryLayout<ClassMyObject>.size

MemoryLayout<ClassMyProtocol>.size

MemoryLayout<Any>.size

func afoo(_ object: MyProtocol) {
  MemoryLayout.size(ofValue: object)
  object.run()
}

func afoo() -> some MyProtocol {
  if false {
    return AConcrete()
  } else {
    return Concrete()
  }
}

func bfoo<O: MyProtocol>(_ object: O) {
  MemoryLayout.size(ofValue: object)
  object.run()
}

struct A: Hashable {}
struct B: Hashable {}
struct C: Hashable {}

var hoo: [AnyHashable] = []

hoo.append(A() as AnyHashable)

(A() as AnyHashable) as! A

afoo(Concrete())
bfoo(Concrete())

//: [Next](@next)
