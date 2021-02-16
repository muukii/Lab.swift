import Foundation

func address(of object: UnsafeRawPointer) -> String {
  let addr = Int(bitPattern: object)
  return String(format: "%p", addr)
}

struct MyBox {
  
}

do {
  let string = "Hello"
  
  address(of: string)
  address(of: string)
}

do {
  
  let array = [2]
  
  address(of: array)
  address(of: array)
  
}

do {
  
  var array = [2]
  
  address(of: &array)
  address(of: &array)
  
}

do {
  
  var number: Int = 2
  
  address(of: &number)
  address(of: &number)
}

do {
  
  var value = MyBox()
  
  address(of: &value)
  address(of: &value)
}
