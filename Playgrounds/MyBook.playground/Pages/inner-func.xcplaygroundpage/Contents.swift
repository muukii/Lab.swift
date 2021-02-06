//: [Previous](@previous)

import Foundation

class Object {
  var retain: Any?

  func run() {
    retain = { [unowned self] in

      func hoge() {
        something()
      }

      hoge()

      something()
    }
  }

  func something() {}

  deinit {
    print("deinit")
  }
}

var o: Object? = Object()

o!.run()

o = nil

//: [Next](@next)
