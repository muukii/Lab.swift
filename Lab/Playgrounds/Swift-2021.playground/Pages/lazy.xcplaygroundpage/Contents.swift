//: [Previous](@previous)

import Foundation

class Object {

  init(closure: @escaping () -> Void) {

  }
}

class My {

  private lazy var hoge: Object = Object.init { [weak self] in
    print(self as Any)
  }

}

print("my")


Array<Int>().index(before: 0)

//: [Next](@next)
