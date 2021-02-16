//: [Previous](@previous)

import Foundation

class Key: Equatable {
  static func == (lhs: Key, rhs: Key) -> Bool {
    lhs === rhs && lhs.name == rhs.name
  }
  
  var name: String
  
  init(_ name: String) {
    self.name = name
  }
}

let cache = NSCache<Key, NSString>()

let a = Key("A")
cache.setObject("A", forKey: a)

cache.object(forKey: a)
cache.object(forKey: Key("A"))

//: [Next](@next)
