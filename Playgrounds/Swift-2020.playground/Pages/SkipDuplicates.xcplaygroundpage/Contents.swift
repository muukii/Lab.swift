//: [Previous](@previous)

import Foundation
import Combine

let s = PassthroughSubject<Int, Never>.init()

s.removeDuplicates(by: ==)
  .sink { value in
    print(value)
}

s.send(1)
s.send(1)
s.send(2)
s.send(1)

//: [Next](@next)
