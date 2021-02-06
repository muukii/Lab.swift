//: [Previous](@previous)

import Foundation

public indirect enum Component {

  case section(Section)
  case element(Element)
  case optional(Component?)
  case array([Component])
}

@_functionBuilder
struct ComponentBuilder {

  static func buildExpression(_ element: Element) -> Component {
    return .element(.init())
  }

  static func buildExpression(_ section: Section) -> Component {
    return .section(section)
  }

  static func buildBlock(_ components: [Element]) -> Component {
    return .array(components.map { .element($0) })
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

@_functionBuilder
struct ElementBuilder {

}

func build(@ComponentBuilder closure: () -> Component) -> Component {
  closure()
}

public struct Section {

  public let title: String
  public let component: Component

  public init(_ title: String, @ComponentBuilder closure: () -> Component) {
    self.title = title
    self.component = closure()
  }
}

public struct Element {

  public init() {

  }
}

let s = Section("") {
  Element()
  Element()
}

let elements = [
  Element(),
  Element(),
]

let c = build {
  Element()
  Element()
  Section("") {
    Element()
    Element()
    Section("") {
      Element()
      Element()
    }
    Section("") {
      Element()
      Element()
    }
  }
}

dump(c)

//: [Next](@next)
