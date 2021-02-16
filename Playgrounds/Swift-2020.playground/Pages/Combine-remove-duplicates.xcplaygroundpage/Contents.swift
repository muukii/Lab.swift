//: [Previous](@previous)

import Combine

let s = CurrentValueSubject<Int, Never>.init(0)

s.removeDuplicates(by: { a, b in
  print(a, b)
  return true
})
  .sink { _ in }

s.send(1)

//: [Next](@next)
