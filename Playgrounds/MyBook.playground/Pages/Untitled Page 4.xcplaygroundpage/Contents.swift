//: [Previous](@previous)

import Foundation

struct A {
  
  let name = ""
  
  struct B {
     
    struct A {
      
    }
  }
}

class AA {
  
  var pre: AA?
}


let a = ObjectIdentifier(A.self)
let b = ObjectIdentifier(A.B.A.self)

a == b
print("\(a)")
print("\(b)")

print(ObjectIdentifier(A.B.A.self))
print(ObjectIdentifier(A.B.A.self))
print(ObjectIdentifier(A.B.A.self))

print(ObjectIdentifier(\A.self))
print(ObjectIdentifier(\A.self))

print(ObjectIdentifier(\A.self))

A()

print(\AA.pre?.pre?.pre)
print(\AA.pre?.pre)
print(\AA.pre)

\AA.pre?.pre?.pre == \AA.pre


String(describing: \A.self)
print(\A.self)
//: [Next](@next)
