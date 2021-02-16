//: [Previous](@previous)

import Foundation

do {
  
  class Object {}
  
  let o = Object()
  
  let p = Unmanaged.passRetained(o).toOpaque()
  
  p.deallocate()
  
  // will crash
//  print(o)
  
}

do {
  
  class Object {}
  
  let o = Object()
  
  let p = Unmanaged.passRetained(o)
  
  p.toOpaque()
  // will crash
  //  print(o)
  
}

//: [Next](@next)
