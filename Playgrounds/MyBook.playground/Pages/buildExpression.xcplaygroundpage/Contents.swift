//: [Previous](@previous)

import UIKit

enum Component {
  case string(StaticString)
  case floating(Double)
  case color(UIColor)
  indirect case array([Component])
  indirect case optional(Component?)
}

@_functionBuilder
struct ComponentBuilder {
  static func buildExpression(_ string: StaticString) -> Component {
    return .string(string)
  }

  static func buildExpression(_ float: Double) -> Component {
    return .floating(float)
  }

  static func buildExpression(_ color: UIColor) -> Component {
    return .color(color)
  }

  static func buildBlock(_ components: [Component]) -> Component {
    return .array(components)
  }

  static func buildBlock(_ components: Component...) -> Component {
    return .array(components)
  }

  static func buildExpression(_ components: Component...) -> Component {
    return .array(components)
  }

  static func buildIf(_ value: Component?) -> Component {
    return .optional(value)
  }
}

func acceptComponentBuilder(@ComponentBuilder _ body: () -> Component) -> Component {
  body()
}

do {
  acceptComponentBuilder {
    "hello"
    if true {
      3.14159
    }
    .red
  }
}

do {
  let a = acceptComponentBuilder {
    Component.floating(10)
  }
  a
}

do {
  let a = acceptComponentBuilder {
    ""
    ""
  }
  a
}

do {
  let a = acceptComponentBuilder {
    10.0
    10.0
    Component.floating(10)
  }
  a
}



//: [Next](@next)
