import UIKit

class MyClass {
  
}

let text = "Hello"

ObjectIdentifier(String.self)
ObjectIdentifier(UIColor.white).debugDescription
ObjectIdentifier(UIColor.white).debugDescription

let a = MyClass()
let b = MyClass()

a === b
ObjectIdentifier(a) == ObjectIdentifier(b)

ObjectIdentifier(a).debugDescription
ObjectIdentifier(b).debugDescription

