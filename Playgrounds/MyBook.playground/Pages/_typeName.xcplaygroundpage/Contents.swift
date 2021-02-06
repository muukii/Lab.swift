//: [Previous](@previous)

import Foundation

struct A {
  class B {
    struct C {
      
    }
  }
}

_typeName(type(of: A.B.C.self))
String(reflecting: type(of: A.B.C.self))
String(reflecting: A.B.C.self)

//: [Next](@next)
