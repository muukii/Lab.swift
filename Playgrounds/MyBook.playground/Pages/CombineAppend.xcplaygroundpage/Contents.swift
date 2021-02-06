//: [Previous](@previous)

import Combine

let s = CurrentValueSubject<Int, Never>.init(10)

let c = s.dropFirst()
  .append(1)
  .sink { value in
//    print(value)
}

s.dropFirst()
  .merge(with: Just(1))
  .sink { value in
    print(value)
}

s.send(2)
s.send(3)

struct Obj {
  var count = 0
}

withExtendedLifetime(c) {}

//: [Next](@next)
