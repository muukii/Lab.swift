//: [Previous](@previous)

import Foundation

let array = [1, 2, 3, 4, 5, 6, 7, 8]

do {

  let slice = array[3 ..< 6]

  let c = AnyCollection(slice)

  c.first
}

do {
  
  print("===Array")
  
  let s = array.lazy.map { a -> Int in
    print("map")
    return a
  }
  
  let c = Array(s)
  
}

do {
  
  print("===AnyCollection")

  
  let s = array.lazy.map { a -> Int in
    print("map")
    return a
  }
  
  let c = AnyCollection(s)
    
}

//: [Next](@next)
