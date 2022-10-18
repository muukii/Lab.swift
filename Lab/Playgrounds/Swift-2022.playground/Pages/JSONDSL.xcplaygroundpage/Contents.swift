import Foundation

public protocol JSONView: Encodable {

  associatedtype Body: JSONView

  @JSONBuilder var body: Body { get }
}

extension JSONView {

  public func encode(to encoder: Encoder) throws {
    try body.encode(to: encoder)
  }

}

extension JSONView where Body == Never {

  @_spi(JSONNever)
  public var body: Body {
    fatalError()
  }

}

extension Never: JSONView {

  @_spi(JSONNever)
  public var body: JSONEmtpy {
    JSONEmtpy()
  }
}

public struct JSONEmtpy: JSONView, Decodable {

  public typealias Body = Never

}

public struct JSONNull: JSONView {
  public typealias Body = Never

}

public struct JSONBoolean: JSONView, Encodable {

  public typealias Body = Never

  public var value: Bool

  public init(_ value: Bool) {
    self.value = value
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }
}

public struct JSONNumber: JSONView, Encodable {

  public typealias Body = Never

  public var value: Int

  public init(_ value: Int) {
    self.value = value
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }

}

public struct JSONString: JSONView, Encodable {
  public typealias Body = Never

  public var value: String

  public init(_ value: String) {
    self.value = value
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(value)
  }

}

public struct JSONArray: JSONView, Encodable {

  public typealias Body = Never

  public var elements: [any JSONView]

  public init(@JSONArrayBuilder _ elements: () -> [any JSONView]) {
    self.elements = elements()
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    try elements.forEach {
      try container.encode($0)
    }
  }

}

public struct JSONObject: JSONView {

  public typealias Body = Never

  public var members: [JSONMember]

  init(@JSONObjectBuilder _ members: () -> [JSONMember]) {
    self.members = members()
  }

  public func encode(to encoder: Encoder) throws {
    try members.forEach {
      try $0.encode(to: encoder)
    }
  }

}

public struct JSONMember: JSONView {

  public typealias Body = Never

  struct CustomStringKey: CodingKey {
    var stringValue: String

    init?(stringValue: String) {
      self.stringValue = stringValue
    }

    var intValue: Int?

    init?(intValue: Int) {
      return nil
    }

  }

  public let name: String
  public let value: any JSONView

  public init(name: String, value: any JSONView) {
    self.name = name
    self.value = value
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CustomStringKey.self)
    try container.encode(value, forKey: .init(stringValue: name)!)
  }
}

@resultBuilder
public enum JSONBuilder {

  public static func buildExpression(_ expression: Bool) -> JSONBoolean {
    JSONBoolean(expression)
  }

  public static func buildExpression<J: JSONView>(_ component: J) -> J {
    component
  }

  public static func buildBlock() -> JSONEmtpy {
    .init()
  }

  public static func buildBlock<J: JSONView>(_ component: J) -> J {
    component
  }

}

@resultBuilder
public enum JSONObjectBuilder {

  public static func buildBlock() -> [JSONMember] {
    []
  }

  public static func buildBlock(_ component: JSONMember...) -> [JSONMember] {
    component
  }

}


@resultBuilder
public enum JSONArrayBuilder {
  
  public static func buildBlock() -> [any JSONView] {
    []
  }
  
  public static func buildBlock(_ component: any JSONView...) -> [any JSONView] {
    component
  }
  
}

///

struct MyComponent: JSONView {

  var body: some JSONView {
    JSONMember(
      name: "a",
      value: JSONArray {
        JSONMember(
          name: "a",
          value: JSONArray {
            
          }
        )
      }
    )

  }

}

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let o = JSONObject {

  JSONMember(
    name: "a",
    value: JSONArray {
      JSONMember(
        name: "a",
        value: JSONArray {

        }
      )
    }
  )

}

let c = MyComponent()

let data = try! encoder.encode(c)
print(String(data: data, encoding: .utf8)!)
