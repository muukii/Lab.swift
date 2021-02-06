//: [Previous](@previous)

import Foundation

struct A {
  
  struct B {
    
  }
  
  var b: B
}

let a = ObjectIdentifier(\A.b)
let b = ObjectIdentifier(\A.b)

PT.assertEqual(a, b)

//: [Next](@next)
