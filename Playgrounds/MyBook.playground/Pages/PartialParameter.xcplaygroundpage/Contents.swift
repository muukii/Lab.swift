//: [Previous](@previous)

import Foundation

typealias JSON = String

protocol JSONConvertible {
  func make() -> JSON
}

extension Bool: JSONConvertible {
  func make() -> JSON {
    fatalError()
  }
}

struct UserSettingsPartialParameter : Hashable {
    
  let jsonKey: String
  let jsonValue: JSON
  
  init<Value: JSONConvertible>(key: String, value: Value) {
    self.jsonKey = key
    self.jsonValue = value.make()
  }
    
  func asJSONFragment() -> (String, JSON) {
    (jsonKey, "")
  }
  
}

extension UserSettingsPartialParameter {
  static func option1(isOn: Bool) -> UserSettingsPartialParameter { .init(key: "push", value: isOn) }
}

func update(_ parameters: [UserSettingsPartialParameter]) {
  parameters.forEach {
    $0.asJSONFragment()
  }
}

update([.option1(isOn: true)])


//: [Next](@next)
