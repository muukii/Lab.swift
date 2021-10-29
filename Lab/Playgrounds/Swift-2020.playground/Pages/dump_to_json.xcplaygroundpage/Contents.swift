//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

struct Item {
  var name = ""
  var num = 0
}

struct State {

  var name: String = "name_value"
  var items: [String] = ["a", "b", "c"]
  var elements: [Item] = [Item()]

}

let state = State()

func _dump<T>(value: T) {

  func _dump_inner<T>(value: T, dictionay: inout [String : Any]) {

    let mirror = Mirror(reflecting: value)

    guard let displayStyle = mirror.displayStyle else {
      print("error")
      return
    }

    switch displayStyle {
    case .struct:
      for child in mirror.children {
//        dictionay[child.label ?? "_error_"] =
      }
      break
    case .class:
      break
    case .enum:
      break
    case .tuple:
      break
    case .optional:
      break
    case .collection:
      break
    case .dictionary:
      break
    case .set:
      break
    }

  }
  var dic = [String : Any]()
  _dump_inner(value: value, dictionay: &dic)

  let data = try! JSONSerialization.data(withJSONObject: dic, options: [.prettyPrinted])

  print(String(data: data, encoding: .utf8))
}

_dump(value: state)

let m = Mirror(reflecting: state)

print(m.children)
for child in m.children {
  print(child.label, child.value)
}

do {

  let m = Mirror(reflecting: [1, 2, 3])

  print(m.children)
  m.displayStyle
  for child in m.children {
    print(child.label, child.value)
  }

}

do {

  let m = Mirror(reflecting: "b")

  print(m.children.count)
  m.displayStyle
  m.description
  m.customMirror
  for child in m.children {
    print(child.label, child.value)
  }

}
