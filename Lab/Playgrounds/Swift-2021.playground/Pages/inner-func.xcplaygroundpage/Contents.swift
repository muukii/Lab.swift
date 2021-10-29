//: [Previous](@previous)

import Foundation

func run() -> String {

  return _run()

  func _run() -> String {
    "Hello"
  }
}

do {
  func run() -> String {

    let result = _run()

    func _run() -> String {
      "Hello"
    }

    return result
  }
}
//: [Next](@next)
